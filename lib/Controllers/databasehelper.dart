import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:todolist/models/task.dart'; 
class DatabaseHelper{


  String serverUrl = "https://tranquil-eyrie-84723.herokuapp.com/api";
  var status ;
  var token ; 
  bool isTrue = false; 
  bool get geIsTrue => isTrue; 
  void setIsTrue(bool isTrue) => this.isTrue = isTrue; 
 var responseMg; 
  loginData(String email , String password) async{
    String myUrl = "$serverUrl/login";
    final response = await  http.post(myUrl,
        headers: {
          'Accept':'application/json'
        },
        body: {
          "email": "$email",
          "password" : "$password"
        } ) ;
    //print(response.body.toString());
    status = response.body.contains('error');

    var data = json.decode(response.body);

    if(status){
      print('data : ${data["error"]}');
    }else{
      print('data : ${data["access_token"]}');
      _save(data["access_token"]);
    }

  }

  registerData(String name ,String email , String password, String password_confirmation) async{ 
  
    String myUrl = "$serverUrl/register"; 

     
    final response = await  http.post(myUrl,
        headers: {
          'Accept':'application/json'
        },
        body: {
          "name": name,
          "email": email,
          "password" : password,
          "password_confirmation":password_confirmation
        } ) ; 
  
    status = response.body.contains('error');
         
    var data = json.decode(response.body);

      
    if(status){
      print('data : ${data["error"]}');
    }else{
      print('data : ${data["access_token"]}');
      //_save(data["access_token"]);
    }

  } 




  logout() async{  
      String myUrl = "$serverUrl/logout"; 
      final prefs = await SharedPreferences.getInstance();
     final key = 'token';
     final value = prefs.get(key ) ?? 0; 

      final response = await http.post(myUrl,
            headers: {'Accept':'application/json',
                      'Authorization' : 'Bearer $value'},                      
          ); 
       status = response.body.contains('error'); 
                var data = json.decode(response.body); 
                //var message = data['message']; 
                //print("this is logout $message"); 
        if(!status){
           prefs.remove(token); 
        }
             
         else{
        responseMg = data['message'].toString(); 
        print(data['message']); 
      }       

  } 




sendVerifiedEmail(String email) async{
    String myUrl = "$serverUrl/password/email";
    final response = await  http.post(myUrl, 
     headers: {'Accept':'application/json',
                      },  
        body: {
          "email": "$email",
        } ) ;
    status = response.body.contains('error');

    var data = json.decode(response.body);
   if (status){
     setIsTrue(true);  
    
   }else{
     setIsTrue(false); 
   }
             
    if(status){
      print('data : ${data["error"]}');
    }else{
      print('data : ${data["message"]}');
      //_save(data["access_token"]);
    }

  }
resetPassword(String code, String email, String pwd, String nwpwd) async{
    String myUrl = "$serverUrl/password/reset"; 

    final response = await  http.post(myUrl, 
     headers: {'Accept':'application/json', 
                      },  
        body: {
          "email": "$email", 
          "token": "$code", 
          "password": "$pwd", 
          "password_confirmation": "$nwpwd",
        } ) ;
    status = response.body.contains('error'); 
    var data = json.decode(response.body);

    if(status){
      print('data : ${data["error"]}');
    }else{
      print('data : ${data["message"]}');
      //_save(data["access_token"]);
    } 
  }

Future<List<Task>> getTodyTasks()async{
    List tasklist=List<Task>();
    String myUrl= "$serverUrl/tasks/todayTask"; 
  final prefs = await SharedPreferences.getInstance();  
  final key = 'token'; 
  final value = prefs.get(key ) ?? 0; 
    try{ 
      http.Response res= await http.post(myUrl,
        headers: { "Accept": 'application/json',
          'Authorization': 'Bearer $value'},
        body: {
            "timeZone":"Africa/Algiers"
        }
      );
     var data =  json.decode(res.body); 
      //print("data to do list: $data"); 
     List l=data["data"];
    for (var i=0;i<l.length;i++){ 
      var t= Task.fromJson(l[i]);
      tasklist.add(t);
    }
    //print("afficher list: ${tasklist[0].name}"); 
           }
    catch(e) {}
    return tasklist;


  }


Future<List<Task>> getTomorrowTasks()async{
    List tasklist2=List<Task>();
    String myUrl= "$serverUrl/tasks/tomorrowTask"; 
  final prefs = await SharedPreferences.getInstance();  
  final key = 'token'; 
  final value = prefs.get(key ) ?? 0; 
    try{
      http.Response res= await http.post(myUrl,
        headers: { "Accept": 'application/json',
          'Authorization': 'Bearer $value'}, 
      );
     var data=  json.decode(res.body);
     print(data); 
     List l2=data["data"];
    for (var i=0;i<l2.length;i++){
      var t2= Task.fromJson(l2[i]);
      tasklist2.add(t2);
    }

    }
    catch(e) {}
    return tasklist2;


  }



Future<bool> mergeTasks() async{
String myUrl= "$serverUrl/tasks/mergeTasks"; 
 final prefs = await SharedPreferences.getInstance();  
  final key = 'token'; 
  final value = prefs.get(key ) ?? 0; 
   status=false; 
  http.Response res= await http.put(myUrl,
        headers: { 'Accept': 'application/json',
          'Authorization': 'Bearer $value'},
        body: {
            "timeZone":"Africa/Algiers"
        }
      ); 
  //status = res.body.contains('error'); 

    var data = json.decode(res.body);
       status=data["success"]; 
    //if(status){
      //print('data : ${data["error"]}');
    //}else{
      print('data : ${data["success"]}');
      //_save(data["access_token"]);
    //} 
    return status; 
}











