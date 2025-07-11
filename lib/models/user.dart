class SystemUser {
  String? fullName;
  String? email;
  String? phoneNumber;
  String? address;
  String? area;
  String? buildingName;
  String? floor;
  String? apartment;
  String? additionalInfo;
  String? type;
  String? password;
  String? userid;

  SystemUser(
      {this.fullName,
      this.email,
      this.phoneNumber,
      this.address,
      this.area,
      this.buildingName,
      this.floor,
      this.apartment,
      this.additionalInfo,
      this.type,
      this.password,
      this.userid});

  SystemUser.regular(
      this.fullName, this.email, this.password, this.phoneNumber, this.userid)
      : type = 'customer',
        address = "",
        area = "",
        buildingName = "",
        floor = "",
        apartment = "",
        additionalInfo = "";

  SystemUser.owner(
      this.fullName, this.phoneNumber, this.email, this.password, this.userid)
      : type = 'owner',
        address = "";

  factory SystemUser.fromJson(Map<dynamic, dynamic> json) {
    return SystemUser(
        fullName: json['fullname'],
        email: json['email'],
        phoneNumber: json['phoneNo'],
        address: json['address'],
        area: json['area'],
        buildingName: json['buildingName'],
        floor: json['floor'],
        apartment: json['apartment'],
        additionalInfo: json['additionalInfo'],
        type: json['type'],
        password: json['password'],
        userid: '');
  }

  String? get getType => type;

  String getUserType() {
    return type.toString();
  }

  copyWith({fullName, email, password, userid, type, phoneNumber}) =>
      SystemUser(
          fullName: fullName ?? this.fullName,
          password: password ?? this.password,
          userid: userid ?? this.userid,
          type: type ?? this.type,
          phoneNumber: phoneNumber ?? this.phoneNumber,
          email: email ?? this.email);
}
