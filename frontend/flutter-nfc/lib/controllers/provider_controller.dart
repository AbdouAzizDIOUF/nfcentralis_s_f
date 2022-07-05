import 'package:nfcentralis/models/provider.dart';
import 'package:nfcentralis/repository/repository.dart';

class ProviderController {
  final RepositoryProvider _repository;

  ProviderController(this._repository);

  //get
  Future<List> fetchProviderList() async {
    return _repository.getProvider();
  }

  //put
  Future<String> updatePutCompleted(Provider provider) async {
    return _repository.putCompleted(provider);
  }

  //delete
  Future<String> deleteProvider(Provider provider) async {
    return _repository.deleteProvider(provider);
  }

  //post
  Future<String> postProvider(Provider provider) async {
    return _repository.postProvider(provider);
  }
}
