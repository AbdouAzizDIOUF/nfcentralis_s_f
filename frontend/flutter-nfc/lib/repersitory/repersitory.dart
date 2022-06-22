import 'package:nfcentralis/models/client.dart';

abstract class Repersitory{
  // get
  Future<List> getClient();
  //patch
  Future<String> patchCompleted(Client client);
  //put
  Future<String> putCompleted(Client client);
  //delete
  Future<String> deleteClient(Client client);
  //post
  Future<String> postClient(Client client);
}