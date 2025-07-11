import 'dart:convert';

// enum Category { food, drink, dessert, other }

CartItem addToCartModelFromJson(String str) =>
    CartItem.fromJson(json.decode(str));

class CartItem {
  String productName = "";
  String? docId;
  double totalPrice = 0.0;
  String specialRequest = "";
  int totalCount = 0;
  String url = "";
  String productDescription = "";

  set setName(name) => productName = name;
  set setTotalPrice(price) => totalPrice = price;
  set setUrl(theurl) => url = theurl;
  set setSpecialRequest(request) => specialRequest = request;
  set setCategory(category) => category = category;

  CartItem(
      {this.docId,
      required this.productName,
      required this.totalPrice,
      required this.specialRequest,
      required this.productDescription,
      required this.totalCount,
      required this.url});

  CartItem.fromJson(Map<dynamic, dynamic> json) {
    productName = json['productName'];
    docId = json['docId'];
    productDescription = json['productDescription'];
    specialRequest = json['specialRequest'];
    totalCount = json['totalCount'];
    totalPrice = json['totalPrice'];
    url = json['url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['productName'] = productName;
    data['totalPrice'] = totalPrice;
    data['productDescription'] = productDescription;
    data['specialRequest'] = specialRequest;
    data['totalCount'] = totalCount;
    data['url'] = url;
    return data;
  }

  List<Map> convertItemListToMap({required List<CartItem> itemList}) {
    List<Map> steps = [];
    for (var item in itemList) {
      Map step = item.toJson();
      steps.add(step);
    }
    return steps;
  }

  @override
  String toString() {
    return 'name: $productName special request: $specialRequest quantity: $totalCount';
  }
}
