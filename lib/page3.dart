import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';


class Todo{
  bool isDone;
  String title;

  Todo(this.title,{this.isDone = false});
}


class Page3 extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return MaterialApp(
      title : "할 일 관리",
      theme: ThemeData(
        primarySwatch: Colors.lime,
      ),
      home: TodoListPage(),
    );
  }
}

class TodoListPage extends StatefulWidget{
  @override
  _TodoListPageState createState() => _TodoListPageState();
}

class _TodoListPageState extends State<TodoListPage>{

  var _todoController = TextEditingController();


  @override
  void dispose(){
    _todoController.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context){
    return Scaffold(
      resizeToAvoidBottomInset : false,
      appBar: AppBar(title: Text("남은 할 일"),),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                Expanded(
                  child: TextField(
                    controller: _todoController,
                  ),
                ),
                ElevatedButton(
                  child: Text("추가"),
                  onPressed: () => _addTodo(Todo(_todoController.text)),
                ),
              ],
            ),
            StreamBuilder<QuerySnapshot>(
              stream: FirebaseFirestore.instance.collection('todo').snapshots(),
              builder: (context, snapshot) {
                if(!snapshot.hasData){
                  return CircularProgressIndicator();
                }

                final documents = snapshot.data!.docs;
                return Expanded(
                  child: ListView(
                    children: documents.map((doc) => _buildItemWidget(doc)).toList(),
                  ),
                );
              }
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildItemWidget(DocumentSnapshot doc){
    final todo = Todo(doc['title'],isDone: doc['isDone']);
    return ListTile(
      onTap: () => _toggleTodo(doc),
      title: Text(
          todo.title,
          style: todo.isDone
              ? TextStyle(decoration: TextDecoration.lineThrough,
              fontStyle: FontStyle.italic)
              :null
      ),
      trailing: IconButton(
        icon: Icon(Icons.delete_forever),
        onPressed: () => _deleteTodo(doc),
      ),
    );
  }

  void _addTodo(Todo todo){
    FirebaseFirestore.instance
        .collection('todo').add({'title':todo.title, 'isDone':todo.isDone});
    _todoController.text = '';
  }
  void _deleteTodo(DocumentSnapshot doc){
    FirebaseFirestore.instance
        .collection('todo').doc(doc.id).delete();
  }
  void _toggleTodo(DocumentSnapshot doc){
    FirebaseFirestore.instance
        .collection('todo').doc(doc.id).update({
      'isDone': !doc['isDone'],
    });
  }

}