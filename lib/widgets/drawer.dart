import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
//import 'package:todolist/Controllers/databasehelper.dart';
import 'package:todolist/screens/signin.dart';
import 'package:todolist/screens/todaypage.dart'; 
import 'package:todolist/screens/tomorrowpage.dart';  
Widget drawerwidget(BuildContext context) {
 //DatabaseHelper db=  DatabaseHelper(); 

  _save(String token) async {
    final prefs = await SharedPreferences.getInstance();
    final key = 'token';
    final value = token;
    prefs.setString(key, value);
  }


  return Container(
      width: MediaQuery.of(context).size.width * 0.75,
      child: Drawer(
          child: SingleChildScrollView(
        child: Stack(
          children: <Widget>[
            Image.asset(
              "assets/images/BG.png",
              fit: BoxFit.fill,
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
            ),
  
              Column(
                children: <Widget>[
                     Container(
                       width: double.infinity, 
                       padding: EdgeInsets.all(20.0), 
                       child: Center(
                         child: Column(
                              children: <Widget>[ 
                               Container(
                                 width: 85, 
                                 height: 95, 
                                 margin: EdgeInsets.only(top: 30.0, bottom: 9.0),  
                                 decoration: BoxDecoration(
                                   image: DecorationImage(
                                     image: AssetImage("assets/images/Profile_Picture.png"), 
                                     fit: BoxFit.fill,  
                                   ),
                                 ),
                               ),
                      Text("",
                      style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),),

                              ],
                         ),
                       ), 
                     ), 


     Padding(padding: EdgeInsets.only(top: 55.0)),
       

          
                  ListTile(
                
                    title: Text('Today', 
                      style: TextStyle(
                          color: Colors.white, 
                          fontSize: 15,
                          fontWeight: FontWeight.bold), 
                            //textAlign: TextAlign.center,  
                    ),
                    onTap: () {
                       Navigator.of(context).push(
                        new MaterialPageRoute(
                          builder: (BuildContext context) => new TodayPage(),
                        )
                    ); 
                    },
                  ), 

                  ListTile(
                    //padding: EdgeInsets.only(left: 50),
                    title: Text(
                      'Tomorrow',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                          fontWeight: FontWeight.bold),
                    ),
                    onTap: () {
                       Navigator.of(context).push(
                        new MaterialPageRoute(
                          builder: (BuildContext context) => new TomorrowPage(),
                        )
                    ); 
                    },
                  ),
        
       Padding(padding: EdgeInsets.only(top: 190)),
            ListTile(
              
              title: Text(
                "Logout",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                    fontWeight: FontWeight.bold), 
                    textAlign: TextAlign.end, 
              ),
              onTap: () {
                _save('0');
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => LoginPage1()));


              },
            ),
       
                ],
              ),
            
          
           
          ],
        ),
      )));
}
