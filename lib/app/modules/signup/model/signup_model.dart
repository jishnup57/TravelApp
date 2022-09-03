class SignUpModel {
  String firstName;
  String lastName;
  String phone;
  String email;
  String password;
  String confirmPassword;
  SignUpModel({
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.phone,
    required this.password,
    required this.confirmPassword,
  });

  Map<String,dynamic>toJson()=>{
    "first_name":firstName,
    "last_name":lastName,
    "email":email,
    "phone":phone,
    "password":password,
    "confirm_password":confirmPassword,
  };
}
