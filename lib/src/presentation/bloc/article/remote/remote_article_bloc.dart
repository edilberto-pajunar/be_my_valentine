import 'package:be_my_valentine/core/resources/data_state.dart';
import 'package:be_my_valentine/src/domain/entities/article.dart';
import 'package:be_my_valentine/src/domain/usecases/get_article.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'remote_article_event.dart';
part 'remote_article_state.dart';

class RemoteArticleBloc extends Bloc<RemoteArticleEvent, RemoteArticleState> {
  final GetArticleUseCase _getArticleUseCase;

  RemoteArticleBloc(this._getArticleUseCase) : super(RemoteArticlesLoading()) {
    on<GetArticles>(onGetArticles);
  }

  void onGetArticles(GetArticles event, Emitter<RemoteArticleState> emit) async {
    final dataState = await _getArticleUseCase();

    if (dataState is DataSuccess && dataState.data!.isNotEmpty) {
      emit(RemoteArticlesDone(articles: dataState.data!));
    }
    
    if (dataState is DataFailed) {
      emit(RemoteArticlesError(error: dataState.error!));
    }

  }

}
