import 'package:nfcentralis/models/compagnie.dart';
import 'package:nfcentralis/repersitory/repersitory.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class CompagnieRepersitory implements Repersitory_Compagnie{
  String dataUrl = "http://localhost:8888";

  @override
  Future<String> deleteCompagnie(Compagnie compagnie) async {
    var url = Uri.parse('$dataUrl/compagnies/${compagnie.id}');
    var result = 'false';
    await http.delete(url).then((value) {
      print(value.body);
      //temp
      return result ='true';
    });
    return result;
  }

  @override
  Future<List> getCompagnie() async {
    List compagnieList = [];
    var url = Uri.parse('$dataUrl/compagnies');
    var response = await http.get(url);
    print('status code code : ${response.statusCode}');
    var body = jsonDecode(response.body);
    for (var i = 0; i<body.length; i++){
      compagnieList.add(Compagnie.fromJson(body[i]));
    }
    return compagnieList;
  }

  @override
  Future<String> postCompagnie(Compagnie compagnie) async {
    print('${compagnie.toJson()}');
    var url = Uri.parse('$dataUrl/compagnies');
    var response = await http.post(url, body: compagnie.toJson());
    print (response.statusCode);
    print (response.body);
    return 'true';
  }

  @override
  Future<String> putCompleted(Compagnie compagnie) async {
    var url = Uri.parse('$dataUrl/compagnies/${compagnie.id}');
    String resData = '';
    await http.put(
      url,
      body: {
        'completed': (!compagnie.completed!).toString(),
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