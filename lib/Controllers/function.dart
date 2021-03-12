import 'package:flutter/material.dart';
import 'databasehelper.dart'; 
//import 'package:todolist/screens/signin.dart'; 

fctExit(BuildContext context)async {
    var db = DatabaseHelper();
    await db.logOut();
   Navigator.of(context).pushReplacementNamed('/login');
  
//Navigator.of(context).pushReplacement(MaterialPageRoute(
      //builder: (BuildContext context)=>LoginPage1()));

   /* Future.delayed(const Duration(milliseconds: 1000), () {
        SystemChannels.platform.invokeMethod('SystemNavigator.pop');
    });*/
}