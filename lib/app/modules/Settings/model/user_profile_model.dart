class UserProfile {
  String? firstName;
  String? lastName;
  String? email;
  String? phone;
  String? message;
  UserProfile({
    this.email,
    this.firstName,
    this.lastName,
    this.phone,
    this.message,
  });
  factory UserProfile.fromJson(Map<String , dynamic> json)=>UserProfile(
    firstName:  json['first_name']??'',
    lastName: json['last_name']??'',
    email: json['email']??'',
    phone: json['phone']??'',
    message: json[ "detail"]??'',
  );
}
