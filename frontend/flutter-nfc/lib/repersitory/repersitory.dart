import 'package:nfcentralis/models/client.dart';
import 'package:nfcentralis/models/intervention.dart';
import 'package:nfcentralis/models/provider.dart';
import 'package:nfcentralis/models/compagnie.dart';
import 'package:nfcentralis/models/utilisateur.dart';
import 'package:nfcentralis/models/etape.dart';


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

abstract class Repersitory_Provider{
  // get
  Future<List> getProvider();
  //delete
  Future<String> deleteProvider(Provider provider);
  //post
  Future<String> postProvider(Provider provider);
  //put
  Future<String> putCompleted(Provider provider);
}
abstract class Repersitory_Compagnie{
  // get
  Future<List> getCompagnie();
  //delete
  Future<String> deleteCompagnie(Compagnie compagnie);
  //post
  Future<String> postCompagnie(Compagnie compagnie);
  //put
  Future<String> putCompleted(Compagnie compagnie);
}
abstract class Repersitory_Utilisateur{
  // get
  Future<List> getUtilisateur();
  //delete
  Future<String> deleteUtilisateur(Utilisateur utilisateur);
  //post
  Future<String> postUtilisateur(Utilisateur utilisateur);
  //put
  Future<String> putCompleted(Utilisateur utilisateur);
}
abstract class Repersitory_Intervention{
  // get
  Future<List> getIntervention();
  //delete
  Future<String> deleteIntervention(Intervention intervention);
  //post
  Future<String> postIntervention(Intervention intervention);
  //put
  Future<String> putCompleted(Intervention intervention);

}
abstract class Repersitory_Etape{
  // get
  Future<List> getEtape();
  //delete
  Future<String> deleteEtape(Etape etape);
  //post
  Future<String> postEtape(Etape etape);
  //put
  Future<String> putCompleted(Etape etape);

}