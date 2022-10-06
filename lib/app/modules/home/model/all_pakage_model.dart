class AllPakages {
  AllPakages({
    this.count,
    this.next,
    this.previous,
    this.results,
    this.message,
  });

  int? count;
  String? next;
  String? previous;
  List<Result>? results;
  String? message;

  factory AllPakages.fromJson(Map<String, dynamic> json) => AllPakages(
        count: json["count"] ?? 0,
        next: json["next"] ?? '',
        previous: json["previous"] ?? '',
        results: json["results"] == null
            ? null
            : List<Result>.from(json["results"].map((x) => Result.fromJson(x))),
      );
}

class Result {
  Result({
    required this.packageId,
    required this.packageName,
    required this.slug,
    required this.overview,
    required this.price,
    required this.imagesMain,
    required this.images1,
    required this.images2,
    required this.images3,
    required this.days,
    required this.category,
    required this.noOfPeoples,
    required this.inclusion,
    required this.exclusion,
    required this.thingsToPack,
    required this.location,
    required this.reviews,
  });
  int packageId;
  String packageName;
  String slug;
  String overview;
  int price;
  String imagesMain;
  String images1;
  String images2;
  String images3;
  String days;
  int category;
  String noOfPeoples;
  String inclusion;
  String exclusion;
  String thingsToPack;
  String location;
  List<Review> reviews;

  factory Result.fromJson(Map<String, dynamic> json) => Result(
        packageId: json["id"],
        packageName: json["package_name"],
        slug: json["slug"],
        overview: json["Overview"],
        price: json["price"],
        imagesMain: json["imagesMain"],
        images1: json["images1"],
        images2: json["images2"],
        images3: json["images3"],
        days: json["Days"],
        category: json["category"],
        noOfPeoples: json["No_of_peoples"],
        inclusion: json["inclusion"],
        exclusion: json["exclusion"],
        thingsToPack: json["things_to_pack"],
        location: json["location"],
        reviews: json["reviews"] == null? [] : List<Review>.from(json["reviews"].map((x)=>Review.fromJson(x))),
      );
}

class Review {
  int id;
  int rating;
  String description;
  bool active;
  int package;
  Review({
    required this.id,
    required this.rating,
    required this.description,
    required this.active,
    required this.package,
  });
  factory Review.fromJson(Map<String, dynamic> json) => Review(
        id: json["id"],
        rating: json["rating"],
        description: json['description'],
        active: json["active"],
        package: json["package"],
      );
}
