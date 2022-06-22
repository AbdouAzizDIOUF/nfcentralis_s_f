import 'package:nfcentralis/models/client.dart';
import 'package:nfcentralis/repersitory/repersitory.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class ClientReprsitory implements Repersitory{
  String dataUrl = "https://jsonplaceholder.typicode.com/posts";

  @override
  Future<String> deleteClient(Client client) {
    // TODO: implement deleteClient
    throw UnimplementedError();
  }

  @override
  Future<List> getClient() async {
   List clientList = [];
   var url = Uri.parse('$dataUrl/clients');
   var response = await http.get(url);
   print('status code code : ${response.statusCode}');
   var body = jsonDecode(response.body);
   for (var i = 0; i<body.length; i++){
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
  Future<String> postClient(Client client) {
    // TODO: implement postClient
    throw UnimplementedError();
  }

  @override
  Future<String> putCompleted(Client client) {
    // TODO: implement putCompleted
    throw UnimplementedError();
  }
  
}