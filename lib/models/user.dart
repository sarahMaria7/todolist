class User {
    String _token; 
    int    _id; 
    String _email; 
    String _oldPassword; 
    String _newPassword; 


User(this._email);



  String get token         => _token;
  int    get id            => _id;
  String get email         =>_email;
  String get oldPassword   => _oldPassword;
  String get newPassword   => _newPassword;

  
  set setToken(String token)             => _token = token;
  set setId(int id)                      => _id = id;
  set setEmail(String email)             => _email = email;
  set setOldPwd(String oldPassword)     => _oldPassword = oldPassword;
  set setNewPwd(String newPassword)     => _newPassword = newPassword;

  User.fromJson(Map<String, dynamic> map){
   _id     = map["id"];
   _email  = map["email"];
  
 }
  
 
  Map<String, dynamic> toMap(){
    Map map = Map<String, dynamic>();
   map["email"]  = _email ; 
   map["password"]  = _oldPassword ; 
   map["password_confirmation"]  = _newPassword ; 

   return map;
 }

}