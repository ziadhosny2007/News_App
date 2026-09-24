import 'package:flutter/material.dart';
import 'package:news_app/view/component/news_details.dart';

// ignore: must_be_immutable
class Details extends StatefulWidget {
  Details({
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
  State<Details> createState() => _DetailsState();
}

class _DetailsState extends State<Details> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Details News")),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 40),
        child: ListView(
          children: [
            NewsDetails(
              author: widget.author,
              description: widget.description,
              title: widget.title,
              urlToImage: widget.urlToImage,
              content: widget.content,
            ),
          ],
        ),
      ),
    );
  }
}
