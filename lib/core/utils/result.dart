import 'package:equatable/equatable.dart';

sealed class Result<T> extends Equatable {
  const Result();
  const factory Result.ok(T value) = Ok._;

  const factory Result.error(Exception value) = Error._;
}

final class Ok<T> extends Result<T> {
  const Ok._(this.value);

  final T value;

  @override
  List<Object?> get props => [value];
}

final class Error<T> extends Result<T> {
  const Error._(this.error);

  final Exception error;

  @override
  List<Object?> get props => [error];
}
