class NewToken {
  String token;
  NewToken({required this.token});

  factory NewToken.fromJSON(Map<String, dynamic> json) => NewToken(
        token: json['token'],
      );
}
