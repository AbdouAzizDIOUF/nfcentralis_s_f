import 'package:nfcentralis/models/company.dart';
import 'package:nfcentralis/models/role.dart';

class Utilisateur {
  int? id;
  String? firstName;
  String? lastName;
  String? email;
  String? mobile;
  String? userName;
  List<Role>? role;
  Company? company;

  Utilisateur({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.mobile,
    required this.userName,
    this.role,
    this.company,
  });

  Utilisateur.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    email = json['email'];
    firstName = json['firstName'];
    lastName = json['lastName'];
    mobile = json['mobile'];
    userName = json['userName'];
    if (json["company"] != null) {
      role = List<Role>.from(json["roles"].map((x) => Role.fromJsonName(x)));
    }
    if (json["company"] != null) {
      company = Company.fromJson(json["company"]);
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['email'] = email.toString();
    data['firstName'] = firstName.toString();
    data['lastName'] = lastName.toString();
    data['userName'] = userName.toString();
    data['mobile'] = mobile.toString();
    List<dynamic>.from(role!.map((x) => x.toJson()));
    return data;
  }
}
