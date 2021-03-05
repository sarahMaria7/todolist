import 'dart:ui';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:todolist/Controllers/databasehelper.dart';
import 'package:flutter/material.dart';
import 'package:todolist/screens/todaypage.dart';
import 'signup.dart';
import 'password.dart';

class LoginPage1 extends StatefulWidget {
  LoginPage1({Key key}) : super(key: key);

  @override
  LoginPageState createState() => LoginPageState();
}


class LoginPageState extends State<LoginPage1> {


  read() async {
    final prefs = await SharedPreferences.getInstance();
    final key = 'token';
    final value = prefs.get(key ) ?? 0;
    if(value != '0'){
      Navigator.of(context).push(
          new MaterialPageRoute(
            builder: (BuildContext context) => new TodayPage(),
          )
      );
    }
  }

  @override
  initState(){
    read();
  }




  DatabaseHelper databaseHelper = new DatabaseHelper();
  String msgStatus = '';

  final TextEditingController _emailController = new TextEditingController();
  final TextEditingController _passwordController = new TextEditingController();

  _onPressed(){
    setState(() {
      if(_emailController.text.trim().toLowerCase().isNotEmpty &&
          _passwordController.text.trim().isNotEmpty ){
        databaseHelper.loginData(_emailController.text.trim().toLowerCase(),
            _passwordController.text.trim()).whenComplete((){
          if(databaseHelper.status){
            _showDialog();
            msgStatus = 'Check email or password';
          }else{
            print('else');
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => TodayPage()));
          }
        });
      }
    });
  }

  void _showDialog(){
    showDialog(
        context:context ,
        builder:(BuildContext context){
          return AlertDialog(
            title: new Text('Failed'),
            content:  new Text('Check your email or password'),
            actions: <Widget>[
              new RaisedButton(

                child: new Text(
                  'Close',
                ),

                onPressed: (){
                  Navigator.of(context).pop();
                },

              ),
            ],
          );
        }
    );
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Color.fromRGBO(240, 255, 232, 1),
      appBar: null,
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Expanded(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Column(
                  children: <Widget>[
                    Image.asset(
                      'assets/images/LogoPapers.png',
                      fit: BoxFit.contain,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                  ],
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 40),
                  child: Column(
                    children: <Widget>[
                      inputFile(label: "Email", keyboardType: TextInputType.emailAddress,controller: _emailController),
                      inputFile(label: "Password", obscureText: true,controller: _passwordController),
                      InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Password()));
                        },
                        child: Text(
                          "Forget password?",
                          style: TextStyle(
                            color: Color(0xff7718b9),
                            fontSize: 16, 
                            fontFamily: "RobotoRegular", 
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 40),
                  child: Container(
                    padding: EdgeInsets.only(top: 3, left: 3),
                    child: MaterialButton(
                      minWidth: double.infinity,
                      height: 60,
                      onPressed: _onPressed,
                      color: Color.fromRGBO(61, 167, 0, 1),
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50),
                      ),
                      child: Text(
                        "Sign in",
                        style: TextStyle(
                          //fontWeight: FontWeight.w600,
                          fontSize: 26,
                          color: Color(0xffeff5fa), 
                          fontFamily: "RobotoMedium", 
                        ),
                      ),
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      "No account yet?",
                      style: TextStyle(
                        color: Color(0xffa27bbc),
                        fontSize: 16, 
                        fontFamily: "RobotoRegular"
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => SignupPage()));
                      },
                      child: Text(
                        " Sign up",
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          color: Color(0xff7718b9), 
                          fontSize: 16, 
                          fontFamily: "RobotoBold", 
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    )
                  ],
                ),
              ],
            ))
          ],
        ),
      ),
    );
  }
}

// we will be creating a widget for text field
Widget inputFile(
    {label, obscureText = false, keyboardType = TextInputType.text,controller}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: <Widget>[
      SizedBox(
        height: 5,
      ),
      TextField(
        controller: controller,
        keyboardType: keyboardType,
        obscureText: obscureText,
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
          hintText: label,
          hintStyle: TextStyle(
              color: Color(0x807718b9),
            ),
          contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 10),
        ),
      ),
      SizedBox(
        height: 10,
      )
    ],
  );



}
