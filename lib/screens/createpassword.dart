import 'dart:ui';
import 'package:flutter/material.dart';


class CreatePassword extends StatefulWidget {
  CreatePassword({Key key}) : super(key: key);

  @override
  CreatePasswordState createState() => CreatePasswordState();
}


class CreatePasswordState extends State<CreatePassword> {

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
                    fit: BoxFit.fill,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Create a new password",
                    style: TextStyle(
                      fontSize: 19,
                      color: Color.fromRGBO(119, 24, 185, 1),
                    ),
                  )
                ],
              ),
              Column(
                children: <Widget>[
                  inputFile(label: 'New password', obscureText: true),
                  inputFile(label: 'Confirm password', obscureText: true),
                ],
              ),
              Container(
                padding: EdgeInsets.only(top: 3, left: 3),
                child: MaterialButton(
                  minWidth: double.infinity,
                  height: 60,
                  onPressed: () {
                    showDialog(
                        context: context,
                        builder: (_) => Dialog(
                          insetPadding: EdgeInsets.only(bottom: 240,top: 240,right: 100,left: 100),
                              elevation: 0,
                              backgroundColor: Colors.transparent,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  BackdropFilter(
                                    filter: ImageFilter.blur(
                                      sigmaX:10,
                                      sigmaY:10,
                                    ),
                                    child:  Container(
                                      alignment: Alignment.center,
                                      child:  Image.asset(
                                        'assets/images/Done.png',
                                        fit: BoxFit.contain,
                                      ),
                                    ),
                                  ),
                                  Text(
                                    'Done',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Color.fromRGBO(119, 24, 185, 1),
                                        fontSize: 50),
                                  )
                                ],
                              ),
                            )).then((value) =>
                        //سيتم تغيير هذا الاقتران اثناء عملية الربط
                        Navigator.pop(context));
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
      SizedBox(
        height: 5,
      ),
      TextField(
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
