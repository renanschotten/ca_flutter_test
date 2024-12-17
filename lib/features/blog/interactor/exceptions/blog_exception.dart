import 'package:equatable/equatable.dart';

class BlogException extends Equatable implements Exception {
  @override
  List<Object?> get props => [runtimeType];
}
