import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_basic/Page1/page1.dart';
import 'package:flutter_basic/page2.dart';
import 'package:flutter_basic/page3.dart';
import 'package:flutter_basic/Page4/page4.dart';
import 'package:firebase_core/firebase_core.dart';


//앱 시작 부분
/*void main() => runApp(MyApp());*/ //같은 코드임
void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '플러터 연습',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),    //표시할 화면의 인스턴스
    );
  }
}


class MyHomePage extends StatefulWidget{
  @override
  MyHomePageState createState() => MyHomePageState();

}

class MyHomePageState extends State<MyHomePage>{
  var _index = 0;
  var _pages = [
    Page1(),
    Page2(),
    Page3(),
    Page4(),
  ];

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text('나중에 동적으로 수정하기'),
      ),
      body: _pages[_index],
      bottomNavigationBar: Theme(
        data: Theme.of(context).copyWith(canvasColor: Colors.black),
        child: BottomNavigationBar(
          onTap:(index){
            setState(() {
              _index = index;
            });
          },
          currentIndex: _index,

          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(label:"비만도",icon: Icon(Icons.tag_faces),),
            BottomNavigationBarItem(label:"스톱워치",icon: Icon(Icons.tag_faces),),
            BottomNavigationBarItem(label:"할 일",icon: Icon(Icons.tag_faces),),
            BottomNavigationBarItem(label:"메신저",icon: Icon(Icons.tag_faces),),
          ],
        ),
      ),
    );
  }
}



