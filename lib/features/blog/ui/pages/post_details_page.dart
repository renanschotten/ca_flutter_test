import 'package:ca_flutter_test/features/blog/interactor/entities/post_entity.dart';
import 'package:flutter/material.dart';

class PostDetailsPage extends StatelessWidget {
  const PostDetailsPage({super.key, required this.post});
  final PostEntity post;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Post ${post.id}"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            spacing: 16,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Autor: ${post.userId}",
                style: TextTheme.of(context).bodyLarge,
              ),
              Text(post.title, style: TextTheme.of(context).headlineLarge),
              Text(post.body, style: TextTheme.of(context).bodyLarge)
            ],
          ),
        ),
      ),
    );
  }
}
