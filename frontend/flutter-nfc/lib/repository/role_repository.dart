import 'package:nfcentralis/models/role.dart';
import 'package:nfcentralis/repository/repository.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class RoleRepository implements RepositoryRole {
  String dataUrl = "http://localhost:8888";

  @override
  Future<List<Role>> getRoles() async {
    List<Role> roleList = [];
    var url = Uri.parse('$dataUrl/utilisateurs');
    var response = await http.get(url);
    var body = json.decode(utf8.decode(response.bodyBytes));
    for (var i = 0; i < body.length; i++) {
      roleList.add(Role.fromJson(body["_embedded"]["roles"][i]));
    }
    return roleList;
  }

  @override
  Future<Role> getRoleById(int roleId) async {
    Role role;
    var url = Uri.parse('$dataUrl/roles/$roleId');
    var response = await http.get(url);
    var body = json.decode(utf8.decode(response.bodyBytes));
    role = Role.fromJson(body);

    return role;
  }
}
