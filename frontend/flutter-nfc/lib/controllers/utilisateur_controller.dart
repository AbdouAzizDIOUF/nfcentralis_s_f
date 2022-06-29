import 'package:nfcentralis/models/utilisateur.dart';
import 'package:nfcentralis/repersitory/repersitory.dart';

class UtilisateurController{
  final Repersitory_Utilisateur _repersitory;

  UtilisateurController(this._repersitory);

  //get
  Future<List> fetchUtilisateurList() async {
    return _repersitory.getUtilisateur();
  }
  //put
  Future<String> updatePutCompleted(Utilisateur utilisateur) async {
    return _repersitory.putCompleted(utilisateur);
  }
  //delete
  Future<String> deleteUtilisateur(Utilisateur utilisateur) async {
    return _repersitory.deleteUtilisateur(utilisateur);
  }
  //post
  Future<String> postUtilisateur(Utilisateur utilisateur) async {
    return _repersitory.postUtilisateur(utilisateur);
  }
}