import 'package:nfcentralis/models/client.dart';
import 'package:nfcentralis/repository/client_repository.dart';

class ClientController {
  final ClientRepository _repository;

  ClientController(this._repository);

  //get
  Future<List> fetchClientList() async {
    return _repository.getClient();
  }

  Future<Client> getClientById(int clientId) async {
    return _repository.getClientById(clientId);
  }

  // //put
  // Future<String> updatePutCompleted(Client client) async {
  //   return _repersitory.putCompleted(client);
  // }

  //delete
  Future<String> deleteClient(Client client) async {
    return _repository.deleteClient(client);
  }

  //post
  Future<String> postClient(Client client) async {
    return _repository.postClient(client);
  }
}
