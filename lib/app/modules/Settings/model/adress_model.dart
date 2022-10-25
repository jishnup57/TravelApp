class AddressModel {
  int? id;
  String? address;
  String? city;
  String? pincode;
  String? name;
  String? age;
  String? message;
  int? type;

  AddressModel({
    this.id,
    this.address,
    this.city,
    this.pincode,
    this.name,
    this.age,
    this.message,
    this.type,
  });
  factory AddressModel.fromJson(Map<String, dynamic> json) => AddressModel(
        id: json['id'] ?? 9999,
        address: json["address"],
        city: json["city"],
        pincode: json["pincode"],
        name: json["name"],
        age: json["age"],
        message: json["detail"],
      );
  Map<String, dynamic> toJson() => {
        "address": address,
        "city": city,
        "pincode": pincode,
        "name": name,
        "age": age,
      };

  static AddressModel fromMap(Map<String, Object?> map) {
    final id = map['id'] as int;
    final address = map['address'] as String;
    final city = map['city'] as String;
    final pincode = map['pincode'] as String;
    final name = map['name'] as String;
    final age = map['age'] as String;
    final type = map['type'] as int;
    return AddressModel(
      id: id,
      address: address,
      city: city,
      pincode: pincode,
      name: name,
      age: age,
      type: type,
    );
  }
}
