import 'package:news_app/data/news_model.dart';

abstract class NewsState {
  
}

class LoadingNews extends NewsState {

}

class SuccessState extends NewsState {
  List<Article> articles;
  SuccessState(this.articles);
}

class ErrorState extends NewsState {
  String error;
  ErrorState(this.error);
}
