import 'package:nfcentralis/models/intervention.dart';
import 'package:nfcentralis/repersitory/repersitory.dart';

class InterventionController{
  final Repersitory_Intervention _repersitory;

  InterventionController(this._repersitory);

  //get
  Future<List> fetchInterventionList() async {
    return _repersitory.getIntervention();
  }
  //put
  Future<String> updatePutCompleted(Intervention intervention) async {
    return _repersitory.putCompleted(intervention);
  }
  //delete
  Future<String> deleteIntervention(Intervention intervention) async {
    return _repersitory.deleteIntervention(intervention);
  }
  //post
  Future<String> postIntervention(Intervention intervention) async {
    return _repersitory.postIntervention(intervention);
  }
}