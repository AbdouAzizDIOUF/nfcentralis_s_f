class Role {
  int? id;
  String? name;

  Role({
    this.id,
    required this.name,
  });

  Role.fromJson(Map<String, dynamic> json) {
    id = json['id']!;
    name = json['name'];
  }

  Role.fromJsonName(Map<String, dynamic> json) {
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id!;
    data['name'] = name.toString();

    return data;
  }

  Map<String, dynamic> toJsonName() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name.toString();

    return data;
  }
}