  //
   Future<List> getData() async{
  
     final prefs = await SharedPreferences.getInstance();
     final key = 'token';
     final value = prefs.get(key ) ?? 0;
  
    String myUrl = "$serverUrl/tasks/todayTask"; 
   http.Response res= await http.post(myUrl,
        headers: { "Accept": 'application/json',
          'Authorization': 'Bearer $value'},
        body: {
            "timeZone":"Africa/Algiers"
        }
      ); 
      var data = json.decode(res.body); 
      print("data : $data"); 
      var lt = data['data']; 
      print("liste data : $lt"); 
     return lt;  
   }
  //
  Future<bool> deleteData(int id) async {
     final prefs = await SharedPreferences.getInstance();
    final key = 'token';
     final value = prefs.get(key ) ?? 0;
     status=false; 
    String myUrl = "$serverUrl/tasks/destroy/$id";
    try{
  http.Response res= await http.delete(myUrl,
        headers: {
          'Accept':'application/json',
         'Authorization' : 'Bearer $value'
         } ); 
          var data=json.decode(res.body);
       status=data["success"];
      }catch(e){

  }
  return status;
   } 



Future<bool> markAsDone(int id) async {
     final prefs = await SharedPreferences.getInstance();
    final key = 'token';
     final value = prefs.get(key ) ?? 0;
     status=false; 
    String myUrl = "$serverUrl/tasks/markDone/$id";
    try{
  http.Response res= await http.put(myUrl,
        headers: {
          'Accept':'application/json',
         'Authorization' : 'Bearer $value'
         } ); 
          var data=json.decode(res.body);
       status=data["success"];
      }catch(e){

  }
  return status;
   } 
Future<bool> unCheckedTask(int id) async {
     final prefs = await SharedPreferences.getInstance();
    final key = 'token';
     final value = prefs.get(key ) ?? 0;
     status=false; 
    String myUrl = "$serverUrl/tasks/UncheckeTask/$id";
    try{
  http.Response res= await http.put(myUrl,
        headers: {
          'Accept':'application/json',
         'Authorization' : 'Bearer $value'
         } ); 
          var data=json.decode(res.body);
       status=data["success"];
      }catch(e){

  }
  return status;
   } 



  //
   void addData(String name) async {
    final prefs = await SharedPreferences.getInstance();
     final key = 'token';
     final value = prefs.get(key ) ?? 0;
  
    String myUrl = "$serverUrl/tasks/storeToday";
    http.post(myUrl,
        headers: {
          'Accept':'application/json',
          'Authorization' : 'Bearer $value'
        },
         body: {
           "name": "$name",
           "timeZone":"Africa/Algiers" 
        }).then((response){
       print('Response status : ${response.statusCode}');
       print('Response body : ${response.body}');
     });
   } 



void addDataTomorrow(String name) async {
    final prefs = await SharedPreferences.getInstance();
     final key = 'token';
     final value = prefs.get(key ) ?? 0;
  
    String myUrl = "$serverUrl/tasks/storeTomorrow";
    http.post(myUrl,
        headers: {
          'Accept':'application/json',
          'Authorization' : 'Bearer $value'
        },
         body: {
           "name": "$name",
           "timeZone":"Africa/Algiers" 
        }).then((response){
       print('Response status : ${response.statusCode}');
       print('Response body : ${response.body}');
     });
   }



  //
  //
  // void editData(int id,String name , String price) async {
  //   final prefs = await SharedPreferences.getInstance();
  //   final key = 'token';
  //   final value = prefs.get(key ) ?? 0;
  //
  //   String myUrl = "http://flutterapitutorial.codeforiraq.org/api/products/$id";
  //   http.put(myUrl,
  //       headers: {
  //         'Accept':'application/json',
  //         'Authorization' : 'Bearer $value'
  //       },
  //       body: {
  //         "name": "$name",
  //         "price" : "$price"
  //       }).then((response){
  //     print('Response status : ${response.statusCode}');
  //     print('Response body : ${response.body}');
  //   });
  // }
  //
  //
  //


  _save(String token) async {
    final prefs = await SharedPreferences.getInstance();
    final key = 'token';
    final value = token;
    prefs.setString(key, value); 
    
  }

   Future<bool> read() async {
    final prefs = await SharedPreferences.getInstance();
    //final key = 'token';
    //final value = prefs.get(key ) ?? 0;
    //print('read : $value'); 
    status = false; 
     if(prefs.containsKey('token')&& 
        prefs.getString('token')!=null && 
        prefs.getString('token')!=''){
               status = true; 
        }else{
          status = false; 
        } 
        return status; 
  }

 logOut() async{
     final prefs = await SharedPreferences.getInstance();
     prefs.remove('token');
     //prefs.remove('isAdmin');
   }




}

