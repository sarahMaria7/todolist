import 'dart:ui';
import 'package:flutter/material.dart';
import 'varification.dart';

class Password extends StatefulWidget {
  Password({Key key}) : super(key: key);

  @override
  PasswordState createState() => PasswordState();
}


class PasswordState extends State<Password> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: Color.fromRGBO(240, 255, 232, 1),
      appBar: AppBar(
        title: Text('Change Password'),
        centerTitle: true,
        elevation: 0,
        brightness: Brightness.light,
        backgroundColor: Color.fromRGBO(119, 24, 185, 1),
        shape: ContinuousRectangleBorder(
          borderRadius: const BorderRadius.only(
            bottomRight: Radius.circular(50.0),
            bottomLeft: Radius.circular(50.0),
          ),
        ),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back_ios,
            size: 20,
            color: Colors.white,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 40),
          height: MediaQuery.of(context).size.height - 50,
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Column(
                children: <Widget>[
                  Image.asset(
                    'assets/images/Cap.png',
                    fit: BoxFit.contain,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Enter your address Email",
                    style: TextStyle(
                      fontSize: 19,
                      color: Color.fromRGBO(119, 24, 185, 1),
                    ),
                  )
                ],
              ),
              Column(
                children: <Widget>[
                  inputFile(label: "Address Email"),
                ],
              ),
              Container(
                padding: EdgeInsets.only(top: 3, left: 3),
                child: MaterialButton(
                  minWidth: double.infinity,
                  height: 60,
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => Varification()));
                  },
                  color: Color.fromRGBO(61, 167, 0, 1),
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50),
                  ),
                  child: Text(
                    "Send",
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 26,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// we will be creating a widget for text field
Widget inputFile({label, obscureText = false}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: <Widget>[
      TextField(
        keyboardType: TextInputType.emailAddress,
        obscureText: obscureText,
        style: TextStyle(
          color: Color.fromRGBO(119, 24, 185, 1),
          fontSize: 20.7,
        ),
        decoration: InputDecoration(
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(
              color: Color.fromRGBO(119, 24, 185, 1),
            ),
          ),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(
              color: Color.fromRGBO(119, 24, 185, 1),
            ),
          ),
          hintText: label,
          hintStyle: TextStyle(
              color: Color.fromRGBO(119, 24, 185, 1),
              fontWeight: FontWeight.w300),
          contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 10),
        ),
      ),
      SizedBox(
        height: 10,
      )
    ],
  );
}
