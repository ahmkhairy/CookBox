import 'dart:convert';

DessertModel dessertModelFromJson(String str) =>
    DessertModel.fromJson(json.decode(str));

String dessertModelToJson(DessertModel data) => json.encode(data.toJson());

class DessertModel {
  DessertModel({
    this.desc,
    this.name,
    this.fullName,
    this.image,
    this.price,
  });

  String? desc;
  String? name;
  String? fullName;
  String? image;
  int? price;

  factory DessertModel.fromJson(Map<String, dynamic> json) => DessertModel(
        desc: json["desc"],
        name: json["name"],
        fullName: json["fullName"],
        image: json["image"],
        price: json["price"],
      );

  Map<String, dynamic> toJson() => {
        "desc": desc,
        "name": name,
        "fullName": fullName,
        "image": image,
        "price": price,
      };
}
