import 'package:nfcentralis/models/intervention.dart';
import 'package:nfcentralis/repository/repository.dart';

class InterventionController {
  final RepositoryIntervention _repository;

  InterventionController(this._repository);

  //get
  Future<List> fetchInterventionList() async {
    return _repository.getIntervention();
  }

  //put
  Future<String> updatePutCompleted(Intervention intervention) async {
    return _repository.putCompleted(intervention);
  }

  //delete
  Future<String> deleteIntervention(Intervention intervention) async {
    return _repository.deleteIntervention(intervention);
  }

  //post
  Future<String> postIntervention(Intervention intervention) async {
    return _repository.postIntervention(intervention);
  }
}
