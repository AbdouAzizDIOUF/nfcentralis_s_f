class Etape {
  late final int? id;
  late final String? comment;
  late final List<String>? data;
  late final String? internal_validation;
  late final String? validation;
  late final bool? completed;

  Etape(
      {this.id,
      this.comment,
      this.data,
      this.internal_validation,
      this.validation,
      this.completed});

  Etape.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    comment = json['comment'];
    data = json['data'];
    internal_validation = json['internal_validation'];
    validation = json['validation'];
    completed = json['completed'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id.toString();
    data['comment'] = comment.toString();
    data['data'] = this.data.toString();
    data['internal_validation'] = internal_validation.toString();
    data['validation'] = validation.toString();
    data['completed'] = completed.toString();
    return data;
  }
}
