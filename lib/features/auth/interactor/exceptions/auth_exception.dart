import 'package:equatable/equatable.dart';

sealed class AuthException extends Equatable implements Exception {}

final class NetworkRequestFailureException extends AuthException {
  @override
  List<Object?> get props => [runtimeType];
}

final class InvalidCredentialsException extends AuthException {
  @override
  List<Object?> get props => [runtimeType];
}
