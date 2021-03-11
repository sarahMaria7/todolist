import 'package:flutter/material.dart';
import 'package:todolist/Controllers/databasehelper.dart';
import 'todaypage.dart';



class AddTask extends StatefulWidget{

  AddTask({Key key}) : super(key : key);




  @override
  AddTaskState  createState() => AddTaskState();
}

class AddTaskState extends State<AddTask> {
  DatabaseHelper db = new DatabaseHelper();



  final TextEditingController _nameController = new TextEditingController();




  @override
  Widget build(BuildContext context) {

    return Scaffold(
        appBar: AppBar(
          title:  Text('Add Task'), 
          backgroundColor: Color(0xff7718b9), 
        ),
        body: Container(
          child: ListView(
            padding: const EdgeInsets.only(top: 62,left: 12.0,right: 12.0,bottom: 12.0),
            children: <Widget>[
              Container(
                height: 50,
                child: new  TextField(
        controller: _nameController,
        keyboardType: TextInputType.text, 
        style: TextStyle(
          color: Color(0x807718b9), 
          fontSize: 16.0, 
          fontFamily: "RobotoMedium", 
        ),
        decoration: InputDecoration(
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(
              color: Color(0x807718b9),
            ),
          ),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(
              color: Color(0x807718b9),
            ),
          ),
          hintText: "name of task", 
          hintStyle: TextStyle(
              color: Color(0x807718b9),
            ),
          contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 10),
        ),
      ), 
              ),

            
              new Padding(padding: new EdgeInsets.only(top: 44.0),),

              Container(
                height: 50,
                child: new ElevatedButton(
                  onPressed: (){ 
                    if(_nameController.text.trim().length !=0){
                    
                    db.addData(
                        _nameController.text.trim());
                    Navigator.of(context).push(
                        new MaterialPageRoute(
                          builder: (BuildContext context) => new TodayPage(),
                        )
                    ); 
                    }
                    
                  },
                  style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Color(0xff7718b9))),
                  //color: Color(0xff7718b9), 
                  child: new Text(
                    'Add',
                    style: new TextStyle(
                        color: Colors.white,
                        backgroundColor: Color(0xff7718b9)),),
                ),
              ),


            ],
          ),
        ),
      
    );
  }



}

