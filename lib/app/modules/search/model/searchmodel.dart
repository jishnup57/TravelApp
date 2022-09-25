



class SearchResult {
  List<AllList>? allSearchResult;
  String? message;
  SearchResult({this.allSearchResult,this.message});
// List<AllList> allListFromJson(String str) => List<AllList>.from(json.decode(str).map((x) => AllList.fromJson(x)));

// String allListToJson(List<AllList> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));
}


class AllList {
    AllList({
        required this.id,
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
    });

    int id;
    String packageName;
    String slug;
    String overview;
    int price;
    String imagesMain;
    String images1;
    String images2;
    String images3;
    String days;
    String createdDate;
    String modifiedDate;
    String noOfPeoples;
    String inclusion;
    String exclusion;
    String thingsToPack;
    bool isApprove;
    bool isAvailable;
    String location;
    DateTime date;
    String availablity;
    int stock;
    int category;

    factory AllList.fromJson(Map<String, dynamic> json) => AllList(
        id: json["id"],
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
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "package_name": packageName,
        "slug": slug,
        "Overview": overview,
        "price": price,
        "imagesMain": imagesMain,
        "images1": images1,
        "images2": images2,
        "images3": images3,
        "Days": days,
        "created_date": createdDate,
        "modified_date": modifiedDate,
        "No_of_peoples": noOfPeoples,
        "inclusion": inclusion,
        "exclusion": exclusion,
        "things_to_pack": thingsToPack,
        "is_approve": isApprove,
        "is_available": isAvailable,
        "location": location,
        "date": "${date.year.toString().padLeft(4, '0')}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}",
        "availablity": availablity,
        "stock": stock,
        "category": category,
    };
}
