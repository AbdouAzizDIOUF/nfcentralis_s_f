class Utilisateur {
  int? id;
  String? firstName;
  String? lastName;
  String? email;
  String? mobile;
  String? userName;

  Utilisateur({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.mobile,
    required this.userName,
  });

  Utilisateur.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    email = json['email'];
    firstName = json['firstName'];
    lastName = json['lastName'];
    mobile = json['mobile'];
    userName = json['userName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['email'] = email.toString();
    data['firstName'] = firstName.toString();
    data['lastName'] = lastName.toString();
    data['userName'] = userName.toString();
    data['mobile'] = mobile.toString();
    return data;
  }
}
