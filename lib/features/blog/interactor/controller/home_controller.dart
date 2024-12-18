import 'package:ca_flutter_test/core/utils/result.dart';
import 'package:ca_flutter_test/features/blog/interactor/repositories/i_blog_repository.dart';
import 'package:ca_flutter_test/features/blog/interactor/states/home_state.dart';
import 'package:flutter/material.dart';

class HomeController {
  final IBlogRepository repository;
  final homeState = ValueNotifier<HomeState>(InitialHomeState());

  HomeController({required this.repository});

  Future<void> getPosts() async {
    homeState.value = LoadingHomeState();
    final result = await repository.getPosts();
    switch (result) {
      case Ok():
        homeState.value = SuccessHomeState(posts: result.value);
        break;
      case Error():
        homeState.value = FailureHomeState();
        break;
    }
  }
}
