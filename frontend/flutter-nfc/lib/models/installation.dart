// ignore_for_file: public_member_api_docs, sort_constructors_first
class Installation {
  int? id;
  dynamic title;
  dynamic adress;
  dynamic description;
  dynamic city;
  dynamic zipcode;
  dynamic image;

  Installation({
    this.id,
    this.title,
    this.adress,
    this.description,
    this.city,
    this.zipcode,
    this.image,
  });

  Installation.fromJson(Map<String, dynamic> json) {
    id = json["id"] ?? '';
    title = json['title'] ?? '';
    adress = json['adress'];
    description = json['description'] ?? '';
    city = json['city'] ?? '';
    zipcode = json['zipcode'] ?? '';
    image = json['image'] ?? '';
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['title'] = title.toString();
    data['adress'] = adress.toString();
    data['description'] = description.toString();
    data['city'] = city.toString();
    data['zipcode'] = zipcode.toString();
    data['image'] = image.toString();

    return data;
  }
}
