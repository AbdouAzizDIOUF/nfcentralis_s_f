import 'package:nfcentralis/models/company.dart';

import '../repository/repository.dart';

class CompanyController {
  final RepositoryCompany _repository;

  CompanyController(this._repository);

  //get
  Future<List<Company>> fetchCompanieOrdererList() async {
    return _repository.getCompanyOrderers();
  }

  Future<List<Company>> fetchCompanieProviderList() async {
    return _repository.getCompanyProviders();
  }

  Future<Company> getCompanyById(int companyId) async {
    return _repository.getCompanyById(companyId);
  }

  // //put
  // Future<String> updatePutCompleted(Companie compagnie) async {
  //   return _repersitory.putCompleted(compagnie);
  // }

  //delete
  Future<String> deleteCompagnie(Company company) async {
    return _repository.deleteCompany(company);
  }

  //post
  Future<String> postCompagnie(Company company) async {
    return _repository.postCompany(company);
  }
}
