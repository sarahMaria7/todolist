import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

class DatabaseHelper{


  String serverUrl = "https://tranquil-eyrie-84723.herokuapp.com/api/registeri";
  var status ;
  var token ;

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
    print(response.body.toString());
    status = response.body.contains('error');

    var data = json.decode(response.body);

    if(status){
      print('data : ${data["error"]}');
    }else{
      print('data : ${data["token"]}');
      _save(data["token"]);
    }

  }

  registerData(String name ,String email , String password, String password_confirmation) async{
    String myUrl = "$serverUrl/register";
    final response = await  http.post(myUrl,
        headers: {
          'Accept':'application/json'
        },
        body: {
          "name": "$name",
          "email": "$email",
          "password" : "$password",
          "password_confirmation":"$password_confirmation"
        } ) ;
    status = response.body.contains('error');

    var data = json.decode(response.body);

    if(status){
      print('data : ${data["error"]}');
    }else{
      print('data : ${data["token"]}');
      _save(data["token"]);
    }

  }

  resetPassword(String email) async{
    String myUrl = "http://young-tor-98045.herokuapp.com/api/password/email";
    final response = await  http.post(myUrl,
        body: {
          "email": "$email",
        } ) ;
    status = response.body.contains('error');

    var data = json.decode(response.body);

    if(status){
      print('data : ${data["error"]}');
    }else{
      print('data : ${data["token"]}');
      _save(data["token"]);
    }

  }

  //
  // Future<List> getData() async{
  //
  //   final prefs = await SharedPreferences.getInstance();
  //   final key = 'token';
  //   final value = prefs.get(key ) ?? 0;
  //
  //   String myUrl = "$serverUrl/products/";
  //   http.Response response = await http.get(myUrl,
  //       headers: {
  //         'Accept':'application/json',
  //         'Authorization' : 'Bearer $value'
  //       });
  //   return json.decode(response.body);
  // }
  //
  // void deleteData(int id) async {
  //   final prefs = await SharedPreferences.getInstance();
  //   final key = 'token';
  //   final value = prefs.get(key ) ?? 0;
  //
  //   String myUrl = "$serverUrl/products/$id";
  //   http.delete(myUrl,
  //       headers: {
  //         'Accept':'application/json',
  //         'Authorization' : 'Bearer $value'
  //       } ).then((response){
  //     print('Response status : ${response.statusCode}');
  //     print('Response body : ${response.body}');
  //   });
  // }
  //
  // void addData(String name , String price) async {
  //   final prefs = await SharedPreferences.getInstance();
  //   final key = 'token';
  //   final value = prefs.get(key ) ?? 0;
  //
  //   String myUrl = "$serverUrl/products";
  //   http.post(myUrl,
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


  read() async {
    final prefs = await SharedPreferences.getInstance();
    final key = 'token';
    final value = prefs.get(key ) ?? 0;
    print('read : $value');
  }






}

