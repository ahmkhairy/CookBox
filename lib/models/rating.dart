class Rating {
  String? orderId;
  String? rating;

  Rating({this.orderId, this.rating});

  Rating.fromJson(Map<dynamic, dynamic> json) {
    orderId = json['orderId'];
    rating = json['rating'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['orderId'] = orderId;
    data['rating'] = rating;
    return data;
  }
}
