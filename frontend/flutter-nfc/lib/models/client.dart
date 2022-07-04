class Client {
  int? id;
  String? adress;
  String? city;
  String? email;
  String? logo;
  String? name;
  int? phone;
  String? zipcode;
  bool? completed;


  Client({required this.id, required this.adress, required this.city, required this.email, required this.logo, required this.name, required this.phone, required this.zipcode, required this.completed});

  Client.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    adress = json['adress'];
    city = json['city'];
    email = json['email'];
    logo = json['logo'];
    name = json['name'];
    phone = json['phone'];
    zipcode = json['zipcode'];
    completed = json['completed'];
  }


  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id.toString();
    data['adress'] = this.adress.toString();
    data['city'] = this.city.toString();
    data['email'] = this.email.toString();
    data['logo'] = this.logo.toString();
    data['name'] = this.name.toString();
    data['phone'] = this.phone.toString();
    data['zipcode'] = this.zipcode.toString();
    data['completed'] = this.completed.toString();
    return data;
  }
}