import 'package:equatable/equatable.dart';

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

final class SuccessLoginState extends LoginState {
  @override
  List<Object?> get props => [runtimeType];
}
