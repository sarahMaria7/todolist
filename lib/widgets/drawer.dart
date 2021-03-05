import 'package:flutter/material.dart';

Widget drawerwidget(BuildContext context) {
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
                      Text('Hazem TG', 
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
                    onTap: () {},
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
                    onTap: () {},
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
              onTap: () {},
            ),
       
                ],
              ),
            
          
           
          ],
        ),
      )));
}
