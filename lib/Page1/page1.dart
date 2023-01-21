import 'package:flutter/material.dart';
import 'package:flutter_basic/Page1/resultPage.dart';

class Page1 extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return MaterialApp(
      title: "비만도 계산기",
      theme: ThemeData(primarySwatch: Colors.cyan),
      home: BmiMain(),
    );
  }
}
class BmiMain extends StatefulWidget{
  _BmaMainState createState() => _BmaMainState();
}

class _BmaMainState extends State<BmiMain>{
  final _formKey = GlobalKey<FormState>();

  final _heightController = TextEditingController();
  final _weightController = TextEditingController();

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(title:Text("비만도계산기")),
      body: Container(
        padding: EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
              children: <Widget>[
                TextFormField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: "키",
                  ),
                  controller: _heightController,
                  keyboardType: TextInputType.number,
                  validator: (value){
                    if(value!=null && value.trim().isEmpty){
                      return "키를 입력하세요";
                    }
                    return null;
                  },
                ),
                SizedBox(height: 16.0,),
                TextFormField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: "몸무게",
                  ),
                  controller: _weightController,
                  keyboardType: TextInputType.number,
                  validator: (value){
                    if(value!=null && value.trim().isEmpty){
                      return "몸무게를 입력하세요";
                    }
                    return null;
                  },
                ),
                Container(
                  margin: const EdgeInsets.all(16.0),
                  alignment: Alignment.centerRight,
                  child: ElevatedButton(
                    onPressed: (){
                      final form = _formKey.currentState;
                      if(form!=null && form.validate()){
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => BmiResult(
                              double.parse(_heightController.text.trim()),
                              double.parse(_weightController.text.trim()))),
                        );
                      }
                    },
                    child:Text("결과"),
                  ),
                )
              ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose(){
    _heightController.dispose();
    _weightController.dispose();
    super.dispose();
  }


}