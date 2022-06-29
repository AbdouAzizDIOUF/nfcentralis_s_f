import 'package:nfcentralis/models/utilisateur.dart';
import 'package:nfcentralis/repersitory/repersitory.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class UtilisateurRepersitory implements Repersitory_Utilisateur{
  String dataUrl = "http://localhost:8888";

  @override
  Future<String> deleteUtilisateur(Utilisateur utilisateur) async {
    var url = Uri.parse('$dataUrl/utilisateurs/${utilisateur.id}');
    var result = 'false';
    await http.delete(url).then((value) {
      print(value.body);
      //temp
      return result ='true';
    });
    return result;
  }

  @override
  Future<List> getUtilisateur() async {
    List utilisateurList = [];
    var url = Uri.parse('$dataUrl/utilisateurs');
    var response = await http.get(url);
    print('status code code : ${response.statusCode}');
    var body = jsonDecode(response.body);
    for (var i = 0; i<body.length; i++){
      utilisateurList.add(Utilisateur.fromJson(body[i]));
    }
    return utilisateurList;
  }

  @override
  Future<String> postUtilisateur(Utilisateur utilisateur) async {
    print('${utilisateur.toJson()}');
    var url = Uri.parse('$dataUrl/utilisateurs');
    var response = await http.post(url, body: utilisateur.toJson());
    print (response.statusCode);
    print (response.body);
    return 'true';
  }

  @override
  Future<String> putCompleted(Utilisateur utilisateur) async {
    var url = Uri.parse('$dataUrl/utilisateurs/${utilisateur.id}');
    String resData = '';
    await http.put(
      url,
      body: {
        'completed': (!utilisateur.completed!).toString(),
      },
      headers: {'Authorization': 'your_token'},
    ).then((response) {
      Map<String, dynamic> result = json.decode(response.body);
      print(result);
      return resData = result['completed'];
    });
    return resData;
  }

  @override
  Future<String> putUtilisateur(Utilisateur utilisateur) {
    // TODO: implement putUtilisateur
    throw UnimplementedError();
  }
}