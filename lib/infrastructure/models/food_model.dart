import 'dart:convert';

FoodModel foodModelFromJson(String str) => FoodModel.fromJson(json.decode(str));

String foodModelToJson(FoodModel data) => json.encode(data.toJson());

class FoodModel {
  FoodModel({this.desc, this.foodName, this.fullName, this.price, this.image});

  String? desc;
  String? foodName;
  String? fullName;
  int? price;
  String? image;

  factory FoodModel.fromJson(Map<String, dynamic> json) => FoodModel(
        desc: json["desc"],
        foodName: json["foodName"],
        fullName: json["fullName"],
        price: json["price"],
        image: json["image"],
      );

  Map<String, dynamic> toJson() => {
        "desc": desc,
        "foodName": foodName,
        "fullName": fullName,
        "price": price,
        "image": image,
      };
}
