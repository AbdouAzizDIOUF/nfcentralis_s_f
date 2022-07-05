class Role {
  final String name;
  final int id;

  Role({
    required this.id,
    required this.name,
  });
}

List<Role> roleList = [
  Role(id: 1, name: "ROLE_ADMIN"),
  Role(id: 2, name: "ROLE_TRAVAILLEUR"),
  Role(id: 3, name: "ROLE_CHEF"),
  Role(id: 4, name: "ROLE_MODERATOR"),
  Role(id: 5, name: "ROLE_USER"),
  Role(id: 6, name: "ROLE_ADJOIN_CHEF"),
];
