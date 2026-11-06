class NewsModel {
  const NewsModel({
    required this.image,
    required this.title,
    required this.description,
    required this.id,
  });

  final String image;
  final String title;
  final String description;
  final String id;

  factory NewsModel.fromJson(Map<String, dynamic> json, String id) {
    return NewsModel(
      id: id,
      image: json['image'],
      title: json["title"],
      description: json['description'],
    );
  }
}
