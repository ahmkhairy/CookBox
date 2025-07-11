enum Category { food, drink, dessert, other }

class Product {
  String productName = "";
  double productPrice = 0.0;
  String productDescription = "";
  String category = "Other";
  String url = "";

  String get getName => productName;
  double get getPrice => productPrice;
  String get getDescription => productDescription;
  String get getCategory => category;
  String get getUrl => url;

  set setName(name) => productName = name;
  set setPrice(price) => productPrice = price;
  set setUrl(theurl) => url = theurl;
  set setDescription(description) => productDescription = description;
  set setCategory(category) => category = category;

  Product({
    this.productName = "",
    this.productPrice = 0.0,
    this.productDescription = "",
    this.category = "Other",
    this.url = "",
  });

  // ✅ FIXED: proper casting for productPrice
  Product.fromJson(Map<dynamic, dynamic> json) {
    productName = json['productName'] ?? "";
    productPrice = (json['productPrice'] as num).toDouble(); // ✅ Safely handle int/double
    productDescription = json['productDescription'] ?? "";
    category = json['category'] ?? "Other";
    url = json['url'] ?? "";
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['productName'] = productName;
    data['productPrice'] = productPrice;
    data['productDescription'] = productDescription;
    data['category'] = category;
    data['url'] = url;
    return data;
  }
}
