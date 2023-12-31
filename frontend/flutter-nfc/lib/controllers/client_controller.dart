import 'package:nfcentralis/models/client.dart';
import 'package:nfcentralis/repository/repository.dart';

class ClientController {
  final Repository _repersitory;

  ClientController(this._repersitory);

  //get
  Future<List> fetchClientList() async {
    return _repersitory.getClient();
  }

  // //put
  // Future<String> updatePutCompleted(Client client) async {
  //   return _repersitory.putCompleted(client);
  // }

  //delete
  Future<String> deleteClient(Client client) async {
    return _repersitory.deleteClient(client);
  }

  //post
  Future<String> postClient(Client client) async {
    return _repersitory.postClient(client);
  }
}
