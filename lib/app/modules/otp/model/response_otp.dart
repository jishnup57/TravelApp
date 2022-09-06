class OtpResponse {
  String firstname;
  String lastname;
  String email;
  String phone;
  OtpResponse({
    required this.firstname,
    required this.lastname,
    required this.email,
    required this.phone,
  });

  factory OtpResponse.fromJson(Map<String, dynamic> json) => OtpResponse(
        firstname: json["first_name"],
        lastname: json["last_name"],
        email: json["email"],
        phone: json["phone"],
      );
}
