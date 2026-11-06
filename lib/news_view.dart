import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:pulse/news_item.dart';

class NewsView extends StatelessWidget {
  const NewsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
          stream: FirebaseFirestore.instance.collection('news').snapshots(),
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return const Center(child: Text('Something went wrong'));
            }

            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            }

            final docs = snapshot.data?.docs ?? [];

            if (docs.isEmpty) {
              return const Center(child: Text('No news available'));
            }

            return ListView.separated(
              physics: BouncingScrollPhysics(),
              separatorBuilder: (context, index) {
                return SizedBox(height: 24);
              },
              itemCount: docs.length,
              itemBuilder: (context, index) {
                final data = docs[index].data();

                return NewsItem(
                  image: data['image'] ?? '',
                  title: data['title'] ?? '',
                  description: data['description'] ?? '',
                );
              },
            );
          },
        ),
      ),
    );
  }
}
