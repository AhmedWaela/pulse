import 'package:flutter/material.dart';

class NewsItem extends StatelessWidget {
  const NewsItem({
    super.key,
    required this.image,
    required this.title,
    required this.description,
  });
  final String image;
  final String title;
  final String description;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(bottom: 20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          width: 1,
          color: Color(0xffC4C7C7).withValues(alpha: 0.5),
        ),
      ),
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image.network(image),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 10, left: 10, top: 20),
            child: Text(
              title,
              style: TextStyle(
                fontFamily: "LiberationSerif",
                fontSize: 22,
                height: 1.27,
                color: Color(0xff191C1E),
              ),
            ),
          ),
          SizedBox(height: 8),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Text(
              description,
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                fontFamily: "Inter",
                fontSize: 16,
                height: 1.5,
                color: Color(0xff444748),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
