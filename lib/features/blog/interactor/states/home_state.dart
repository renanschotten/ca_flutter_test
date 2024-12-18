import 'package:ca_flutter_test/features/blog/interactor/entities/post_entity.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

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
  final String title;
  final String description;
  final String buttonText;
  final VoidCallback onTapButton;

  FailureHomeState({
    required this.title,
    required this.description,
    required this.buttonText,
    required this.onTapButton,
  });
  @override
  List<Object?> get props => [
        title,
        description,
        buttonText,
        onTapButton,
        runtimeType,
      ];
}

class SuccessHomeState extends HomeState {
  final List<PostEntity> posts;

  SuccessHomeState({required this.posts});

  @override
  List<Object?> get props => [posts, runtimeType];
}
