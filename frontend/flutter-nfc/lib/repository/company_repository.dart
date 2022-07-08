import 'package:nfcentralis/models/company.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:nfcentralis/constants.dart';
import 'package:nfcentralis/repository/repository.dart';

class CompanyRepository implements RepositoryCompany {
  @override
  Future<String> deleteCompany(Company company) async {
    var url = Uri.parse('$dataUrl/companies/${company.id}');
    var result = 'false';
    await http.delete(url).then((value) {
      print(value.body);
      //temp
      return result = 'true';
    });
    return result;
  }

  @override
  Future<List<Company>> getCompanyOrderers() async {
    List<Company> companieList = [];
    var url = Uri.parse('$dataUrl/companies?size=500');
    var response = await http.get(url);
    var body = json.decode(utf8.decode(response.bodyBytes));
    var orderer = body['_embedded']['orderers'];

    for (var i = 0; i < orderer.length; i++) {
      companieList.add(Company.fromJson(orderer[i]));
    }
    return companieList;
  }

  @override
  Future<List<Company>> getCompanyProviders() async {
    List<Company> companieList = [];
    var url = Uri.parse('$dataUrl/companies?size=500');
    var response = await http.get(url);
    var body = json.decode(utf8.decode(response.bodyBytes));
    var provider = body['_embedded']['providers'];

    for (var i = 0; i < provider.length; i++) {
      companieList.add(Company.fromJson(provider[i]));
    }
    return companieList;
  }

  @override
  Future<Company> getCompanyById(int companyId) async {
    Company company;
    var url = Uri.parse('$dataUrl/companies/$companyId');
    var response = await http.get(url);
    var body = json.decode(utf8.decode(response.bodyBytes));
    company = Company.fromJson(body);

    return company;
  }

  @override
  Future<String> postCompany(Company company) async {
    print('${company.toJson()}');
    var url = Uri.parse('$dataUrl/companies');
    var response = await http.post(url, body: company.toJson());
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
