import 'package:nfcentralis/models/etape.dart';
import 'package:nfcentralis/repository/repository.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class EtapeRepository implements RepositoryEtape {
  String dataUrl = "http://localhost:8888";

  @override
  Future<String> deleteEtape(Etape etape) async {
    var url = Uri.parse('$dataUrl/etapes/${etape.id}');
    var result = 'false';
    await http.delete(url).then((value) {
      print(value.body);
      //temp
      return result = 'true';
    });
    return result;
  }

  @override
  Future<List> getEtape() async {
    List etapeList = [];
    var url = Uri.parse('$dataUrl/etapes');
    var response = await http.get(url);
    print('status code code : ${response.statusCode}');
    var body = json.decode(utf8.decode(response.bodyBytes));
    for (var i = 0; i < body.length; i++) {
      etapeList.add(Etape.fromJson(body[i]));
    }
    return etapeList;
  }

  @override
  Future<String> postEtape(Etape etape) async {
    print('${etape.toJson()}');
    var url = Uri.parse('$dataUrl/etapes');
    var response = await http.post(url, body: etape.toJson());
    print(response.statusCode);
    print(response.body);
    return 'true';
  }

  @override
  Future<String> putCompleted(Etape etape) async {
    var url = Uri.parse('$dataUrl/etapes/${etape.id}');
    String resData = '';
    await http.put(
      url,
      body: {
        'completed': (!etape.completed!).toString(),
      },
      headers: {'Authorization': 'your_token'},
    ).then((response) {
      Map<String, dynamic> result = json.decode(response.body);
      print(result);
      return resData = result['completed'];
    });
    return resData;
  }
}
