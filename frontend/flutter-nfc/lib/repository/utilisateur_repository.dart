import 'package:nfcentralis/models/company.dart';
import 'package:nfcentralis/models/role.dart';
import 'package:nfcentralis/models/utilisateur.dart';
import 'package:nfcentralis/repository/repository.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:nfcentralis/constants.dart';

class UtilisateurRepository implements RepositoryUtilisateur {
  @override
  Future<String> deleteUtilisateur(Utilisateur utilisateur) async {
    var url = Uri.parse('$dataUrl/utilisateurs/${utilisateur.id}');
    var result = 'false';
    await http.delete(url).then((value) {
      print(value.body);
      //temp
      return result = 'true';
    });
    return result;
  }

  @override
  Future<List<Utilisateur>> getUtilisateur() async {
    List<Utilisateur> utilisateurList = [];
    var url = Uri.parse('$dataUrl/utilisateurs?size=500');
    var response = await http.get(url);
    var body = json.decode(utf8.decode(response.bodyBytes));
    var utilisateur = body["_embedded"]["utilisateurs"];

    for (var i = 0; i < utilisateur.length; i++) {
      utilisateurList.add(Utilisateur.fromJson(utilisateur[i]));
    }
    return utilisateurList;
  }

  @override
  Future<List<Utilisateur>> getUtilisateurOfCompany(int userId) async {
    List<Utilisateur> utilisateurList = [];
    var url = Uri.parse('$dataUrl/utilisateurs/$userId/company');
    var response = await http.get(url);
    var body = json.decode(utf8.decode(response.bodyBytes));
    var utilisateur = body["_embedded"]["utilisateurs"];
    print(utilisateur);

    for (var i = 0; i < utilisateur.length; i++) {
      if (utilisateur[i]["id"] != userId) {
        utilisateurList.add(Utilisateur.fromJson(utilisateur[i]));
      }
    }
    return utilisateurList;
  }

  @override
  Future<Utilisateur> getUtilisateurById(int userId) async {
    Utilisateur user;
    var url = Uri.parse('$dataUrl/utilisateurs/$userId');
    var response = await http.get(url);
    var body = json.decode(utf8.decode(response.bodyBytes));
    user = Utilisateur.fromJson(body);

    return user;
  }

  @override
  Future<Role> getUtilisateurRole(int userId) async {
    Role role;
    var url = Uri.parse('$dataUrl/utilisateurs/$userId/roles');
    var response = await http.get(url);
    var body = json.decode(utf8.decode(response.bodyBytes));
    role = Role.fromJson(body["_embedded"]["roles"]);

    return role;
  }

  @override
  Future<Company> getUtilisateurCompany(int userId) async {
    Company companie;
    var url = Uri.parse('$dataUrl/utilisateurs/$userId/company');
    var response = await http.get(url);
    var body = json.decode(utf8.decode(response.bodyBytes));
    companie = Company.fromJson(body);

    return companie;
  }

  @override
  Future<String> postUtilisateur(Utilisateur utilisateur) async {
    print('${utilisateur.toJson()}');
    var url = Uri.parse('$dataUrl/utilisateurs');
    var response = await http.post(url, body: utilisateur.toJson());
    print(response.statusCode);
    print(response.body);
    return 'true';
  }

  @override
  Future<String> putCompleted(Utilisateur utilisateur) {
    // TODO: implement putCompleted
    throw UnimplementedError();
  }

  // @override
  // Future<String> putCompleted(Utilisateur utilisateur) async {
  //   var url = Uri.parse('$dataUrl/utilisateurs/${utilisateur.id}');
  //   String resData = '';
  //   await http.put(
  //     url,
  //     body: {
  //       'completed': (!utilisateur.completed!).toString(),
  //     },
  //     headers: {'Authorization': 'your_token'},
  //   ).then((response) {
  //     Map<String, dynamic> result = json.decode(response.body);
  //     print(result);
  //     return resData = result['completed'];
  //   });
  //   return resData;
  // }

  // @override
  // Future<String> putUtilisateur(Utilisateur utilisateur) {
  //   // TODO: implement putUtilisateur
  //   throw UnimplementedError();
  // }
}
