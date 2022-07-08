import 'package:nfcentralis/models/provider.dart';
import 'package:nfcentralis/repository/repository.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:nfcentralis/constants.dart';

class ProviderRepository implements RepositoryProvider {
  @override
  Future<String> deleteProvider(Provider provider) async {
    var url = Uri.parse('$dataUrl/providers/${provider.id}');
    var result = 'false';
    await http.delete(url).then((value) {
      print(value.body);
      //temp
      return result = 'true';
    });
    return result;
  }

  @override
  Future<List> getProvider() async {
    List providerList = [];
    var url = Uri.parse('$dataUrl/providers');
    var response = await http.get(url);
    print('status code code : ${response.statusCode}');
    var body = json.decode(utf8.decode(response.bodyBytes));
    for (var i = 0; i < body.length; i++) {
      providerList.add(Provider.fromJson(body[i]));
    }
    return providerList;
  }

  @override
  Future<String> postProvider(Provider provider) async {
    print('${provider.toJson()}');
    var url = Uri.parse('$dataUrl/providers');
    var response = await http.post(url, body: provider.toJson());
    print(response.statusCode);
    print(response.body);
    return 'true';
  }

  @override
  Future<String> putCompleted(Provider provider) async {
    var url = Uri.parse('$dataUrl/providers/${provider.id}');
    String resData = '';
    await http.put(
      url,
      body: {
        'completed': (!provider.completed!).toString(),
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
