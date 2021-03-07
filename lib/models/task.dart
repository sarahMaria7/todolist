class Task {
int _id;  
String _name; 
int _isCompleted; 

Task(this._id, this._name, this._isCompleted); 


int    get id   => _id;
String  get name   => _name;
int get isComleted       => _isCompleted; 


 set setId(int id)  => _id = id;
 set setName(String name)   => _name = name; 
  set setIsCompleted(int isCompleted) => _isCompleted = isCompleted;  

Task.fromJson(Map<String, dynamic> map){
this._id  = map["id"]; 
this. _name = map["name"]; 
this._isCompleted = map["status"]; 

} 

Map<String, dynamic> toMap(){
    Map map = Map<String, dynamic>();
      map["id"]  = _id; 
      map["name"]  = _name; 
      map["status"]  = _isCompleted; 
return map; 
} 



}