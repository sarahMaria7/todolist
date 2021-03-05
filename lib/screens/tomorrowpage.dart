import 'package:flutter/material.dart'; 
import 'package:todolist/widgets/drawer.dart';
import 'package:intl/intl.dart' as intl; 

class TomorrowPage extends StatefulWidget {
  TomorrowPage({Key key}) : super(key: key);

  
  @override
  TomorrowPageState createState() => TomorrowPageState();
}
  

 
class TomorrowPageState extends State<TomorrowPage> { 
  DateTime _currentDate2 = new DateTime.now(); 
  @override
  Widget build(BuildContext context) {
       String formatDate2 = intl.DateFormat('yyyy-MM-dd').format(_currentDate2); 
      String formatDay2 = intl.DateFormat('EEEE').format(_currentDate2); 
    return Scaffold(  
        //extendBodyBehindAppBar: true, 
          drawer: drawerwidget(context),       
      appBar:  _appBar(AppBar().preferredSize.height, formatDate2, formatDay2), 
      
      body: ListView( 
    padding: EdgeInsets.all(12.0), 
    scrollDirection: Axis.vertical, 
    children: <Widget>[ 

                
    ], 
      ), 
      
    
    );
  } 





 _appBar(height, fdate2, frday2) => PreferredSize(
    preferredSize:  Size(MediaQuery.of(context).size.width, height + 185.0 ),
    child: Stack(
      children: <Widget>[ 

    Container(     // Background
        //constraints: BoxConstraints.expand(),
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/bgappbar.png'),
              fit: BoxFit.cover, 
            ), 
          ), 
          child:   AppBar( 
        backgroundColor: Colors.transparent, 
        elevation: 0.0,  
         flexibleSpace: 
            Column( 
              mainAxisAlignment: MainAxisAlignment.center, 
      children:  <Widget>[ 
          
        Text("Tomorrow", 
         style: TextStyle(
                color:  Color(0xffffffff),
                fontWeight: FontWeight.w500,
                //fontFamily: "Roboto",
                //fontStyle:  FontStyle.normal,
                fontSize: 23.0, 
                height: 2.0,  
            ),
            ), 
       
            Text("$frday2",
        style: TextStyle(
          fontSize: 12.0, fontWeight: FontWeight.bold,  color: Color(0xffFFFFFF), 
             height: 2.0, 
          ), 
    ), 

    Text("$fdate2",
        style: TextStyle(
          fontSize: 12.0, fontWeight: FontWeight.bold,  color: Color(0xffFFFFFF), 
             height: 2.0, 
          ), 
    ), 
        SizedBox(height: 15.0), 
      ],
    ),
      
       
        ),   // Required some widget in between to float A
          height: height + 165.0,
          width: MediaQuery.of(context).size.width,
        ),



              Container(), 
    
    
// هذا الجزء الأهم و الذي به قمناباضافة الايقونة
        Positioned(
          top: 172.0,
          left: 20.0,
          right: 20.0, 
          //bottom: 55.0, 
          child:RawMaterialButton(
            onPressed: () {},
            elevation: 2.0,
            //fillColor: Colors.green, 
            child:  Image(
          image: AssetImage(
            'assets/images/cyrcelplus.png',
          ),
          fit: BoxFit.cover, 
          height: MediaQuery.of(context).size.height*0.12, 

        ), 

            padding: EdgeInsets.all(9.0),
            shape: CircleBorder(),
          )
        ), 

      ],
    ),
  );












}
