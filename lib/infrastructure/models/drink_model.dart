
import 'dart:convert';

DrinkModel drinkModelFromJson(String str) => DrinkModel.fromJson(json.decode(str));

String drinkModelToJson(DrinkModel data) => json.encode(data.toJson());

class DrinkModel {
  DrinkModel({
    this.desc,
    this.drinkName,
    this.fullName,
    this.price,
    this.image,
  });

  String? desc;
  String? drinkName;
  String? fullName;
  int? price;
  String? image;

  factory DrinkModel.fromJson(Map<String, dynamic> json) => DrinkModel(
    desc: json["desc"],
    drinkName: json["drinkName"],
    fullName: json["fullName"],
    price: json["price"],
    image: json["image"],
  );

  Map<String, dynamic> toJson() => {
    "desc": desc,
    "drinkName": drinkName,
    "fullName": fullName,
    "price": price,
    "image": image,
  };
}
