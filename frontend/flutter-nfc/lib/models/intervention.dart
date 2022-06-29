class Intervention {
  int? id;
  String? detail;
  String? name;
  bool? completed;


  Intervention({required this.id, required this.detail, required this.name, required this.completed});

  Intervention.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    detail = json['detail'];
    name = json['name'];
    completed = json['completed'];
  }


  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id.toString();
    data['detail'] = this.detail.toString();
    data['name'] = this.name.toString();
    data['completed'] = this.completed.toString();
    return data;
  }
}