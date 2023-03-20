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
  int? id;
  bool? isFav;
  int? packageId;
  String? message;
  FavModel({
    this.id,
    this.isFav,
    this.packageId,
    this.message,
  });
  factory FavModel.fromJson(Map<String, dynamic> json) => FavModel(
        id: json['id'],
        isFav: json['isfav'],
        packageId: json['package'],
      );
}
