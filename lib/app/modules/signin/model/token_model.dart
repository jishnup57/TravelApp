class TokenModel {
  String? token;
  String? refresh;
  String? message;
  TokenModel({ this.token,  this.refresh,this.message});
  factory TokenModel.fromJson(Map<String, dynamic> json) => TokenModel(
        token: json["token"] ?? '',
        refresh: json["refresh"] ?? '',
        message: json["detail"]?? '',
      );
}
