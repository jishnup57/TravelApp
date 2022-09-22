class OtpResponse {
  String? firstname;
  String? lastname;
  String? email;
  String? phone;
  String? message;
  OtpResponse({
     this.firstname,
     this.lastname,
     this.email,
     this.phone,
     this.message,
  });

  factory OtpResponse.fromJson(Map<String, dynamic> json) => OtpResponse(
        firstname: json["first_name"]??'',
        lastname: json["last_name"]??'',
        email: json["email"]??'',
        phone: json["phone"]??'',
        message: json["detail"]??'',
      );
}
