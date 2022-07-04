class Utilisateur {
  int? id;
  String? firstname;
  String? lastname;
  String? email;
  int? mobile;
  String? password;
  String? username;
  bool? completed;


  Utilisateur({required this.id, required this.firstname, required this.lastname, required this.email, required this.mobile, required this.password,required this.username, required this.completed});

  Utilisateur.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    email = json['email'];
    firstname = json['firstname'];
    lastname = json['lastname'];
    mobile = json['mobile'];
    username = json['username'];
    password = json['password'];
    completed = json['completed'];
  }


  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id.toString();
    data['email'] = this.email.toString();
    data['firsname'] = this.firstname.toString();
    data['lastname'] = this.lastname.toString();
    data['username'] = this.username.toString();
    data['password'] = this.password.toString();
    data['completed'] = this.completed.toString();
    return data;
  }
}