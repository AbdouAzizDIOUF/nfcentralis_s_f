class Client {
  int? id;
  String? adress;
  String? city;
  String? email;
  String? logo;
  String? name;
  int? phone;
  String? zipcode;
  String? description;

  Client(
      {required this.id,
      required this.adress,
      required this.city,
      required this.email,
      required this.logo,
      required this.name,
      required this.phone,
      required this.zipcode,
      required this.description});

  Client.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    adress = json['adress'];
    city = json['city'];
    email = json['email'];
    logo = json['logo'];
    name = json['name'];
    phone = json['phone'];
    zipcode = json['zipcode'];
    description = json['description'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id.toString();
    data['adress'] = adress.toString();
    data['city'] = city.toString();
    data['email'] = email.toString();
    data['logo'] = logo.toString();
    data['name'] = name.toString();
    data['phone'] = phone.toString();
    data['zipcode'] = zipcode.toString();
    data['description'] = description.toString();
    return data;
  }
}
