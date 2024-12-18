import 'package:equatable/equatable.dart';

class PostEntity extends Equatable {
  final int userId;
  final int id;
  final String title;
  final String body;
  final bool favorite;

  const PostEntity({
    required this.userId,
    required this.id,
    required this.title,
    required this.body,
    this.favorite = false,
  });

  factory PostEntity.fromMap(Map<String, dynamic> map) {
    return PostEntity(
      userId: map['userId'] as int,
      id: map['id'] as int,
      title: map['title'] as String,
      body: map['body'] as String,
    );
  }

  PostEntity copyWith({
    int? userId,
    int? id,
    String? title,
    String? body,
    bool? favorite,
  }) {
    return PostEntity(
      userId: userId ?? this.userId,
      id: id ?? this.id,
      title: title ?? this.title,
      body: body ?? this.body,
      favorite: favorite ?? this.favorite,
    );
  }

  @override
  List<Object> get props => [userId, id, title, body];
}
