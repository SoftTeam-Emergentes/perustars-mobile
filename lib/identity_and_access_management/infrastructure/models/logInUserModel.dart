
class LogInUserModel {
  String email;
  String password;

  LogInUserModel({required String email, required String password})
      : this.email = email,
        this.password = password;

  // Getter para email
  String get getEmail => this.email;

  // Setter para email


  // Getter para password
  String get getPassword => this.password;


  factory LogInUserModel.fromJson(Map<String,dynamic> json){
    return LogInUserModel(email: json['email'], password: json['password']);
  }
  Map<String,dynamic> toJson(){
    return{
      'email':this.email,
      'password':this.password
    };
}
}
