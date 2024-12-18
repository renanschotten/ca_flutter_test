import 'package:ca_flutter_test/core/utils/result.dart';
import 'package:ca_flutter_test/features/blog/interactor/entities/post_entity.dart';
import 'package:ca_flutter_test/features/blog/interactor/exceptions/blog_exception.dart';
import 'package:ca_flutter_test/features/blog/interactor/repositories/i_blog_repository.dart';
import 'package:ca_flutter_test/features/blog/interactor/states/home_state.dart';
import 'package:flutter/material.dart';

class HomeController {
  final IBlogRepository repository;
  final homeState = ValueNotifier<HomeState>(InitialHomeState());
  var posts = <PostEntity>[];
  HomeController({required this.repository});

  Future<void> getPosts() async {
    homeState.value = LoadingHomeState();
    final result = await repository.getPosts();
    switch (result) {
      case Ok():
        posts = result.value;
        homeState.value = SuccessHomeState(posts: result.value);
        break;
      case Error():
        if (result.error == NoConnectionException()) {
          homeState.value = FailureHomeState(
            title: "Sem internet",
            description:
                "Verifique a sua conexão e tente novamente em alguns instantes",
            buttonText: "Tentar Novamente",
            onTapButton: () => getPosts(),
          );
        } else {
          homeState.value = FailureHomeState(
            title: "Ocorreu um erro ao processar a sua requisição",
            description: "Tente novamente em alguns instantes",
            buttonText: "Tentar Novamente",
            onTapButton: () => getPosts(),
          );
        }
        break;
    }
  }

  void changeFavoriteStatus(int index) {
    homeState.value = LoadingHomeState();
    final currentStatus = posts[index].favorite;
    posts[index] = posts[index].copyWith(favorite: !currentStatus);
    homeState.value = SuccessHomeState(posts: posts);
  }

  List<PostEntity> get favoritePosts => posts.where((e) => e.favorite).toList();
}
