import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/data/api.dart';
import 'package:news_app/data/news_model.dart';
import 'package:news_app/data/result_api.dart';
import 'package:news_app/view_model/news_state.dart';

class BlocNews extends Cubit<NewsState> {
  BlocNews() : super(LoadingNews());

  Future<void> fetchNews() async {
    emit(LoadingNews());
    final result = await Api.getNews();
    switch (result) {
      case Success<NewsModel>():
        emit(SuccessState(result.data.articles ?? []));
        break;

      case Error<NewsModel>():
        emit(ErrorState(result.error));
      // ignore: unreachable_switch_default
      default:
        emit(LoadingNews());
    }
  }
}
