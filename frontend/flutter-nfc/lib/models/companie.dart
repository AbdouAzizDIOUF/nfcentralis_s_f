class Companie {
  int? id;
  String? adress;
  String? city;
  String? email;
  String? name;
  int? phone;
  String? zipcode;
  String? description;
  String? logo;

  Companie({
    required this.id,
    required this.adress,
    required this.city,
    required this.email,
    required this.name,
    required this.phone,
    required this.zipcode,
    required this.description,
    required this.logo,
  });

  Companie.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    adress = json['adress'];
    city = json['city'];
    email = json['email'];
    name = json['name'];
    phone = json['phone'];
    zipcode = json['zipcode'];
    description = json['description'];
    logo = json['logo'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id.toString();
    data['name'] = name.toString();
    data['adress'] = adress.toString();
    data['city'] = city.toString();
    data['zipcode'] = zipcode.toString();
    data['phone'] = phone.toString();
    data['email'] = email.toString();
    data['description'] = description.toString();
    data['logo'] = logo.toString();
    return data;
  }
}
