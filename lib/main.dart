import 'package:flutter/material.dart';
import 'package:todolist/screens/addtaskstomorrow.dart';
import 'screens/todaypage.dart'; 
import 'screens/tomorrowpage.dart'; 
import 'package:flutter/services.dart'; 
import 'screens/signup.dart'; 
import 'screens/signin.dart'; 
import 'screens/addtask.dart';  
import 'screens/createpassword.dart'; 
import 'screens/password.dart'; 
import 'screens/varification.dart'; 
import 'package:todolist/Controllers/databasehelper.dart'; 
//import 'package:shared_preferences/shared_preferences.dart';  
var pgHome; 
String s; 
String code;  
void main() async{ 
 WidgetsFlutterBinding.ensureInitialized(); 
   SystemChrome.setPreferredOrientations( 
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]); 
      var db = DatabaseHelper(); 
   
       var isToken= await db.read(); 
                     if(isToken==true){
                       pgHome = TodayPage();
                     }
                     else{
                       pgHome = LoginPage1(); 
                     } 
   runApp(MyApp()); 
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp( 
      debugShowCheckedModeBanner: false, 
      theme: ThemeData(
     /*   brightness: Brightness.light,

        primarySwatch: Colors.grey,
        primaryColor: Colors.grey[50],
        primaryColorBrightness: Brightness.light,*/

        //this is what you want
        accentColor: Colors.grey[300],
        accentColorBrightness: Brightness.light,
      ),




      home: pgHome, 

 routes: {
       '/signUp'     : (BuildContext context)=>SignupPage(), 
       '/login'      : (BuildContext context)=>LoginPage1(), 
       '/todaypage'      : (BuildContext context)=>TodayPage(), 
       '/tomorrowpage'      : (BuildContext context)=>TomorrowPage(), 
      '/forgetpassword'      : (BuildContext context)=>Password(), 
      '/varification'      : (BuildContext context)=>Varification(s), 
      '/createpassword'      : (BuildContext context)=>CreatePassword(s, code), 
      '/addtask'      : (BuildContext context)=>AddTask(), 
      '/addtaskstomorrow'      : (BuildContext context)=>AddTaskTomorrow(),    

      },
 






    );
  }
}

