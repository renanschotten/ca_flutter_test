import 'package:ca_flutter_test/core/utils/result.dart';
import 'package:ca_flutter_test/features/blog/interactor/controller/home_controller.dart';
import 'package:ca_flutter_test/features/blog/interactor/entities/post_entity.dart';
import 'package:ca_flutter_test/features/blog/interactor/repositories/i_blog_repository.dart';
import 'package:ca_flutter_test/features/blog/interactor/states/home_state.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockBlogRepository extends Mock implements IBlogRepository {}

void main() {
  final repository = MockBlogRepository();
  final controller = HomeController(repository: repository);

  group("getPosts |", () {
    test(
      "should assign SuccesHomeState with the returned value to homeState when the response is Ok()",
      () async {
        // Arrange
        final posts = [
          PostEntity(userId: 1, id: 1, title: "title", body: "body")
        ];
        when(() => repository.getPosts()).thenAnswer(
          (_) => Future.value(Result.ok(posts)),
        );
        // Act
        await controller.getPosts();
        // Assert
        expect(controller.homeState.value, SuccessHomeState(posts: posts));
      },
    );

    test(
      "should assing FailureHomeState to homeState when the response is Error()",
      () async {
        // Arrange
        final e = Exception();
        when(() => repository.getPosts()).thenAnswer(
          (_) => Future.value(Result.error(e)),
        );
        // Act
        await controller.getPosts();
        // Assert
        expect(controller.homeState.value, FailureHomeState());
      },
    );
  });
}
