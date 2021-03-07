import 'package:flutter/material.dart';
import 'package:todolist/Controllers/databasehelper.dart'; 
import 'package:todolist/widgets/drawer.dart';
import 'package:intl/intl.dart' as intl; 
import 'package:flutter_slidable/flutter_slidable.dart'; 
import 'addtask.dart'; 
class TodayPage extends StatefulWidget {
  TodayPage({Key key}) : super(key: key);

  
  @override
  TodayPageState createState() => TodayPageState();
}
  

 
class TodayPageState extends State<TodayPage> {
  DateTime _currentDate = new DateTime.now(); 
final TextEditingController taskController = new TextEditingController();  
  List listoftasks=[]; 
    DatabaseHelper db=  DatabaseHelper(); 


@override 
void initState() {
    super.initState();
     db.getTodyTasks().then((value) {
      setState(() {
        listoftasks = value;

      });
    });
} 

    
  @override
  Widget build(BuildContext context) { 
     //var h = MediaQuery.of(context).size.height; 
     //var w = MediaQuery.of(context).size.width; 
       String formatDate = intl.DateFormat('yyyy-MM-dd').format(_currentDate); 
      String formatDay = intl.DateFormat('EEEE').format(_currentDate); 
    return Scaffold(  
        //extendBodyBehindAppBar: true, 
          drawer: drawerwidget(context),       
      appBar:  _appBar(AppBar().preferredSize.height, formatDate, formatDay), 
      
      body: Container( 

  child: ListView.builder(
                itemCount:(listoftasks.length), 
                itemBuilder: (BuildContext context, int position) {
                  return Slidable(
                      actionPane: SlidableDrawerActionPane(),

                  secondaryActions: [
                  IconSlideAction(
                  color:Colors.redAccent,
                  icon:Icons.delete ,
                  foregroundColor:Colors.black,
                  onTap: () {
                 
                   }, 
                  ), 

                  ], 
                  child: Row( 
                    crossAxisAlignment: CrossAxisAlignment.center,  
    children: <Widget>[ 
      Container(
        child:   Text('task1: ${listoftasks[position].name}', 
           style: TextStyle(
                color:  Color(0xff333333),
                fontWeight: FontWeight.w500,
                fontFamily: "RobotoBold",
                //fontStyle:  FontStyle.normal,
                fontSize: 23.0, 
            ), 
          
          ), 
      ), 
    ], 
), 
                  ); 
       
       


                }), 


),                          
  
       
    
    

    );
  } 





 _appBar(height, fdate, frday) => PreferredSize(
    preferredSize:  Size(MediaQuery.of(context).size.width, height + 200.0 ),
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
          
        Text("Today", 
         style: TextStyle(
                color:  Color(0xffffffff),
                fontWeight: FontWeight.w500,
                fontFamily: "RobotoBold",
                //fontStyle:  FontStyle.normal,
                fontSize: 23.0, 
                height: 2.0,  
            ),
            ), 
       
            Text("$frday",
        style: TextStyle(
          fontSize: 12.0, fontWeight: FontWeight.bold,  color: Color(0xffFFFFFF), 
             height: 2.0, 
          ), 
    ), 

    Text("$fdate",
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
            onPressed: () {
             Navigator.of(context).push(
              new MaterialPageRoute( 
                builder: (BuildContext context) => new AddTask(),
              )
          ); 
            },
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
