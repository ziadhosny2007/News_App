import 'package:flutter/material.dart';

// ignore: must_be_immutable
class NewsDetails extends StatelessWidget {
  NewsDetails({
    super.key,
    this.author,
    this.description,
    this.title,
    this.urlToImage,
    this.content,
  });
  String? author;
  String? title;
  String? description;
  String? urlToImage;
  String? content;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: .start,
      mainAxisAlignment: .center,
      spacing: 10,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: (urlToImage != null)
              ? Image.network(
                  urlToImage ?? image,
                  width: 370,
                  height: 185,
                  fit: BoxFit.cover,
                )
              : Image.asset(image, width: 370, height: 185, fit: BoxFit.cover),
        ),
        Text(title ?? "", style: Theme.of(context).primaryTextTheme.bodyLarge),

        Text(author ?? "", style: Theme.of(context).primaryTextTheme.bodySmall),
        Text(
          description ?? "",
          style: Theme.of(context).primaryTextTheme.displayMedium,
        ),
        Text(
          content ?? "",
          style: Theme.of(context).primaryTextTheme.bodyMedium,
        ),
      ],
    );
  }
}

String image = "I/i1.png";
