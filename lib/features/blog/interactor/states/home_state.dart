import 'package:ca_flutter_test/features/blog/interactor/entities/post_entity.dart';
import 'package:equatable/equatable.dart';

sealed class HomeState extends Equatable {}

class InitialHomeState extends HomeState {
  @override
  List<Object?> get props => [runtimeType];
}

class LoadingHomeState extends HomeState {
  @override
  List<Object?> get props => [runtimeType];
}

class FailureHomeState extends HomeState {
  @override
  List<Object?> get props => [runtimeType];
}

class SuccessHomeState extends HomeState {
  final List<PostEntity> posts;

  SuccessHomeState({required this.posts});

  @override
  List<Object?> get props => [posts, runtimeType];
}
