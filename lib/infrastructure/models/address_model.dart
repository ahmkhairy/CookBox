
import 'dart:convert';

AddAddressModel addAddressFromJson(String str) => AddAddressModel.fromJson(json.decode(str));

String addAddressToJson(AddAddressModel data) => json.encode(data.toJson());

class AddAddressModel {
  AddAddressModel({
    this.address,
    this.area,
    this.buildingName,
    this.floor,
    this.apartment,
    this.additionalInfo,
  });

  String? address;
  String? area;
  String? buildingName;
  String? floor;
  String? apartment;
  String? additionalInfo;

  factory AddAddressModel.fromJson(Map<String, dynamic> json) => AddAddressModel(
    address: json["address"],
    area: json["area"],
    buildingName: json["buildingName"],
    floor: json["floor"],
    apartment: json["apartment"],
    additionalInfo: json["additionalInfo"],
  );

  Map<String, dynamic> toJson() => {
    "address": address,
    "area": area,
    "buildingName": buildingName,
    "floor": floor,
    "apartment": apartment,
    "additionalInfo": additionalInfo,
  };
}
