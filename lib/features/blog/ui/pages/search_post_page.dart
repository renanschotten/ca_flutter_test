import 'package:ca_flutter_test/features/blog/interactor/states/search_post_state.dart';
import 'package:ca_flutter_test/features/blog/ui/widgets/post_widget.dart';
import 'package:ca_flutter_test/features/shared/ui/widgets/failure_widget.dart';
import 'package:flutter/material.dart';
import 'package:ca_flutter_test/features/blog/interactor/controller/search_post_controller.dart';

class SearchPostPage extends StatefulWidget {
  const SearchPostPage({
    super.key,
    required this.controller,
  });
  final SearchPostController controller;

  @override
  State<SearchPostPage> createState() => _SearchPostPageState();
}

class _SearchPostPageState extends State<SearchPostPage> {
  final textController = TextEditingController();
  final focusNode = FocusNode();

  @override
  void dispose() {
    widget.controller.resetState();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Procurar Post"),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 16.0),
        child: Column(
          spacing: 16.0,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SearchBar(
              controller: textController,
              focusNode: focusNode,
              onTapOutside: (_) => focusNode.unfocus(),
              keyboardType: TextInputType.number,
              hintText: "Id do post",
              trailing: [
                IconButton(
                  onPressed: () => widget.controller.getPostById(
                    int.tryParse(textController.text) ?? -1,
                  ),
                  icon: Icon(Icons.search),
                )
              ],
            ),
            ValueListenableBuilder(
              valueListenable: widget.controller.searchPostState,
              builder: (context, state, _) {
                return switch (state) {
                  LoadingSearchPostState() => Center(
                      child: CircularProgressIndicator(),
                    ),
                  FailureSearchPostState() => FailureWidget(
                      title: state.title,
                      description: state.description,
                    ),
                  SuccessSearchPostState() => PostWidget(post: state.post),
                  _ => SizedBox()
                };
              },
            ),
          ],
        ),
      ),
    );
  }
}
