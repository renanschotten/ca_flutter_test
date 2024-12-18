import 'package:equatable/equatable.dart';

sealed class BlogException extends Equatable implements Exception {}

class GenericBlogException extends BlogException {
  @override
  List<Object?> get props => [runtimeType];
}

class PostNotFoundException extends BlogException {
  @override
  List<Object?> get props => [runtimeType];
}

class NoConnectionException extends BlogException {
  @override
  List<Object?> get props => [runtimeType];
}
