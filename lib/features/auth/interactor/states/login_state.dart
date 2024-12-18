import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

sealed class LoginState extends Equatable {}

final class InitialLoginState extends LoginState {
  @override
  List<Object?> get props => [runtimeType];
}

final class LoadingLoginState extends LoginState {
  @override
  List<Object?> get props => [runtimeType];
}

final class FailureLoginState extends LoginState {
  @override
  List<Object?> get props => [runtimeType];
}

final class NoConnectionLoginState extends LoginState {
  final String title;
  final String description;
  final String buttonText;
  final VoidCallback onTapButton;

  NoConnectionLoginState({
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

final class SuccessLoginState extends LoginState {
  @override
  List<Object?> get props => [runtimeType];
}
