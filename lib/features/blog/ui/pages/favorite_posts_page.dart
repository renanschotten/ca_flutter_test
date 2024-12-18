import 'package:ca_flutter_test/core/routing/routes.dart';
import 'package:ca_flutter_test/features/blog/interactor/entities/post_entity.dart';
import 'package:ca_flutter_test/features/blog/ui/widgets/post_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class FavoritePostsPage extends StatelessWidget {
  const FavoritePostsPage({super.key, required this.posts});
  final List<PostEntity> posts;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Posts Favoritos"),
      ),
      body: posts.isNotEmpty
          ? ListView.separated(
              padding: EdgeInsets.fromLTRB(8.0, 8.0, 8.0, 24.0),
              itemCount: posts.length,
              itemBuilder: (context, index) => PostWidget(
                post: posts[index],
                onTap: () => Modular.to.pushNamed(
                  Routes.postDetails,
                  arguments: {
                    'post': posts[index],
                  },
                ),
              ),
              separatorBuilder: (context, index) => SizedBox(height: 8.0),
            )
          : Center(
              child: Text(
                "Nenhum post favoritado",
                style: TextTheme.of(context).titleLarge,
              ),
            ),
    );
  }
}
