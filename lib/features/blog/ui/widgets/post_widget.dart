import 'package:ca_flutter_test/features/blog/interactor/entities/post_entity.dart';
import 'package:flutter/material.dart';

class PostWidget extends StatefulWidget {
  const PostWidget({
    super.key,
    required this.post,
  });
  final PostEntity post;

  @override
  State<PostWidget> createState() => _PostWidgetState();
}

class _PostWidgetState extends State<PostWidget> {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Text(widget.post.id.toString()),
      title: Text(widget.post.title),
      subtitle: Text(
        widget.post.body,
        maxLines: 2,
        overflow: TextOverflow.ellipsis,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
        side: BorderSide(
          color: Colors.grey.shade600,
        ),
      ),
    );
  }
}
