import "dart:convert";

import "package:ca_flutter_test/core/utils/result.dart";
import "package:ca_flutter_test/features/blog/data/ds/blog_ds.dart";
import "package:ca_flutter_test/features/blog/interactor/entities/post_entity.dart";
import "package:ca_flutter_test/features/blog/interactor/exceptions/blog_exception.dart";
import "package:ca_flutter_test/features/blog/interactor/services/i_api_service.dart";
import "package:ca_flutter_test/features/shared/data/service/internet_connection_service.dart";
import "package:flutter_test/flutter_test.dart";
import "package:mocktail/mocktail.dart";

class MockApiService extends Mock implements IApiService {}

class MockInternetConnectionService extends Mock
    implements InternetConnectionService {}

void main() {
  final service = MockApiService();
  final internetConnectionService = MockInternetConnectionService();
  final ds = BlogDataSource(
    service: service,
    internetConnectionService: internetConnectionService,
  );

  group(
    "getPosts |",
    () {
      final request = ApiRequest(
        url: "https://jsonplaceholder.typicode.com/posts",
      );
      final body = jsonEncode([
        {
          "userId": 1,
          "id": 1,
          "title":
              "sunt aut facere repellat provident occaecati excepturi optio reprehenderit",
          "body":
              "quia et suscipit\nsuscipit recusandae consequuntur expedita et cum\nreprehenderit molestiae ut ut quas totam\nnostrum rerum est autem sunt rem eveniet architecto"
        },
        {
          "userId": 1,
          "id": 2,
          "title": "qui est esse",
          "body":
              "est rerum tempore vitae\nsequi sint nihil reprehenderit dolor beatae ea dolores neque\nfugiat blanditiis voluptate porro vel nihil molestiae ut reiciendis\nqui aperiam non debitis possimus qui neque nisi nulla"
        },
      ]);
      final entityList = [
        PostEntity(
          userId: 1,
          id: 1,
          title:
              "sunt aut facere repellat provident occaecati excepturi optio reprehenderit",
          body:
              "quia et suscipit\nsuscipit recusandae consequuntur expedita et cum\nreprehenderit molestiae ut ut quas totam\nnostrum rerum est autem sunt rem eveniet architecto",
        ),
        PostEntity(
          userId: 1,
          id: 2,
          title: "qui est esse",
          body:
              "est rerum tempore vitae\nsequi sint nihil reprehenderit dolor beatae ea dolores neque\nfugiat blanditiis voluptate porro vel nihil molestiae ut reiciendis\nqui aperiam non debitis possimus qui neque nisi nulla",
        ),
      ];

      test(
        "should return Result.error(NoConnectionException) when checkInternetConnection return false",
        () async {
          // Arrange
          when(() => internetConnectionService.checkInternetConnection())
              .thenAnswer((_) => Future.value(false));
          when(() => service.get(request)).thenAnswer(
            (_) => Future.value(ApiResponse(code: 200, body: body)),
          );

          // Act
          final result = await ds.getPosts();
          // Assert
          expect(
            result,
            Result<List<PostEntity>>.error(NoConnectionException()),
          );
        },
      );
      test(
        "should return Result.ok(<PostEntity>[]) when status code is 200",
        () async {
          // Arrange
          when(() => internetConnectionService.checkInternetConnection())
              .thenAnswer((_) => Future.value(true));
          when(() => service.get(request)).thenAnswer(
            (_) => Future.value(ApiResponse(code: 200, body: body)),
          );

          // Act
          final result = await ds.getPosts();
          // Assert
          expect(result, Result.ok(entityList));
        },
      );

      test(
        "should return Result.error(BlogException()) when status code is different than 200",
        () async {
          // Arrange
          when(() => internetConnectionService.checkInternetConnection())
              .thenAnswer((_) => Future.value(true));
          when(() => service.get(request)).thenAnswer(
            (_) => Future.value(ApiResponse(code: 400, body: "")),
          );

          // Act
          final result = await ds.getPosts();

          // Assert
          expect(
            result,
            Result<List<PostEntity>>.error(GenericBlogException()),
          );
        },
      );

      test(
        "should return Result.error(Exception()) when a Exception is thrown",
        () async {
          // Arrange
          final e = Exception();
          when(() => service.get(request)).thenThrow(e);

          // Act
          final result = await ds.getPosts();

          // Assert
          expect(
            result,
            Result<List<PostEntity>>.error(e),
          );
        },
      );
    },
  );
}
