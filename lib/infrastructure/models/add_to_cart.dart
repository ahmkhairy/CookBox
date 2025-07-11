// To parse this JSON data, do
//
//     final addToCartModel = addToCartModelFromJson(jsonString);

import 'dart:convert';

AddToCartModel addToCartModelFromJson(String str) =>
    AddToCartModel.fromJson(json.decode(str));

String addToCartModelToJson(AddToCartModel data) =>
    json.encode(data.toJson(data.docId!));

class AddToCartModel {
  AddToCartModel(
      {this.productDescription,
      this.productName,
      this.specialRequest,
      this.totalPrice,
      this.url,
      this.docId,
      this.totalCount});

  String? productDescription;
  String? productName;
  String? specialRequest;
  double? totalPrice;
  String? url;
  String? docId;
  int? totalCount;

  factory AddToCartModel.fromJson(Map<String, dynamic> json) => AddToCartModel(
        productDescription: json["productDescription"],
        productName: json[" productName"],
        specialRequest: json["specialRequest"],
        totalPrice: json["totalPrice"],
        url: json["url"],
        docId: json["docId"],
        totalCount: json["totalCount"],
      );

  Map<String, dynamic> toJson(String docID) => {
        "productDescription": productDescription,
        "productName": productName,
        "specialRequest": specialRequest,
        "totalPrice": totalPrice,
        "url": url,
        "docId": docID,
        "totalCount": totalCount,
      };
}
