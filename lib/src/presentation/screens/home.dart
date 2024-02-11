import 'package:be_my_valentine/src/presentation/bloc/article/remote/remote_article_bloc.dart';
import 'package:be_my_valentine/src/presentation/widgets/article_tile.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DailyNews extends StatelessWidget {
  const DailyNews({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppbar(),
      body: _buildBody(),
    );
  }

  _buildAppbar() {
    return AppBar(
      title: const Text("Daily News",
        style: TextStyle(
          color: Colors.black,
        ),
      ),
    );
  }

  _buildBody() {
    return BlocBuilder<RemoteArticleBloc, RemoteArticleState>(
      builder: (_, state) {
        if (state is RemoteArticlesLoading) {
          return const Center(
            child: CupertinoActivityIndicator(),
          );
        }
        if (state is RemoteArticlesError) {
          return Center(
            child: Text("${state.error}"),
          );
        }
        if (state is RemoteArticlesDone) {
          return ListView.builder(
            itemCount: state.articles.length,
            itemBuilder: (context, index) {
              final article = state.articles[index];

              return ArticleTile(
                image: article.urlToImage,
                title: article.title,
                description: article.description,
              );
            },
          );
        }
        return const SizedBox();
      },
    );
  }
}
