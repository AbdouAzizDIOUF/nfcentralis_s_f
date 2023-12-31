import 'package:nfcentralis/models/client.dart';
import 'package:nfcentralis/models/intervention.dart';
import 'package:nfcentralis/models/provider.dart';
import 'package:nfcentralis/models/companie.dart';
import 'package:nfcentralis/models/role.dart';
import 'package:nfcentralis/models/utilisateur.dart';
import 'package:nfcentralis/models/etape.dart';

abstract class Repository {
  // get
  Future<List> getClient();
  //patch
  Future<String> patchCompleted(Client client);
  //put
  // Future<String> putCompleted(Client client);
  //delete
  Future<String> deleteClient(Client client);
  //post
  Future<String> postClient(Client client);
}

abstract class RepositoryProvider {
  // get
  Future<List> getProvider();
  //delete
  Future<String> deleteProvider(Provider provider);
  //post
  Future<String> postProvider(Provider provider);
  //put
  Future<String> putCompleted(Provider provider);
}

abstract class RepositoryCompanie {
  // get
  Future<List> getCompagnieOrderers();

  Future<List> getCompagnieProviders();
  //delete
  Future<String> deleteCompagnie(Companie compagnie);
  //post
  Future<String> postCompagnie(Companie compagnie);
  //put
  // Future<String> putCompleted(Companie compagnie);
}

abstract class RepositoryUtilisateur {
  // get
  Future<List<Utilisateur>> getUtilisateur();
  //delete
  Future<String> deleteUtilisateur(Utilisateur utilisateur);
  //post
  Future<String> postUtilisateur(Utilisateur utilisateur);
  //put
  Future<String> putCompleted(Utilisateur utilisateur);

  Future<Utilisateur> getUtilisateurById(int userId);

  Future<Companie> getUtilisateurCompany(int userId);

  Future<Role> getUtilisateurRole(int userId);
}

abstract class RepositoryIntervention {
  // get
  Future<List> getIntervention();
  //delete
  Future<String> deleteIntervention(Intervention intervention);
  //post
  Future<String> postIntervention(Intervention intervention);
  //put
  Future<String> putCompleted(Intervention intervention);
}

abstract class RepositoryEtape {
  // get
  Future<List> getEtape();
  //delete
  Future<String> deleteEtape(Etape etape);
  //post
  Future<String> postEtape(Etape etape);
  //put
  Future<String> putCompleted(Etape etape);
}

abstract class RepositoryRole {
  Future<List<Role>> getRoles();

  Future<Role> getRoleById(int roleId);
}
