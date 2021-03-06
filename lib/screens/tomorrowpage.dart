import 'package:flutter/material.dart'; 
import 'package:todolist/widgets/drawer.dart';
import 'package:intl/intl.dart' as intl; 
import 'package:todolist/Controllers/databasehelper.dart'; 
import 'addtaskstomorrow.dart'; 
import 'package:flutter_slidable/flutter_slidable.dart'; 
//import 'package:todolist/widgets/appBar.dart';   
class TomorrowPage extends StatefulWidget {
  TomorrowPage({Key key}) : super(key: key);

  
  @override
  TomorrowPageState createState() => TomorrowPageState();
}
  



class TomorrowPageState extends State<TomorrowPage> {

   static DateTime tomorrow() {
    DateTime now = DateTime.now();
    return DateTime(
      now.year,
      now.month,
      now.day + 1,
    );
  }

    DatabaseHelper db=  DatabaseHelper(); 
  List listoftasksTm=[]; 
@override 
void initState() {
    super.initState();
     db.getTomorrowTasks().then((value) {
      setState(() {
        listoftasksTm = value;
        
      });
    }); 

} 

  @override
  Widget build(BuildContext context) {
       String formatDate2 = intl.DateFormat('yyyy-MM-dd').format(tomorrow()); 
      String formatDay2 = intl.DateFormat('EEEE').format(tomorrow()); 
    return Scaffold(  
        //extendBodyBehindAppBar: true, 
          drawer: drawerwidget(context),       
      appBar:  _appBar(AppBar().preferredSize.height, formatDate2, formatDay2), 
      
      body: Column( 
           crossAxisAlignment: CrossAxisAlignment.start, 
                children:  <Widget>[ 
                    (listoftasksTm.length == 0)? Center(
                       child: Column( 
            //mainAxisAlignment: MainAxisAlignment.start,  
            children: <Widget>[ 
              SizedBox(height: 15.0), 
              CircleAvatar(
                radius: 32.0,
                backgroundImage: AssetImage('assets/images/paper2.png'), 
                backgroundColor: Colors.transparent, 
              ), 
              SizedBox(height: 15.0), 
               Container(
                 child: Text("Don't have task", 
                 
                 style: TextStyle(
                color:  Color(0x805700bb), 
                fontFamily: "RobotoMedium", 
                //fontStyle:  FontStyle.normal,
                fontSize: 16.0, 
            ), 
                 ), 
               ), 
            ], 
                       ),  
                    ):    
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
                itemCount:(listoftasksTm.length), 
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
                   var st= await db.deleteData(listoftasksTm[position].id); 
                     if(st==true){
                     setState(() {
                       listoftasksTm.removeAt(position);
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
      child: ListTile( 
          title:  Text('${listoftasksTm[position].name}', 
              style: TextStyle(
                color:  Color(0xffa06db2),
                fontWeight: FontWeight.w500,
                fontFamily: "RobotoBold",
                //fontStyle:  FontStyle.normal,
                fontSize: 16.0, 
            ), 
          
          ), 
    
        ),  
      
      
 ), 

    ], 
), 
            ), 
                       ), 
         //(position==(listoftasksTm.length-1))? Container(): Divider(thickness: 1, color: Color(0xff43c800)),                    
                     ], 
                  ), 
                  ); 
                  
       
       


                }), 


   ), 
                ], 
                    ), 
                
     
      
      
    
    );
  } 





 _appBar(height, fdate2, frday2) => PreferredSize(
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
            onPressed: () {
               Navigator.of(context).push(
              new MaterialPageRoute( 
                builder: (BuildContext context) => new AddTaskTomorrow(),
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
