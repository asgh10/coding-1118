import 'package:flutter/material.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int number = 0;

  double logoLeft = 0;
  double logoTop = 0;
  double logoWidth = 170;
  double logoHeight = 120;

  double cargoLeft = 30;
  double cargoTop = 60;
  double cargoWidth = 165;
  double cargoHeight = 230;

  double driverLeft = 220;
  double driverTop = 60;
  double driverWidth = 165;
  double driverHeight = 230;

  double adLeft = 30;
  double adTop = 350;
  double adWidth = 356;
  double adHeight = 79;

  double etc1Left = 30;
  double etc1Top = 480;
  double etc1Width = 165;
  double etc1Height = 230;

  double etc2Left = 220;
  double etc2Top = 480;
  double etc2Width = 165;
  double etc2Height = 230;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false, // 왼쪽 햄버거 제거
        backgroundColor: Colors.green,
        elevation: 2.0,
        toolbarHeight: 90,
        titleSpacing: 10,
        title: Row(
          children: [
            Transform.translate(
              offset: Offset(logoLeft, logoTop),
              child: SizedBox(
                width: logoWidth,
                height: logoHeight,
                child: Image.network(
                  'https://i.imgur.com/3fd1e4c.png',
                  fit: BoxFit.contain,
                ),
              ),
            ),
            const SizedBox(width: 8),
            const Text(
              "",
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 22,
              ),
            ),
          ],
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications_none, color: Colors.white, size: 30),
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('알림 버튼 클릭됨')),
              );
            },
          ),
          Builder(
            builder: (context) => IconButton(
              icon: const Icon(Icons.menu, color: Colors.white, size: 31),
              onPressed: () => Scaffold.of(context).openDrawer(),
            ),
          ),
        ],
      ),

      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: const [
            DrawerHeader(
              decoration: BoxDecoration(color: Colors.green),
              child: Text(
                '',
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
            ),
            ListTile(
              title: Text('계정관리'),
            ),
            
            ListTile(
              title: Text('기사 관리'),
            ),

          ListTile(
            title: Text('채팅기록'),
          ),

            ListTile(
              title: Text('신청서 내역'),
            ),
            
            ListTile(
              title: Text('설정'),
            ),
            
            ListTile(
              title: Text('고객지원'),
              
            ),
          ],
        ),
      ),

      body: Stack(
        children: [
          _buildButton("화물", cargoLeft, cargoTop, cargoWidth, cargoHeight),
          _buildButton("기사", driverLeft, driverTop, driverWidth, driverHeight),
          _buildButton("광고", adLeft, adTop, adWidth, adHeight),
          _buildButton("미정", etc1Left, etc1Top, etc1Width, etc1Height),
          _buildButton("미정", etc2Left, etc2Top, etc2Width, etc2Height),
        ],
      ),

      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.green,
        onPressed: () {
          setState(() {
            number++;
          });
        },
        child: const Icon(Icons.add, color: Colors.white),
      ),
    );
  }

  Widget _buildButton(String text, double left, double top, double width, double height) {
    return Positioned(
      left: left,
      top: top,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.green,
          fixedSize: Size(width, height),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          elevation: 6,
        ),
        onPressed: () {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('$text 버튼 클릭됨')),
          );
        },
        child: Text(
          text,
          style: const TextStyle(
            fontSize: 18,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}

/*

Flutter에는 크게 두 가지 화면 유형이 있다
1. StatelessWidget: 화면의 상태가 바뀌지 않는 경우
2. StatefulWidget: 화면의 상태가 바뀔 수 있는 경우

logoLeft, logoTop 등은 로고의 위치를 나타내고, logoWidth, logoHeight는 크기를 나타낸다
즉 화면 요소의 위치와 크기를 변수로 관리하는 것

일반적인 파이썬에서는 변수의 값이 변경되면 끝이다 하지만 Flutter에서는 화면에 표시되는 값이 변경됐을 때 화면도 다시 그려야 한다 그래서 사용하는 것이 setState()다
쉽게 말하면
1. number의 값을 1 증가시킨다
2. setState()가 상태가 변경됐다는 것을 Flutter에 알린다
3. Flutter가 화면을 다시 그린다
여기서 setState()는 Flutter에서 화면을 갱신할 때 사용하는 중요한 기능이다

위젯 다른 코드들과 다르며 화면을 만들 때 사용하는 것이다

Scaffold	    기본적인 화면 구조
AppBar	        상단 제목 표시 영역
Stack	        위젯을 겹치거나 원하는 위치에 배치
Column	        위젯을 세로로 배치
Row	위젯을       가로로 배치
Container	    공간 및 디자인 설정
Text	        글자 표시
Image	        이미지 표시

파이썬에서는 print()를 사용해 글자를 출력하지만 Flutter에서는 Text()를 사용해서 화면에 글자를 표시하는 식이다

버튼을 만드느 함수

Widget _buildButton(
  String text,
  double left,
  double top,
  double width,
  double height
)

파이썬과 비교하자면 

def build_button(text, left, top, width, height):
    pass

차이점은 Dart에서는 반환할 자료형을 함수 앞에 적는다는 거다 ( 자바와 비슷 ) 

알아 두면 좋은 점
onPressed: 버튼을 눌렀을 때 실행할 동작
() { }: 익명 함수(이름이 없는 함수)
SnackBar: 화면 아래쪽에 잠깐 나타나는 알림

파이썬과 비교
def button_clicked():
    print("버튼 클릭됨")

'$text 버튼 클릭됨'
이건 Dart의 문자열 보간이다
파이썬의 f-string과 같은 개념이다

반복문, 조건문, 함수 등 모두 자바와 비슷하다
예:
void main() {
  for (int i = 0; i < 5; i++) {
    print(i);
  }
}

알아야 할 문법

const	    컴파일 시점에 값이 정해지는 상수
final	    한 번만 값을 할당할 수 있는 변수
var	        값으로 자료형을 추론
List	    여러 데이터를 저장하는 목록
Map	        키와 값으로 데이터를 저장
=>	        간단한 함수 표현
null	    값이 없음을 의미




import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        body: Center(
          child: Text("Hello Flutter!"),
        ),
      ),
    ),
  );
}
이 코드는 화면에 Hello Flutter!라는 글자를 보여주는 앱이다
각각의 역할은 다음과 같다
코드	                역할
import	        외부 라이브러리 가져오기
runApp()	    Flutter 앱 실행
MaterialApp	    앱의 기본 설정
Scaffold	    앱 화면의 기본 구조
Center	        가운데 정렬
Text	        글자 표시
여기서 가장 중요한 개념은 Flutter는 위젯을 조립해서 화면을 만든다는 것이다
레고 블록을 조립하는 것과 비슷함


*/