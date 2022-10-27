class AllFavorate {
  List<FavModel>? favorateList;
  String? message;
  AllFavorate({this.favorateList, this.message});
  factory AllFavorate.fromJson(List<dynamic> parsedJson) => AllFavorate(
        favorateList: parsedJson == []
            ? []
            : parsedJson.map((i) => FavModel.fromJson(i)).toList(),
        message: null,
      );
}

class FavModel {
  int id;
  bool isFav;
  int packageId;
  FavModel({
    required this.id,
    required this.isFav,
    required this.packageId,
  });
  factory FavModel.fromJson(Map<String, dynamic> json) => FavModel(
        id: json['id'],
        isFav: json['isfav'],
        packageId: json['package'],
      );
}
