class User{
  int? id;
  String? firstName;
  String? lastName;
  String? email;
  String? password;

  User({
    this.id, required this.firstName, required this.lastName, required this.email,required this.password
});

  User.fromJson(Map<String,dynamic> json){
    id=json['id'];
    firstName=json['firstName'];
    lastName=json['lastName'];
    email=json['email'];
    password=json['password'];
  }
  Map<String,dynamic> toJson(){
    final Map<String,dynamic> data= Map<String,dynamic>();
    data['id']=this.id;
    data['firstName']=this.firstName;
    data['lastName']=this.lastName;
    data['emai']=this.email;
    data['password']=this.password;
    return data;
  }
}