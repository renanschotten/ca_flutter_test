import 'package:ca_flutter_test/core/utils/result.dart';
import 'package:ca_flutter_test/features/blog/interactor/controller/search_post_controller.dart';
import 'package:ca_flutter_test/features/blog/interactor/entities/post_entity.dart';
import 'package:ca_flutter_test/features/blog/interactor/repositories/i_blog_repository.dart';
import 'package:ca_flutter_test/features/blog/interactor/states/search_post_state.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockBlogRepository extends Mock implements IBlogRepository {}

void main() {
  final repository = MockBlogRepository();
  final controller = SearchPostController(repository: repository);
  const id = 1;
  group(
    "getPostById |",
    () {
      test(
        "should assign SuccessSearchPostState to searchPostState when the response is Ok()",
        () async {
          // Arrange
          final post = PostEntity(
            userId: 1,
            id: 1,
            title: 'title',
            body: 'body',
          );
          when(() => repository.getPostById(id)).thenAnswer(
            (_) => Future.value(Result.ok(post)),
          );

          // Act
          await controller.getPostById(id);

          // Assert
          expect(
            controller.searchPostState.value,
            SuccessSearchPostState(post: post),
          );
        },
      );

      test(
        "should assign FailureSearchPostState to searchPostState when the response is Error()",
        () async {
          // Arrange
          when(() => repository.getPostById(id)).thenAnswer(
            (_) => Future.value(Result.error(Exception())),
          );

          // Act
          await controller.getPostById(id);

          // Assert
          expect(
            controller.searchPostState.value,
            isInstanceOf<FailureSearchPostState>(),
          );
        },
      );
    },
  );

  group(
    "resetState |",
    () {
      test(
        "should assign InitialSearchPostState to searchPostState",
        () {
          // Arrange
          controller.searchPostState.value = LoadingSearchPostState();
          // Act
          controller.resetState();
          // Assert
          expect(controller.searchPostState.value, InitialSearchPostState());
        },
      );
    },
  );
}
