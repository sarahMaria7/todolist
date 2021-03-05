import 'dart:ui';

import 'package:flutter/material.dart';
import 'signin.dart';




class SignupPage extends StatefulWidget {
  SignupPage({Key key}) : super(key: key);

  @override
  SignupPageState createState() => SignupPageState();
}


class SignupPageState extends State<SignupPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: Color.fromRGBO(240, 255, 232, 1),
      appBar: null,
      body: Container(
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
                inputFile(label: "Name"),
                inputFile(
                    label: "Email", keyboardType: TextInputType.emailAddress),
                inputFile(label: "Password", obscureText: true),
                inputFile(label: "Confirm Password ", obscureText: true),
              ],
            ),
            Container(
              padding: EdgeInsets.only(top: 3, left: 3),
              child: MaterialButton(
                minWidth: double.infinity,
                height: 60,
                onPressed: () {},
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
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => LoginPage()));
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
    );
  }
}

// we will be creating a widget for text field
Widget inputFile({label, obscureText = false, keyboardType = TextInputType.text}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: <Widget>[
      SizedBox(
        height: 5,
      ),
      TextField(
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
