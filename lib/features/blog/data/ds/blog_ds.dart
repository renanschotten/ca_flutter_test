import 'dart:convert';

import 'package:ca_flutter_test/core/utils/result.dart';
import 'package:ca_flutter_test/features/blog/interactor/datasources/i_blog_ds.dart';
import 'package:ca_flutter_test/features/blog/interactor/entities/post_entity.dart';
import 'package:ca_flutter_test/features/blog/interactor/exceptions/blog_exception.dart';
import 'package:ca_flutter_test/features/blog/interactor/services/i_api_service.dart';

class BlogDataSource implements IBlogDataSource {
  final IApiService service;
  final _baseUrl = "https://jsonplaceholder.typicode.com";
  BlogDataSource({required this.service});

  @override
  Future<Result<List<PostEntity>>> getPosts() async {
    try {
      final response = await service.get(ApiRequest(
        url: '$_baseUrl/posts',
      ));
      if (response.code != 200) {
        return Result.error(BlogException());
      }
      final list = (jsonDecode(response.body) as List)
          .map((e) => PostEntity.fromMap(e))
          .toList();
      return Result.ok(list);
    } on Exception catch (e) {
      return Result.error(e);
    }
  }
}
