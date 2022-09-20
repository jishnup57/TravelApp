class TokenModel {
  String? token;
  String? refresh;
  String? message;
  String? name;
  TokenModel({ this.token,  this.refresh,this.message,this.name});
  factory TokenModel.fromJson(Map<String, dynamic> json) => TokenModel(
        token: json["token"] ?? '',
        refresh: json["refresh"] ?? '',
        message: json["detail"]?? '',
        name:  json["first_name"]??'',
      );

  Map<String,dynamic> toJson()=>{
      "token" : token,
      "refresh" : refresh,
      "detail" : message,
      "first_name" : name,
  };
}
