class LoginModel {
  LoginModel(
      {required this.id,
      required this.name,
      required this.email,
      required this.phone,
      this.emailVerifiedAt,
      this.image = "",
      required this.token,
      required this.city,
      required this.street,
      required this.country,
      required this.AlternatePhoneNumber,
      required this.streetNumber});
  late final String id;
  late final String name;
  late final String email;
  late final String phone;
  final String image;
  String? emailVerifiedAt;
  late final String token;
  late final String city;
  late final String street;
  late final String streetNumber;
  late final String AlternatePhoneNumber;
  late final String country;

  factory LoginModel.fromJson(Map<String, dynamic> json) {
    return LoginModel(
      id: json["id"].toString(),
      name: json["name"],
      email: json["email"],
      phone: json["phone"],
      image: json["image"],
      emailVerifiedAt: json["emailVerifiedAt"],
      token: json["token"],
      city: json["city"],
      street: json['street'],
      streetNumber: json['street_number'],
      country: json['country'],
      AlternatePhoneNumber: json['alter_phone'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "name": name,
      "email": email,
      "phone": phone,
      "image": image,
      "emailVerifiedAt": emailVerifiedAt,
      "token": token,
      "city": city,
      "street": street,
      "street_number": streetNumber,
      "alter_phone": AlternatePhoneNumber,
      "country": country
    };
  }

//

}
