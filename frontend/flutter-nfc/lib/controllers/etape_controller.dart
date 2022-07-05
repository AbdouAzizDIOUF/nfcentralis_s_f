import 'package:nfcentralis/models/etape.dart';
import 'package:nfcentralis/repository/repository.dart';

class EtapeController {
  final RepositoryEtape _repersitory;

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
