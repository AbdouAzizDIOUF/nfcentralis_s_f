import 'package:nfcentralis/models/etape.dart';
import 'package:nfcentralis/repersitory/repersitory.dart';

class EtapeController{
  final Repersitory_Etape _repersitory;

  EtapeController(this._repersitory);

  //get
  Future<List> fetchEtapeList() async {
    return _repersitory.getEtape();
  }
  //put
  Future<String> updatePutCompleted(Etape etape) async {
    return _repersitory.putCompleted(etape);
  }
  //delete
  Future<String> deleteEtape(Etape etape) async {
    return _repersitory.deleteEtape(etape);
  }
  //post
  Future<String> postEtape(Etape etape) async {
    return _repersitory.postEtape(etape);
  }
}