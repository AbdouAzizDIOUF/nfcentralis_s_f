import 'package:nfcentralis/models/client.dart';
import 'package:nfcentralis/repersitory/repersitory.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class ClientRepersitory implements Repersitory {
  String dataUrl = "http://localhost:8888";

  @override
  Future<String> deleteClient(Client client) async {
    var url = Uri.parse('$dataUrl/clients/${client.id}');
    var result = 'false';
    await http.delete(url).then((value) {
      print(value.body);
      //temp
      return result = 'true';
    });
    return result;
  }

  @override
  Future<List> getClient() async {
    List clientList = [];
    var url = Uri.parse('$dataUrl/clients');
    var response = await http.get(url);
    print('status code code : ${response.statusCode}');
    var body = jsonDecode(response.body);
    for (var i = 0; i < body.length; i++) {
      clientList.add(Client.fromJson(body[i]));
    }
    return clientList;
  }

  @override
  Future<String> patchCompleted(Client client) {
    // TODO: implement patchCompleted
    throw UnimplementedError();
  }

  @override
  Future<String> postClient(Client client) async {
    print('${client.toJson()}');
    var url = Uri.parse('$dataUrl/clients/');
    var response = await http.post(url, body: client.toJson());
    print(response.statusCode);
    print(response.body);
    return 'true';
  }

  @override
  Future<String> putCompleted(Client client) async {
    var url = Uri.parse('$dataUrl/clients/${client.id}');
    String resData = '';
    await http.put(
      url,
      body: {
        'completed': (!client.completed!).toString(),
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