import 'package:nfcentralis/models/companie.dart';
import 'package:nfcentralis/repository/repository.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class CompanieRepository implements RepositoryCompanie {
  String dataUrl = "http://localhost:8888";

  @override
  Future<String> deleteCompagnie(Companie companie) async {
    var url = Uri.parse('$dataUrl/companies/${companie.id}');
    var result = 'false';
    await http.delete(url).then((value) {
      print(value.body);
      //temp
      return result = 'true';
    });
    return result;
  }

  @override
  Future<List<Companie>> getCompagnieOrderers() async {
    List<Companie> companieList = [];
    var url = Uri.parse('$dataUrl/companies');
    var response = await http.get(url);
    print('status code code : ${response.statusCode}');
    var body = json.decode(utf8.decode(response.bodyBytes));
    var orderer = body['_embedded']['orderers'];

    for (var i = 0; i < orderer.length; i++) {
      companieList.add(Companie.fromJson(orderer[i]));
    }
    return companieList;
  }

  @override
  Future<List<Companie>> getCompagnieProviders() async {
    List<Companie> companieList = [];
    var url = Uri.parse('$dataUrl/companies');
    var response = await http.get(url);
    print('status code code : ${response.statusCode}');
    var body = json.decode(utf8.decode(response.bodyBytes));
    var provider = body['_embedded']['providers'];

    for (var i = 0; i < provider.length; i++) {
      companieList.add(Companie.fromJson(provider[i]));
    }
    return companieList;
  }

  @override
  Future<String> postCompagnie(Companie companie) async {
    print('${companie.toJson()}');
    var url = Uri.parse('$dataUrl/companies');
    var response = await http.post(url, body: companie.toJson());
    print(response.statusCode);
    print(response.body);
    return 'true';
  }

  // @override
  // Future<String> putCompleted(Companie compagnie) async {
  //   var url = Uri.parse('$dataUrl/compagnies/${compagnie.id}');
  //   String resData = '';
  //   await http.put(
  //     url,
  //     body: {
  //       'completed': (!compagnie.completed!).toString(),
  //     },
  //     headers: {'Authorization': 'your_token'},
  //   ).then((response) {
  //     Map<String, dynamic> result = json.decode(response.body);
  //     print(result);
  //     return resData = result['completed'];
  //   });
  //   return resData;
  // }
}
