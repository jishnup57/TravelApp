class OtpModel {
  String code;
  String phone;
  OtpModel({
    required this.code,
    required this.phone,
  });

  Map<String,dynamic>toJson()=>{
    "code":code,
    "phone":phone,
  };
}

