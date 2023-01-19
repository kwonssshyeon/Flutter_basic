import 'package:flutter/material.dart';

//앱 시작 부분
/*void main() => runApp(MyApp());*/ //같은 코드임
void main() {
  runApp(const MyApp());
}

//시작 클래스, 머티리얼 디자인 앱 생성
//StatelessWidget 한번 그려진 후 다시 그려지지 않는 위젯
//MaterialApp의 인스턴스를 작성해 반환
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),    //표시할 화면의 인스턴스
    );
  }
}

//시작 클래스가 실제로 표시하는 클래스, 카운터 앱 화면
//상태가 있는 클래스는 StatefulWidget을 상속
//createState()는 StatefulWidget이 생성될때 한번만 실행됨
class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

//위 Myhomepage 클래스의 상태를 나타내는 State클래스
//코드는 사실살 여기에다 다 작성
class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0; //카운터 숫자

  //변수를 1증가시키고 화면을 다시 그리는 메서드
  void _incrementCounter() {
    setState(() {   //build()메서드가 다시 실행되도록 하는 함수 State클래스가 제공한다.
      _counter++;
    });
  }

  //화면에 UI를 그리는 메서드 , 그려질 메서드를 반환
  @override
  Widget build(BuildContext context) {
    return Scaffold(    //머티리얼 디자인 기본 뼈대 위젯
      appBar: AppBar(   //상단 앱바
        title: Text(widget.title),
      ),
      body: Center(     //표시할 내용
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',    //카운터 변수 표시(정수를 문자열로 변경하기 위해 $를 사용
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,     //클릭시 incrementCouter메서드 실행
        tooltip: 'Increment',             //길게누르면 Increment글자 표시됨
        child: const Icon(Icons.add),     //상단 앱바
      ),
    );
  }
}
