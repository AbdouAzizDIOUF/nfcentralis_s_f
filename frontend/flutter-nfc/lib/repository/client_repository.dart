import 'package:nfcentralis/models/client.dart';
import 'package:nfcentralis/repository/repository.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:nfcentralis/constants.dart';

class ClientRepository implements RepositoryClient {
  @override
  Future<String> deleteClient(Client client) async {
    var url = Uri.parse('$dataUrl/clients/${client.id}');
    var result = 'false';
    await http.delete(url).then((value) {
      //temp
      return result = 'true';
    });
    return result;
  }

  @override
  Future<List> getClient() async {
    List clientList = [];
    var url = Uri.parse('$dataUrl/clients?size=500');
    var response = await http.get(url);
    var body = json.decode(utf8.decode(response.bodyBytes));
    var client = body['_embedded']['clients'];
    for (var i = 0; i < client.length; i++) {
      clientList.add(Client.fromJsonWithInstallationAndUser(client[i]));
    }
    return clientList;
  }

  @override
  Future<Client> getClientById(int clientId) async {
    Client client;
    var url = Uri.parse('$dataUrl/clients/$clientId');
    var response = await http.get(url);
    var body = json.decode(utf8.decode(response.bodyBytes));
    client = Client.fromJson(body);

    return client;
  }

  @override
  Future<String> postClient(Client client) async {
    print('${client.toJson()}');
    var url = Uri.parse('$dataUrl/clients/');
    var response = await http.post(url, body: client.toJson());
    return 'true';
  }

  // @override
  // Future<String> putCompleted(Client client) async {
  //   var url = Uri.parse('$dataUrl/clients/${client.id}');
  //   String resData = '';
  //   await http.put(
  //     url,
  //     body: {
  //       'completed': (!client.completed!).toString(),
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
