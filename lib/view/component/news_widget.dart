import 'package:flutter/material.dart';
import 'package:news_app/data/news_model.dart';
import 'package:news_app/view/details.dart';

class NewsHome extends StatelessWidget {
  const NewsHome({super.key, required this.article});
  final Article article;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => Details(
              author: article.author,
              description: article.description,
              title: article.title,
              urlToImage: article.urlToImage,
              content: article.content,
            ),
          ),
        );
      },
      child: Column(
        mainAxisAlignment: .start,
        crossAxisAlignment: .start,
        spacing: 8,
        children: [
          ClipRRect(
            borderRadius: BorderRadiusGeometry.circular(8),
            child: (article.urlToImage != null)
                ? Image.network(
                    article.urlToImage ?? image,
                    width: 370,
                    height: 185,
                    fit: BoxFit.cover,
                  )
                : Image.asset(
                    image,
                    width: 370,
                    height: 185,
                    fit: BoxFit.cover,
                  ),
          ),
          Text(
            article.author ?? "",
            style: Theme.of(context).primaryTextTheme.bodySmall,
          ),

          Text(
            article.title ?? "",
            style: Theme.of(context).primaryTextTheme.bodyMedium,
          ),
        ],
      ),
    );
  }
}

String image = "I/i1.png";
