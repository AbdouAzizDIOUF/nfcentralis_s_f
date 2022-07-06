import 'package:nfcentralis/models_test_debug_solo/role.dart';

class User {
  final String? firstName, lastName, email, userName, mobile;
  final Role role;
  User(
      {this.email,
      this.firstName,
      this.lastName,
      this.mobile,
      this.userName,
      required this.role});
}

List<User> userList = [
  User(
      firstName: "Jean",
      lastName: "Valjean",
      email: "jeanval@hotmùail.com",
      userName: "jVj",
      mobile: "+33654748944",
      role: roleList[2]),
  User(
      firstName: "Rick",
      lastName: "Sanchez",
      email: "pickle.rick@yahoo.space",
      userName: "morty_is_an_idiot",
      mobile: "0758963212",
      role: roleList[1]),
  User(
      firstName: "Jack",
      lastName: "Bauer",
      email: "kiefer.sutherland@cia.us",
      userName: "Chrono24",
      mobile: "+33724242424",
      role: roleList[2]),
  User(
      firstName: "Cersei",
      lastName: "Lannister",
      email: "cersei@westeros.we",
      userName: "queen_of_kings_landing",
      mobile: "0325689478",
      role: roleList[1]),
  User(
      firstName: "Gohou",
      lastName: "Michel",
      email: "not_tehisson@mafamille.civ",
      userName: "gohou",
      mobile: "+33547879521",
      role: roleList[4]),
  User(
      firstName: "Anna",
      lastName: "Liebert",
      email: "liebert_anne@monster.de",
      userName: "anna04",
      mobile: "+33658978445",
      role: roleList[5]),
  User(
      firstName: "Jean",
      lastName: "Valjean",
      email: "jeanval@hotmùail.com",
      userName: "jVj",
      mobile: "+33654748944",
      role: roleList[2]),
  User(
      firstName: "Rick",
      lastName: "Sanchez",
      email: "pickle.rick@yahoo.space",
      userName: "morty_is_an_idiot",
      mobile: "0758963212",
      role: roleList[1]),
  User(
      firstName: "Jack",
      lastName: "Bauer",
      email: "kiefer.sutherland@cia.us",
      userName: "Chrono24",
      mobile: "+33724242424",
      role: roleList[2]),
  User(
      firstName: "Cersei",
      lastName: "Lannister",
      email: "cersei@westeros.we",
      userName: "queen_of_kings_landing",
      mobile: "0325689478",
      role: roleList[3]),
  User(
      firstName: "Gohou",
      lastName: "Michel",
      email: "not_tehisson@mafamille.civ",
      userName: "gohou",
      mobile: "+33547879521",
      role: roleList[5]),
  User(
      firstName: "Anna",
      lastName: "Liebert",
      email: "liebert_anne@monster.de",
      userName: "anna04",
      mobile: "+33658978445",
      role: roleList[4]),
  User(
      firstName: "Jean",
      lastName: "Valjean",
      email: "jeanval@hotmùail.com",
      userName: "jVj",
      mobile: "+33654748944",
      role: roleList[1]),
  User(
      firstName: "Rick",
      lastName: "Sanchez",
      email: "pickle.rick@yahoo.space",
      userName: "morty_is_an_idiot",
      mobile: "0758963212",
      role: roleList[2]),
  User(
      firstName: "Jack",
      lastName: "Bauer",
      email: "kiefer.sutherland@cia.us",
      userName: "Chrono24",
      mobile: "+33724242424",
      role: roleList[5]),
  User(
      firstName: "Cersei",
      lastName: "Lannister",
      email: "cersei@westeros.we",
      userName: "queen_of_kings_landing",
      mobile: "0325689478",
      role: roleList[4]),
  User(
      firstName: "Gohou",
      lastName: "Michel",
      email: "not_tehisson@mafamille.civ",
      userName: "gohou",
      mobile: "+33547879521",
      role: roleList[3]),
  User(
      firstName: "Anna",
      lastName: "Liebert",
      email: "liebert_anne@monster.de",
      userName: "anna04",
      mobile: "+33658978445",
      role: roleList[5]),
];
