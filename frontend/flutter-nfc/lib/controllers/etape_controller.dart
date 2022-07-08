import 'package:nfcentralis/models/etape.dart';
import 'package:nfcentralis/repository/repository.dart';

class EtapeController {
  final RepositoryEtape _repository;

  EtapeController(this._repository);

  //get
  Future<List> fetchEtapeList() async {
    return _repository.getEtape();
  }

  //put
  Future<String> updatePutCompleted(Etape etape) async {
    return _repository.putCompleted(etape);
  }

  //delete
  Future<String> deleteEtape(Etape etape) async {
    return _repository.deleteEtape(etape);
  }

  //post
  Future<String> postEtape(Etape etape) async {
    return _repository.postEtape(etape);
  }
}
