import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/data/news_model.dart';
import 'package:news_app/view/component/news_widget.dart';
import 'package:news_app/view_model/bloc_news.dart';
import 'package:news_app/view_model/news_state.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<BlocNews>(
      create: (context) => BlocNews()..fetchNews(),

      child: Scaffold(
        appBar: AppBar(title: Text("News App")),
        body: BlocBuilder<BlocNews, NewsState>(
          builder: (context, state) {
            switch (state) {
              case LoadingNews():
                return Center(child: CircularProgressIndicator());
              case SuccessState():
                return _SuccessView(
                  length: state.articles.length,
                  articles: state.articles,
                );
              case ErrorState():
                return Center(
                  child: Text(
                    state.error,
                    style: TextStyle(
                      color: Colors.red,
                      fontWeight: .bold,
                      fontSize: 24,
                    ),
                  ),
                );
              default:
                return Center(child: CircularProgressIndicator());
            }
          },
        ),
      ),
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
