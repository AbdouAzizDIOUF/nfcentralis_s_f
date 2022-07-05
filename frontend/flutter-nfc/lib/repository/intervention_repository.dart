import 'package:nfcentralis/models/intervention.dart';
import 'package:nfcentralis/repository/repository.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class InterventionRepository implements RepositoryIntervention {
  String dataUrl = "http://localhost:8888";

  @override
  Future<String> deleteIntervention(Intervention intervention) async {
    var url = Uri.parse('$dataUrl/interventions/${intervention.id}');
    var result = 'false';
    await http.delete(url).then((value) {
      print(value.body);
      //temp
      return result = 'true';
    });
    return result;
  }

  @override
  Future<List> getIntervention() async {
    List interventionList = [];
    var url = Uri.parse('$dataUrl/interventions');
    var response = await http.get(url);
    print('status code code : ${response.statusCode}');
    var body = json.decode(utf8.decode(response.bodyBytes));
    for (var i = 0; i < body.length; i++) {
      interventionList.add(Intervention.fromJson(body[i]));
    }
    return interventionList;
  }

  @override
  Future<String> postIntervention(Intervention intervention) async {
    print('${intervention.toJson()}');
    var url = Uri.parse('$dataUrl/interventions');
    var response = await http.post(url, body: intervention.toJson());
    print(response.statusCode);
    print(response.body);
    return 'true';
  }

  @override
  Future<String> putCompleted(Intervention intervention) async {
    var url = Uri.parse('$dataUrl/interventions/${intervention.id}');
    String resData = '';
    await http.put(
      url,
      body: {
        'completed': (!intervention.completed!).toString(),
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
