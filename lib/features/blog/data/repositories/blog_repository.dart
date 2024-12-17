import 'package:ca_flutter_test/core/utils/result.dart';
import 'package:ca_flutter_test/features/blog/interactor/datasources/i_blog_ds.dart';
import 'package:ca_flutter_test/features/blog/interactor/entities/post_entity.dart';
import 'package:ca_flutter_test/features/blog/interactor/repositories/i_blog_repository.dart';

class BlogRepository implements IBlogRepository {
  final IBlogDataSource dataSource;

  BlogRepository({required this.dataSource});
  @override
  Future<Result<List<PostEntity>>> getPosts() async {
    return await dataSource.getPosts();
  }
}
