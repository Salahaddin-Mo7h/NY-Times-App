import 'package:flutter/material.dart';
import 'package:simple_app/domain/entities/entities/articels.dart';
import 'package:simple_app/presentation/pages/article_detail_page.dart';

class ArticleList extends StatelessWidget {
  final List<Article> articles;

  ArticleList({required this.articles});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: articles.length,
      itemBuilder: (context, index) {
        final article = articles[index];
        return ListTile(
          leading: Image.network(article.imageUrl ??
              "https://img.icons8.com/?size=100&id=53386&format=png&color=000000"),
          title: Text(article.title),
          subtitle: Text(article.author),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ArticleDetailPage(article: article),
              ),
            );
          },
        );
      },
    );
  }
}
