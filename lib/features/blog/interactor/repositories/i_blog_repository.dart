import 'package:ca_flutter_test/core/utils/result.dart';
import 'package:ca_flutter_test/features/blog/interactor/entities/post_entity.dart';

abstract interface class IBlogRepository {
  Future<Result<List<PostEntity>>> getPosts();
}
