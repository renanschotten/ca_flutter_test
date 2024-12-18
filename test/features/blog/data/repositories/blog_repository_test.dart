import 'package:ca_flutter_test/core/utils/result.dart';
import 'package:ca_flutter_test/features/blog/data/repositories/blog_repository.dart';
import 'package:ca_flutter_test/features/blog/interactor/datasources/i_blog_ds.dart';
import 'package:ca_flutter_test/features/blog/interactor/entities/post_entity.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockBlogDataSource extends Mock implements IBlogDataSource {}

void main() {
  final dataSource = MockBlogDataSource();
  final repository = BlogRepository(dataSource: dataSource);

  group(
    "getPosts |",
    () {
      test(
        "should return Result.ok(<PostEntity>[]) when the call to datasource is successful",
        () async {
          final posts = [
            PostEntity(userId: 1, id: 1, title: 'title', body: 'body')
          ];
          // Arrange
          when(() => dataSource.getPosts()).thenAnswer(
            (_) => Future.value(Result.ok(posts)),
          );
          // Act
          final response = await repository.getPosts();
          // Assert
          expect(response, Result<List<PostEntity>>.ok(posts));
        },
      );

      test(
        "should return Result.error(Exception) when the call to datasource is unsuccessful",
        () async {
          final e = Exception();
          // Arrange
          when(() => dataSource.getPosts()).thenAnswer(
            (_) => Future.value(Result.error(e)),
          );
          // Act
          final response = await repository.getPosts();
          // Assert
          expect(response, Result<List<PostEntity>>.error(e));
        },
      );
    },
  );

  group(
    'getPostById |',
    () {
      test(
        "should return Result.ok(PostEntity) when the call to datasource is successful",
        () async {
          final post =
              PostEntity(userId: 1, id: 1, title: 'title', body: 'body');
          // Arrange
          when(() => dataSource.getPostById(1)).thenAnswer(
            (_) => Future.value(Result.ok(post)),
          );
          // Act
          final response = await repository.getPostById(1);
          // Assert
          expect(response, Result<PostEntity>.ok(post));
        },
      );

      test(
        "should return Result.error(Exception) when the call to datasource is unsuccessful",
        () async {
          final e = Exception();
          // Arrange
          when(() => dataSource.getPostById(1)).thenAnswer(
            (_) => Future.value(Result.error(e)),
          );
          // Act
          final response = await repository.getPostById(1);
          // Assert
          expect(response, Result<PostEntity>.error(e));
        },
      );
    },
  );
}
