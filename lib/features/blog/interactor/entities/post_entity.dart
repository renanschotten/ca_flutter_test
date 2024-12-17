import 'package:equatable/equatable.dart';

class PostEntity extends Equatable {
  final int userId;
  final int id;
  final String title;
  final String body;

  const PostEntity({
    required this.userId,
    required this.id,
    required this.title,
    required this.body,
  });

  factory PostEntity.fromMap(Map<String, dynamic> map) {
    return PostEntity(
      userId: map['userId'] as int,
      id: map['id'] as int,
      title: map['title'] as String,
      body: map['body'] as String,
    );
  }

  @override
  List<Object> get props => [userId, id, title, body];
}
