import 'package:nfcentralis/models/companie.dart';
import 'package:nfcentralis/repository/repository.dart';

class CompanieController {
  final RepositoryCompanie _repersitory;

  CompanieController(this._repersitory);

  //get
  Future<List> fetchCompanieOrdererList() async {
    return _repersitory.getCompagnieOrderers();
  }

  Future<List> fetchCompanieProviderList() async {
    return _repersitory.getCompagnieProviders();
  }

  // //put
  // Future<String> updatePutCompleted(Companie compagnie) async {
  //   return _repersitory.putCompleted(compagnie);
  // }

  //delete
  Future<String> deleteCompagnie(Companie compagnie) async {
    return _repersitory.deleteCompagnie(compagnie);
  }

  //post
  Future<String> postCompagnie(Companie compagnie) async {
    return _repersitory.postCompagnie(compagnie);
  }
}
