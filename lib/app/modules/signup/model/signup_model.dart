class SignUpModel {
  String? firstName;
  String? lastName;
  String? phone;
  String? email;
  String? password;
  String? confirmPassword;
  String? message;
  SignUpModel({
     this.firstName,
     this.lastName,
     this.email,
     this.phone,
     this.password,
     this.confirmPassword,
     this.message,
  });

  Map<String,dynamic>toJson()=>{
    "first_name":firstName,
    "last_name":lastName,
    "email":email,
    "phone":phone,
    "password":password,
    "confirm_password":confirmPassword,
  };

  factory SignUpModel.fromJson(Map<String,dynamic> json)=>SignUpModel(
    firstName : json['first_name']??'',
    lastName : json['last_name']??'',
    email : json['email']??'',
    phone : json['phone']??'' ,
    message: json['detail']??''
  );
}
