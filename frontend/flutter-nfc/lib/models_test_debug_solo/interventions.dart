// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:nfcentralis/models_test_debug_solo/installation.dart';
import 'package:nfcentralis/models_test_debug_solo/user.dart';

class Intervention {
  final String? name, status, detail;
  final Installation? installation;
  final User? user;

  Intervention({
    this.status,
    this.detail,
    this.user,
    this.name,
    this.installation,
  });
}

List interventionList = [
  Intervention(
    name: "Chauffe Eau",
    status: "En Cours",
    detail: "assets/Maintenance_chaudiere.xml",
    user: userList[0],
    installation: installationList[0],
  ),
  Intervention(
    name: "Pompe hydraulique",
    status: "Terminé",
    user: userList[1],
    detail: "assets/Maintenance_chaudiere.xml",
    installation: installationList[0],
  ),
  Intervention(
    name: "Robinet",
    status: "En Attente",
    user: userList[2],
    detail: "assets/Maintenance_chaudiere.xml",
    installation: installationList[1],
  ),
  Intervention(
    name: "Réparation chaudière",
    status: "En Cours",
    user: userList[3],
    detail: "assets/Maintenance_chaudiere.xml",
    installation: installationList[2],
  ),
  Intervention(
    name: "Compteur d'eau",
    status: "Terminé",
    user: userList[4],
    detail: "assets/Maintenance_chaudiere.xml",
    installation: installationList[2],
  ),
  Intervention(
    name: "Compteur d'eau",
    status: "En Attente",
    user: userList[5],
    detail: "assets/Maintenance_chaudiere.xml",
    installation: installationList[2],
  ),
];
