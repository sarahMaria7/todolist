import 'package:flutter/material.dart';
//import 'screens/todaypage.dart'; 
//import 'screens/tomorrowpage.dart'; 
import 'package:flutter/services.dart'; 
import 'screens/signup.dart'; 
import 'screens/signin.dart'; 
//import 'screens/createpassword.dart'; 
//import 'screens/password.dart'; 
//import 'screens/varification.dart';  
void main() { 
 WidgetsFlutterBinding.ensureInitialized(); 
   SystemChrome.setPreferredOrientations( 
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]); 
  runApp(MyApp()); 
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp( 
      debugShowCheckedModeBanner: false, 
      theme: ThemeData(
        primarySwatch: Colors.blue,
       
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ), 





      home: SignupPage(),
    );
  }
}

