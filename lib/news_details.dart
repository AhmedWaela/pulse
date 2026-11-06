import 'package:flutter/material.dart';
import 'package:pulse/news_model.dart';

class NewsDetails extends StatelessWidget {
  const NewsDetails({super.key, required this.news});
  final NewsModel news;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            children: <Widget>[
              Text(
                news.title,
                style: TextStyle(fontFamily: "Newsreader", fontSize: 30),
              ),
              ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.network(news.image),
              ),
              Text(
                news.description,
                style: TextStyle(
                  fontSize: 11,
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w500,
                  color: Color(0xff444748),
                ),
              ),
              Spacer(),
              Row(
                children: [
                  TextButton(onPressed: () {}, child: Text('Share')),
                  TextButton(onPressed: () {}, child: Text('Save')),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
