import 'package:flutter/material.dart';
import 'package:todolist/Controllers/databasehelper.dart'; 
import 'package:todolist/widgets/drawer.dart';
import 'package:intl/intl.dart' as intl; 
import 'package:flutter_slidable/flutter_slidable.dart'; 
//import 'package:todolist/widgets/appBar.dart';  
//import 'addtask.dart';  
//import 'package:shared_preferences/shared_preferences.dart'; 

DateTime _currentDate = new DateTime.now(); 
final TextEditingController taskController = new TextEditingController();  
  List listoftasks=[]; 
    DatabaseHelper db=  DatabaseHelper(); 
     List<bool> isChecked; 
  var refreshKey = GlobalKey<RefreshIndicatorState>(); 
class TodayPage extends StatefulWidget {
  TodayPage({Key key}) : super(key: key);

  
  @override
  TodayPageState createState() => TodayPageState();
}
  

 
class TodayPageState extends State<TodayPage> {
  
       
@override 
void initState() {
    super.initState();
      refreshList2(); 
    //db.getData(); 
    //db.read(); 
   //db.getTodyTasks(); 
//db.mergeTasks(); 
} 

 Future<Null> refreshList2() async {
    refreshKey.currentState?.show(atTop: false);
    await Future.delayed(Duration(seconds: 0));
    db.getTodyTasks().then((value) {
      setState(() {
        listoftasks = value;
        isChecked = List<bool>.generate(listoftasks.length, (int i) => false);

      });
    });
    //db.getData();
    //db.read();
    //db.getTodyTasks();

    return null;
  } 
Future<Null> refreshList() async {
    refreshKey.currentState?.show(atTop: false);
    await Future.delayed(Duration(seconds: 0));
    db.getTodyTasks().then((value) {
      setState(() {
        listoftasks = value;
      });
    });
    db.getData();
    db.read();
    db.getTodyTasks();

    return null;
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
      
      body: Column( 
           crossAxisAlignment: CrossAxisAlignment.start, 
                children:  <Widget>[ 
                  
          Container(  
                         padding: EdgeInsets.all(12.0), 
                       child:  Text('Ongoing tasks', 
              style: TextStyle(
                color:  Color(0xff7718b9), 
                fontWeight: FontWeight.w500,
                fontFamily: "RobotoMedium", 
                //fontStyle:  FontStyle.normal,
                fontSize: 19.0, 
            ), 
          
          ), 
                       ), 
   Expanded(        
 child:  ListView.builder( 
    //scrollDirection: Axis.vertical, 
                itemCount:(listoftasks.length), 
                itemBuilder: (BuildContext context, int position) {
                  return 
                  Container(
                  child: Column(  
                    crossAxisAlignment: CrossAxisAlignment.start,   
                     children: <Widget>[ 
                      
                       Slidable(
                      actionPane: SlidableDrawerActionPane(),

                  secondaryActions: [
                  IconSlideAction(
                  color:Color(0xffe8e8e8), 
                  //:Icons.delete , 
                  iconWidget:  Image.asset(
                          'assets/images/iconsdelete.png',  
                          //height: 60.0,
                          fit: BoxFit.cover,
                        ),
                  //foregroundColor:Colors.green, 
                  onTap: () async{
                   var s= await db.deleteData(listoftasks[position].id); 
                     if(s==true){
                     setState(() {
                       listoftasks.removeAt(position);
                          }); 
                   }
                  },  
                  ), 

                  ],  
         child:   Container(
                 child: Row( 
                    crossAxisAlignment: CrossAxisAlignment.center,  
    children: <Widget>[ 
 Expanded(
      child:    (listoftasks[position].isCompleted == 0)? ListTile( 
        leading:    buildCheckBox(position, 1),
          title:  Text('${listoftasks[position].name}', 
              style: TextStyle(
                color:  Color(0xffa06db2),
                fontWeight: FontWeight.w500,
                fontFamily: "RobotoBold",
                //fontStyle:  FontStyle.normal,
                fontSize: 16.0, 
            ), 
          
          ), 
    
        ): 
        Container(),  
        
       
 ), 

    ], 
), 
            ), 
                       ), 
         //(position==(listoftasks.length-1))? Container(): Divider(thickness: 1, color: Color(0xff43c800)),                    
                     ], 
                  ), 
                  ); 
                  
       
       


                }), 


   ), 

    Container(  
                         padding: EdgeInsets.all(12.0), 
                       child:  Text('Completed tasks', 
              style: TextStyle(
                color:  Color(0xff7718b9), 
                fontWeight: FontWeight.w500,
                fontFamily: "RobotoMedium", 
                //fontStyle:  FontStyle.normal,
                fontSize: 19.0, 
            ), 
          
          ), 
    ), 
     Expanded(        
 child:  ListView.builder( 
    //scrollDirection: Axis.vertical, 
                itemCount:(listoftasks.length), 
                itemBuilder: (BuildContext context, int position) {
                  return 
                  Container(
                  child: Column(  
                    crossAxisAlignment: CrossAxisAlignment.start,   
                     children: <Widget>[ 
                      
                       Slidable(
                      actionPane: SlidableDrawerActionPane(),

                  secondaryActions: [
                  IconSlideAction(
                  color:Color(0xffe8e8e8), 
                  //icon:Icons.delete , 
                  iconWidget:  Image.asset(
                          'assets/images/iconsdelete.png',  
                          //height: 60.0,
                          fit: BoxFit.cover,
                        ), 
                  //foregroundColor:Colors.green, 
                  onTap: () async{
                   var s= await db.deleteData(listoftasks[position].id); 
                     if(s==true){
                     setState(() {
                       listoftasks.removeAt(position);
                          }); 
                   }
                  },  
                  ), 

                  ],  
         child:   Container(
                 child: Row( 
                    crossAxisAlignment: CrossAxisAlignment.center,  
    children: <Widget>[ 
 Expanded(
      child:  (listoftasks[position].isCompleted == 1)? ListTile( 
        leading:    buildCheckBox(position, 2),
          title:  Text('${listoftasks[position].name}', 
              style: TextStyle(
                color:  Color(0xffa06db2),
                fontWeight: FontWeight.w500,
                fontFamily: "RobotoBold", 
                decoration: TextDecoration.lineThrough, 
                //fontStyle:  FontStyle.normal,
                fontSize: 16.0, 
            ), 
          
          ), 
    
        ): 
        Container(),  
        
       
 ), 

    ], 
), 
            ), 
                       ), 
         //(position==(listoftasks.length-1))? Container(): Divider(thickness: 1, color: Color(0xff43c800)),                    
                     ], 
                  ), 
                  ); 
                  
       
       


                }), 


   ), 
 
                ], 
),  
  
       
    
      
    

    );
  } 

  Widget buildCheckBox(index, int i){ 
  
  if(i==1){ 
  return InkWell(
        onTap: () async{
          
        var f= await db.markAsDone(listoftasks[index].id); 
                     if(f==true){
                     setState(() { 
                            refreshList(); 
            isChecked[index] = !isChecked[index];  
                          });  
                   }
        },
        child: isChecked[index]? Container(
          decoration: BoxDecoration(shape: BoxShape.circle, color: Color(0xff3da700),  
          border: Border.all(color: Color(0xff3da700), width: 2)),
          child: Padding(
            padding: const EdgeInsets.all(9.0),
            child: Icon(
                    Icons.check,
                    size: 12.0,
                    color: Colors.white, 
                  ), 
          ),
        ):
        Container(
          decoration: BoxDecoration(shape: BoxShape.circle, color: Colors.white, 
          border: Border.all(color: Color(0xff3da700), width: 2)),
          child: Padding(
            padding: const EdgeInsets.all(9.0),
            child: Icon(
                    Icons.check_box_outline_blank,
                    size: 9.0,
                    color: Colors.transparent, 
                  ),
          ),
        ),
      ); 
 }else if(i==2){ 
    return InkWell(
        onTap: () async {
          bool f = await db.markAsDone(listoftasks[index].id);
          if (f == false) {
            setState(() { 
                   refreshList(); 
              isChecked[index] = !isChecked[index];
            });
          }
        },
        child: Container(
          decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Color(0xff3da700),
              border: Border.all(color: Color(0xff3da700), width: 2)),
          child: Padding(
            padding: const EdgeInsets.all(9.0),
            child: Icon(
              Icons.check,
              size: 12.0,
              color: Colors.white,
            ),
          ),
        ), 

      );
    }
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
               Navigator.of(context).pushNamed('/addtask');
             //Navigator.of(context).push(
              //new MaterialPageRoute( 
                //builder: (BuildContext context) => new AddTask(),
              //)
          //); 
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
