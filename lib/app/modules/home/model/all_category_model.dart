

class Categories {
  List<AllCategory>? listAllcategories;
  String? message;
  Categories({
    this.listAllcategories,
    this.message,
  });
  
}

class AllCategory {
  AllCategory(
      {required this.id,
      required this.categoryName,
      required this.slug,
      this.description,
      required this.image});
  int id;
  String categoryName;
  String slug;
  String? description;
  String image;

  factory AllCategory.fromJson(Map<String, dynamic> json) => AllCategory(
        id: json['id'],
        categoryName: json['category_name'],
        slug: json['slug'],
        image: json['images'],
        description: json['description'] ?? '',
      );
}


  
