import 'package:ca_flutter_test/core/routing/routes.dart';
import 'package:ca_flutter_test/features/blog/interactor/controller/home_controller.dart';

import 'package:ca_flutter_test/features/blog/interactor/states/home_state.dart';
import 'package:ca_flutter_test/features/blog/ui/widgets/favorite_button.dart';
import 'package:ca_flutter_test/features/blog/ui/widgets/post_widget.dart';
import 'package:ca_flutter_test/features/shared/connectivity/ui/widgets/failure_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key, required this.controller});
  final HomeController controller;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    widget.controller.getPosts();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Posts"),
        actions: [
          TextButton(
            onPressed: () => Modular.to.pushNamed(
              Routes.favoritePosts,
              arguments: {
                "favoritesPosts": widget.controller.favoritePosts,
              },
            ),
            child: Text("Favoritos"),
          ),
        ],
      ),
      body: ValueListenableBuilder(
        valueListenable: widget.controller.homeState,
        builder: (context, state, _) {
          return switch (state) {
            LoadingHomeState() => Center(
                child: CircularProgressIndicator(),
              ),
            SuccessHomeState() => ListView.separated(
                padding: EdgeInsets.fromLTRB(8.0, 8.0, 8.0, 24.0),
                itemCount: state.posts.length,
                itemBuilder: (context, index) => PostWidget(
                  post: state.posts[index],
                  onTap: () => Modular.to.pushNamed(
                    Routes.postDetails,
                    arguments: {
                      'post': state.posts[index],
                    },
                  ),
                  trailing: FavoriteButton(
                    initialValue: state.posts[index].favorite,
                    onTap: () => widget.controller.changeFavoriteStatus(index),
                  ),
                ),
                separatorBuilder: (context, index) => SizedBox(height: 8.0),
              ),
            FailureHomeState() => FailureWidget(
                title: "Ocorreu um erro ao processar a sua requisição",
                description: "Tente novamente em alguns instantes",
                buttonText: "Tentar Novamente",
                onTapButton: () => widget.controller.getPosts(),
              ),
            InitialHomeState() => SizedBox(),
          };
        },
      ),
    );
  }
}
