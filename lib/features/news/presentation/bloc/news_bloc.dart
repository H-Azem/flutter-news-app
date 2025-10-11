import 'package:bloc/bloc.dart';
import 'package:flutter_news_app/core/resources/data_state.dart';
import 'package:flutter_news_app/features/news/domain/use_cases/get_news_use_case.dart';
import 'package:flutter_news_app/features/news/presentation/bloc/news_status.dart';
import 'package:meta/meta.dart';

part 'news_event.dart';
part 'news_state.dart';

class NewsBloc extends Bloc<NewsEvent, NewsState> {
  final GetNewsUseCase _getNewsUseCase;

  NewsBloc(this._getNewsUseCase) : super(NewsState(newsStatus: NewsLoading())) {
    on<LoadNewsEvent>((event, emit) async {
      emit(state.copyWith(newsStatus: NewsLoading()));

      DataState dataState = await _getNewsUseCase(event.category);

      switch (dataState) {
        case DataSuccess():
          emit(state.copyWith(newsStatus: NewsLoaded(dataState.data)));
        case DataFailed():
          emit(state.copyWith(newsStatus: NewsError(dataState.error!)));
        default:
          emit(state.copyWith(newsStatus: NewsError('Unknown state')));
      }
    });
  }
}
