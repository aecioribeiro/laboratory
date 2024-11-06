import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:laboratory/business/articles/state/articles_state.dart';
import 'package:laboratory/repository/service/apiservice.dart';

import 'event/articles_events.dart';

class ArticlesBloc extends Bloc<ArticlesEvent, ArticlesState> {
  ArticlesBloc() : super(IdleState()) {
    on(fetchArticles);
  }

  ApiService service = ApiService();

  Future<void> fetchArticles(
    ArticlesEvent event,
    Emitter<ArticlesState> state,
  ) async {
    emit(LoadingState());

    try {
      var response = await service.fetchArticles();
      emit(SuccessState(response));
    } catch (e) {
      emit(ErrorState(e));
    }
  }
}
