import 'package:flutter/material.dart';
import 'package:news_app/data/api.dart';
import 'package:news_app/data/news_model.dart';
import 'package:news_app/data/result_api.dart';
import 'package:news_app/view/component/news_widget.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String? error;
  bool isLoading = true;
  Future<void> getNews() async {
    final result = await Api.getNews();
    switch (result) {
      case Success<NewsModel>():
        articles = result.data.articles ?? [];

        break;

      case Error<NewsModel>():
        error = result.error;
    }

    setState(() {
      isLoading = false;
    });
  }

  List<Article> articles = [];

  @override
  void initState() {
    super.initState();
    getNews();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("News App")),
      body: (isLoading)
          ? Center(child: CircularProgressIndicator())
          : (error != null)
          ? Center(
              child: Text(error ?? "", style: TextStyle(color: Colors.red)),
            )
          : _SuccessView(length: articles.length, articles: articles),
    );
  }
}

// ignore: non_constant_identifier_names
Widget _SuccessView({required int length, required List<Article> articles}) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 16),
    child: ListView.builder(
      itemCount: length,
      itemBuilder: (context, i) => Expanded(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 32),
          child: NewsHome(article: articles[i]),
        ),
      ),
    ),
  );
}
