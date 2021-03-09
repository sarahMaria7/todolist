import 'dart:ui';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:todolist/Controllers/databasehelper.dart';
import 'package:flutter/material.dart';
import 'package:todolist/screens/todaypage.dart';
import 'signin.dart';





class SignupPage extends StatefulWidget {
  SignupPage({Key key}) : super(key: key);

  @override
  SignupPageState createState() => SignupPageState();
}


class SignupPageState extends State<SignupPage> {


  DatabaseHelper databaseHelper = new DatabaseHelper();
  String msgStatus = '';

  final TextEditingController _nameController = new TextEditingController();
  final TextEditingController _emailController = new TextEditingController();
  final TextEditingController _passwordController = new TextEditingController();
  final TextEditingController _confirmPassword = TextEditingController();


  _onPressed(){
    setState(() {
      if(_emailController.text.trim().toLowerCase().isNotEmpty &&
          _passwordController.text.trim().isNotEmpty ){
        databaseHelper.registerData(_nameController.text.trim(),_emailController.text.trim().toLowerCase(),

            _passwordController.text.trim(),_confirmPassword.text.trim()).whenComplete((){
          if(databaseHelper.status){
            _showDialog();
            msgStatus = 'Check email or password';
            print('if');
          }else{
            print('else');
            Navigator.pushReplacement(context,
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
              new ElevatedButton(

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

  read() async {
    final prefs = await SharedPreferences.getInstance();
    final key = 'token';
    final value = prefs.get(key ) ?? 0;
    if(value != '0'){
      Navigator.of(context).pushReplacement(
          new MaterialPageRoute(
            builder: (BuildContext context) => new TodayPage(),
          )
      );
    }
  }


  @override
  initState(){
    read(); 
    super.initState(); 
  }

  @override
  Widget build(BuildContext context) {



    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: Color.fromRGBO(240, 255, 232, 1),
      appBar: null,
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 40),
          height: MediaQuery.of(context).size.height - 50,
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
              Column(
                children: <Widget>[
                  _inputFile(label: "Name",controller: _nameController),
                  _inputFile(label: "Email", keyboardType: TextInputType.emailAddress,controller: _emailController),
                  _inputFile(label: "Password", obscureText: true,controller: _passwordController),
                  _inputFile(label: "Confirm Password ", obscureText: true,controller: _confirmPassword),
                ],
              ),
              Container(
                padding: EdgeInsets.only(top: 3, left: 3),
                child: MaterialButton(
                  minWidth: double.infinity,
                  height: 60,
                  onPressed:(){
                    _onPressed();
                    print(_nameController.text +" "+
                        _emailController.text +" "+
                        _passwordController.text +" "+_confirmPassword.text +" "
                    );
                  },
                  color: Color.fromRGBO(61, 167, 0, 1),
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50),
                  ),
                  child: Text(
                    "Sign up",
                    style: TextStyle( 
                      fontSize: 26,
                      color: Color(0xffeff5fa), 
                      fontFamily: "RobotoMedium", 
                    ),
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    "Already have an account?",
                    style: TextStyle(
                        color: Color(0xffc77ef9), fontSize: 16, 
                        fontFamily: "RobotoRegular"
                        ),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.pushReplacement(context,
                          MaterialPageRoute(builder: (context) => LoginPage1()));
                    },
                    child: Text(
                      " Sign in",
                      style: TextStyle(
                          fontWeight: FontWeight.w600,
                          decoration: TextDecoration.underline,
                          color: Color(0xff7718b9),
                          fontSize: 16, 
                          fontFamily: "RobotoBold",
                          ),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

















// we will be creating a widget for text field
  Widget _inputFile({label, obscureText = false, keyboardType = TextInputType.text,controller}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        SizedBox(
          height: 5,
        ),
        TextFormField(
          controller: controller,
          obscureText: obscureText,
          keyboardType: keyboardType,
          style: TextStyle(
            color: Color.fromRGBO(119, 24, 185, 1),
            fontSize: 20.7,
          ),
          decoration: InputDecoration(
            enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(
                color: Color(0xff7718b9),
              ),
            ),
            focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(
                color: Color(0xff7718b9),
              ),
            ),
            hintText: label,
            hintStyle: TextStyle(
              color: Color(0x807718b9),
              fontSize: 16.0,
              fontFamily: "RobotoMedium",
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

}
