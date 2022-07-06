import 'package:nfcentralis/models/role.dart';
import 'package:nfcentralis/repository/repository.dart';

class RoleController {
  final RepositoryRole _repository;

  RoleController(this._repository);

  Future<List<Role>> getRoles() async {
    return _repository.getRoles();
  }

  Future<Role> getRoleById(int roleId) async {
    return _repository.getRoleById(roleId);
  }
}
