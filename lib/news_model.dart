class NewsModel {
  const NewsModel({
    required this.image,
    required this.title,
    required this.description,
  });

  final String image;
  final String title;
  final String description;

  factory NewsModel.fromJson(Map<String, dynamic> json) {
    return NewsModel(
      image: json['image'],
      title: json["title"],
      description: json['description'],
    );
  }
}
