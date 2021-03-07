class User {
    String _token; 
    int    _id; 
    String _email; 
    String _old_password; 
    String _new_password; 


User(this._email);



  String get token         => _token;
  int    get id            => _id;
  String get email         =>_email;
  String get old_password   => _old_password;
  String get new_password   => _new_password;

  
  set setToken(String token)             => _token = token;
  set setId(int id)                      => _id = id;
  set setEmail(String email)             => _email = email;
  set setOldPwd(String old_password)     => _old_password = old_password;
  set setNewPwd(String new_password)     => _new_password = new_password;

  User.fromJson(Map<String, dynamic> map){
   _id     = map["id"];
   _email  = map["email"];
  
 }
  
 
  Map<String, dynamic> toMap(){
    Map map = Map<String, dynamic>();
   map["email"]  = _email ; 
   map["password"]  = _old_password ; 
   map["password_confirmation"]  = _new_password ; 

   return map;
 }

}