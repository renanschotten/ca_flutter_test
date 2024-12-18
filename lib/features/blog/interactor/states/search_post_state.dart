import 'package:ca_flutter_test/features/blog/interactor/entities/post_entity.dart';
import 'package:equatable/equatable.dart';

sealed class SearchPostState extends Equatable {}

class InitialSearchPostState extends SearchPostState {
  @override
  List<Object?> get props => [runtimeType];
}

class LoadingSearchPostState extends SearchPostState {
  @override
  List<Object?> get props => [runtimeType];
}

class FailureSearchPostState extends SearchPostState {
  final String title;
  final String description;

  FailureSearchPostState({
    required this.title,
    required this.description,
  });
  @override
  List<Object?> get props => [
        title,
        description,
        runtimeType,
      ];
}

class SuccessSearchPostState extends SearchPostState {
  final PostEntity post;

  SuccessSearchPostState({required this.post});

  @override
  List<Object?> get props => [post, runtimeType];
}
