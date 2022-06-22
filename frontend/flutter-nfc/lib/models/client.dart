class Client {
  int id;
  String adress;
  String city;
  String email;
  String logo;
  String name;
  int phone;
  String zipcode;


  Client({required this.id, required this.adress, required this.city, required this.email, required this.logo, required this.name, required this.phone, required this.zipcode});

  client.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    adress = json['adress'];
    city = json['city'];
    email = json['email'];
    logo = json['logo'];
    name = json['name'];
    phone = json['phone'];
    zipcode = json['zipcode'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['adress'] = this.adress;
    data['city'] = this.city;
    data['email'] = this.email;
    data['logo'] = this.logo;
    data['name'] = this.name;
    data['phone'] = this.phone;
    data['zipcode'] = this.zipcode;
    return data;
  }
}