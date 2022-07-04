class Etape {
  int? id;
  String? comment;
  String? data;
  String? data2;
  String? internal_validation;
  String? validation;
  bool? completed;


  Etape({required this.id, required this.comment, required this.data,required this.data2, required this.internal_validation, required this.validation, required this.completed});

  Etape.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    comment = json['comment'];
    data = json['data'];
    data2 = json['data2'];
    internal_validation = json['internal_validation'];
    validation = json['validation'];
    completed = json['completed'];
  }


  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id.toString();
    data['comment'] = this.comment.toString();
    data['data'] = this.data.toString();
    data['data2'] = this.data2.toString();
    data['internal_validation'] = this.internal_validation.toString();
    data['validation'] = this.validation.toString();
    data['completed'] = this.completed.toString();
    return data;
  }
}