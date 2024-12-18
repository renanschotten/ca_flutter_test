import 'package:ca_flutter_test/core/utils/result.dart';
import 'package:ca_flutter_test/features/blog/interactor/entities/post_entity.dart';

abstract interface class IBlogDataSource {
  Future<Result<List<PostEntity>>> getPosts();
  Future<Result<PostEntity>> getPostById(int id);
}
