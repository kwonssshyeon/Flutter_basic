
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class ChatPage extends StatefulWidget{
  const ChatPage({Key? key}):super(key: key);

  @override
  _ChatPageState createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage>{
  final _authentication = FirebaseAuth.instance;
  User? loggedUser;

  @override
  void initState(){
    super.initState();
    getCurrentUser();
  }


  void getCurrentUser(){
    try{
      final user = _authentication.currentUser;
      if(user!=null){
        loggedUser = user;
        print(loggedUser!.email);
      }
    }
    catch(e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text('채팅 화면'),
        actions: [
          IconButton(
            onPressed: (){
              _authentication.signOut();
              Navigator.pop(context);
            },
            icon: Icon(Icons.exit_to_app_sharp,
              color: Colors.white,
            ),
          ),
        ],
      ),
      body: Center(
        child: Text("채팅화면"),
      ),
    );
  }

}