import 'package:flutter/material.dart';
import 'package:simple_app/domain/entities/entities/articels.dart';
import 'package:simple_app/presentation/pages/webview_page.dart';

class ArticleDetailPage extends StatelessWidget {
  final Article article;

  const ArticleDetailPage({super.key, required this.article});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(article.title),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(article.imageUrl),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(article.title,
                  style: const TextStyle(
                      fontSize: 24.0, fontWeight: FontWeight.bold)),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Text('By ${article.author}',
                  style: const TextStyle(color: Colors.grey)),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(article.description,
                  style: const TextStyle(fontSize: 16.0)),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => WebViewPage(url: article.url),
                    ),
                  );
                },
                child: const Text('See more'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
