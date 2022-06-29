import 'package:nfcentralis/models/provider.dart';
import 'package:nfcentralis/repersitory/repersitory.dart';

class ProviderController{
  final Repersitory_Provider _repersitory;

  ProviderController(this._repersitory);

  //get
  Future<List> fetchProviderList() async {
    return _repersitory.getProvider();
  }
  //put
  Future<String> updatePutCompleted(Provider provider) async {
    return _repersitory.putCompleted(provider);
  }
  //delete
  Future<String> deleteProvider(Provider provider) async {
    return _repersitory.deleteProvider(provider);
  }
  //post
  Future<String> postProvider(Provider provider) async {
    return _repersitory.postProvider(provider);
  }
}