import 'package:ca_flutter_test/core/utils/result.dart';
import 'package:ca_flutter_test/features/blog/interactor/exceptions/blog_exception.dart';
import 'package:ca_flutter_test/features/blog/interactor/repositories/i_blog_repository.dart';
import 'package:ca_flutter_test/features/blog/interactor/states/search_post_state.dart';
import 'package:flutter/material.dart';

class SearchPostController {
  final IBlogRepository repository;
  final searchPostState = ValueNotifier<SearchPostState>(
    InitialSearchPostState(),
  );

  SearchPostController({required this.repository});

  Future<void> getPostById(int id) async {
    searchPostState.value = LoadingSearchPostState();
    final response = await repository.getPostById(id);
    switch (response) {
      case Ok():
        searchPostState.value = SuccessSearchPostState(post: response.value);
        break;

      case Error():
        if (response.error == PostNotFoundException()) {
          searchPostState.value = FailureSearchPostState(
            title: "Post não encontrado",
            description: "",
          );
        } else {
          searchPostState.value = FailureSearchPostState(
            title: "Ocorreu um erro ao processar a sua requisição",
            description: "Tente novamente em alguns instantes",
          );
        }
        break;
    }
  }

  void resetState() {
    searchPostState.value = InitialSearchPostState();
  }
}
