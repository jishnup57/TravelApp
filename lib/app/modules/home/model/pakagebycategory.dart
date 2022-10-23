import 'dart:convert';

class PakageByCategory{
  String? message;
  List<CatList>? pakageList;
  PakageByCategory({ this.message, this.pakageList});

  factory PakageByCategory.fromJson(List<dynamic> json) => PakageByCategory(
    message: '',
    pakageList: List<CatList>.from((json).map((x) => CatList.fromJson(x))),
  );

}


List<CatList> catListFromJson(String str) => List<CatList>.from(json.decode(str).map((x) => CatList.fromJson(x)));


class CatList {
    CatList({
       required this.id,
       required this.reviews,
       required this.packageName,
       required this.slug,
       required this.overview,
       required this.price,
       required this.imagesMain,
       required this.images1,
       required this.images2,
       required this.images3,
       required this.days,
       required this.createdDate,
       required this.modifiedDate,
       required this.noOfPeoples,
       required this.inclusion,
       required this.exclusion,
       required this.thingsToPack,
       required this.isApprove,
       required this.isAvailable,
       required this.location,
       required this.date,
       required this.availablity,
       required this.stock,
       required this.category,
       required this.vendor,
    });

    final int id;
    final List<Review> reviews;
    final String packageName;
    final String slug;
    final String overview;
    final int price;
    final String imagesMain;
    final String images1;
    final String images2;
    final String images3;
    final String days;
    final String createdDate;
    final String modifiedDate;
    final String noOfPeoples;
    final String inclusion;
    final String exclusion;
    final String thingsToPack;
    final bool isApprove;
    final bool isAvailable;
    final String location;
    final DateTime date;
    final String availablity;
    final int stock;
    final int category;
    final int vendor;

    factory CatList.fromJson(Map<String, dynamic> json) => CatList(
        id: json["id"],
        reviews: List<Review>.from(json["reviews"].map((x) => Review.fromJson(x))),
        packageName: json["package_name"],
        slug: json["slug"],
        overview: json["Overview"],
        price: json["price"],
        imagesMain: json["imagesMain"],
        images1: json["images1"],
        images2: json["images2"],
        images3: json["images3"],
        days: json["Days"],
        createdDate: json["created_date"],
        modifiedDate: json["modified_date"],
        noOfPeoples: json["No_of_peoples"],
        inclusion: json["inclusion"],
        exclusion: json["exclusion"],
        thingsToPack: json["things_to_pack"],
        isApprove: json["is_approve"],
        isAvailable: json["is_available"],
        location: json["location"],
        date: DateTime.parse(json["date"]),
        availablity: json["availablity"],
        stock: json["stock"],
        category: json["category"],
        vendor: json["vendor"],
    );

}

class Review {
    Review({
       required this.id,
       required this.rating,
       required this.description,
       required this.created,
       required this.update,
       required this.active,
       required this.package,
    });

    final int id;
    final int rating;
    final String description;
    final String created;
    final String update;
    final bool active;
    final int package;

    factory Review.fromJson(Map<String, dynamic> json) => Review(
        id: json["id"],
        rating: json["rating"],
        description: json["description"],
        created: json["created"],
        update: json["update"],
        active: json["active"],
        package: json["package"],
    );

}
