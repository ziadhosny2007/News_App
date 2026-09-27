import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/view_model/news_state.dart';

class BlocNews extends Cubit {
  BlocNews() : super(LoadingNews());
}
