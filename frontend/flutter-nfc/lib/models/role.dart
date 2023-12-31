class Role {
  int? id;
  String? name;

  Role({
    required this.id,
    required this.name,
  });

  Role.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name.toString();

    return data;
  }
}
