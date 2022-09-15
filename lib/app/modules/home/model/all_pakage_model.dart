
class AllPakages {
    AllPakages({
        required this.count,
         this.next,
         this.previous,
        required this.results,
    });

    int count;
    String? next;
    String? previous;
    List<Result> results;

    factory AllPakages.fromJson(Map<String, dynamic> json) => AllPakages(
        count: json["count"],
        next: json["next"]??'',
        previous: json["previous"]??'',
        results: List<Result>.from(json["results"].map((x) => Result.fromJson(x))),
    );


}

class Result {
    Result({
        required this.packageName,
        required this.slug,
        required this.overview,
        required this.price,
        required this.imagesMain,
        required this.days,
        required this.category,
        required this.noOfPeoples,
        required this.inclusion,
        required this.exclusion,
        required this.thingsToPack,
    });

    String packageName;
    String slug;
    String overview;
    int price;
    String imagesMain;
    String days;
    int category;
    String noOfPeoples;
    String inclusion;
    String exclusion;
    String thingsToPack;

    factory Result.fromJson(Map<String, dynamic> json) => Result(
        packageName: json["package_name"],
        slug: json["slug"],
        overview: json["Overview"],
        price: json["price"],
        imagesMain: json["imagesMain"],
        days: json["Days"],
        category: json["category"],
        noOfPeoples: json["No_of_peoples"],
        inclusion: json["inclusion"],
        exclusion: json["exclusion"],
        thingsToPack: json["things_to_pack"],
    );


}
