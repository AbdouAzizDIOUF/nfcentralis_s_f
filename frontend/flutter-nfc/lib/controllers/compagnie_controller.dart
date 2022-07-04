import 'package:nfcentralis/models/compagnie.dart';
import 'package:nfcentralis/repersitory/repersitory.dart';

class CompagnieController{
  final Repersitory_Compagnie _repersitory;

  CompagnieController(this._repersitory);

  //get
  Future<List> fetchCompagnieList() async {
    return _repersitory.getCompagnie();
  }
  //put
  Future<String> updatePutCompleted(Compagnie compagnie) async {
    return _repersitory.putCompleted(compagnie);
  }
  //delete
  Future<String> deleteCompagnie(Compagnie compagnie) async {
    return _repersitory.deleteCompagnie(compagnie);
  }
  //post
  Future<String> postCompagnie(Compagnie compagnie) async {
    return _repersitory.postCompagnie(compagnie);
  }
}