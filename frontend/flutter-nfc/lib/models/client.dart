import 'package:nfcentralis/models/installation.dart';
import 'package:nfcentralis/models/utilisateur.dart';

class Client {
  int? id;
  String? adress;
  String? city;
  String? email;
  String? name;
  String? phone;
  String? zipcode;
  String? description;
  Utilisateur? orderer, client;
  List<Installation>? installation;

  Client(
      {required this.id,
      required this.adress,
      required this.city,
      required this.email,
      required this.name,
      required this.phone,
      required this.zipcode,
      required this.description,
      this.orderer,
      this.client,
      this.installation});

  Client.fromJsonWithInstallationAndUser(Map<String, dynamic> json) {
    id = json['id'];
    adress = json['adress'] ?? '';
    city = json['city'] ?? '';
    email = json['email'] ?? '';
    name = json['name'] ?? '';
    phone = json['phone'] ?? '';
    zipcode = json['zipcode'] ?? '';
    description = json['description'];
    installation = List<Installation>.from(
        json["installations"].map((x) => Installation.fromJson(x)));
    client = Utilisateur.fromJson(json["utilisateur"]);
    orderer = Utilisateur.fromJson(json["userOrderer"]);
  }

  Client.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    adress = json['adress'] ?? '';
    city = json['city'] ?? '';
    email = json['email'] ?? '';
    name = json['name'] ?? '';
    phone = json['phone'] ?? '';
    zipcode = json['zipcode'] ?? '';
    description = json['description'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id.toString();
    data['adress'] = adress.toString();
    data['city'] = city.toString();
    data['email'] = email.toString();
    data['name'] = name.toString();
    data['phone'] = phone.toString();
    data['zipcode'] = zipcode.toString();
    data['description'] = description.toString();
    List<dynamic>.from(installation!.map((x) => x.toJson()));
    return data;
  }
}
