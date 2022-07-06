import 'package:nfcentralis/models/companie.dart';
import 'package:nfcentralis/models/role.dart';
import 'package:nfcentralis/models/utilisateur.dart';
import 'package:nfcentralis/repository/repository.dart';

class UtilisateurController {
  final RepositoryUtilisateur _repository;

  UtilisateurController(this._repository);

  //get
  Future<List<Utilisateur>> fetchUtilisateurList() async {
    return _repository.getUtilisateur();
  }

  //put
  Future<String> updatePutCompleted(Utilisateur utilisateur) async {
    return _repository.putCompleted(utilisateur);
  }

  //delete
  Future<String> deleteUtilisateur(Utilisateur utilisateur) async {
    return _repository.deleteUtilisateur(utilisateur);
  }

  //post
  Future<String> postUtilisateur(Utilisateur utilisateur) async {
    return _repository.postUtilisateur(utilisateur);
  }

  Future<Utilisateur> getUtilisateurById(int userId) async {
    return _repository.getUtilisateurById(userId);
  }

  Future<Companie> getUtilisateurCompany(int userId) async {
    return _repository.getUtilisateurCompany(userId);
  }

  Future<List<Role>> getUtilisateurRole(int userId) async {
    return _repository.getUtilisateurRole(userId);
  }
}
