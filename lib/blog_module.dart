import 'package:ca_flutter_test/core/routing/routes.dart';
import 'package:ca_flutter_test/features/auth/data/services/firebase_auth_service.dart';
import 'package:ca_flutter_test/features/auth/interactor/controller/login_controller.dart';
import 'package:ca_flutter_test/features/auth/interactor/services/i_auth_service.dart';
import 'package:ca_flutter_test/features/auth/ui/pages/login_page.dart';
import 'package:ca_flutter_test/features/blog/data/ds/blog_ds.dart';
import 'package:ca_flutter_test/features/blog/data/repositories/blog_repository.dart';
import 'package:ca_flutter_test/features/blog/data/services/http_api_service.dart';
import 'package:ca_flutter_test/features/blog/interactor/controller/home_controller.dart';
import 'package:ca_flutter_test/features/blog/interactor/controller/search_post_controller.dart';
import 'package:ca_flutter_test/features/blog/interactor/datasources/i_blog_ds.dart';
import 'package:ca_flutter_test/features/blog/interactor/repositories/i_blog_repository.dart';
import 'package:ca_flutter_test/features/blog/interactor/services/i_api_service.dart';
import 'package:ca_flutter_test/features/blog/ui/pages/favorite_posts_page.dart';
import 'package:ca_flutter_test/features/blog/ui/pages/home_page.dart';
import 'package:ca_flutter_test/features/blog/ui/pages/post_details_page.dart';
import 'package:ca_flutter_test/features/blog/ui/pages/search_post_page.dart';
import 'package:ca_flutter_test/features/shared/data/service/internet_connection_service.dart';
import 'package:ca_flutter_test/features/splash/ui/pages/splash_page.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter_modular/flutter_modular.dart';

class BlogModule extends Module {
  @override
  void binds(Injector i) {
    i.addSingleton<FirebaseAuth>(() => FirebaseAuth.instance);

    // Services
    i.addSingleton<IAuthService>(
      () => FirebaseAuthService(firebaseAuth: i<FirebaseAuth>()),
    );
    i.addSingleton<IApiService>(() => HttpApiService());
    i.addSingleton<InternetConnectionService>(
      () => InternetConnectionService(),
    );

    // DataSources
    i.addSingleton<IBlogDataSource>(
      () => BlogDataSource(
        service: i<IApiService>(),
        internetConnectionService: i<InternetConnectionService>(),
      ),
    );

    // Repositories
    i.addSingleton<IBlogRepository>(
      () => BlogRepository(dataSource: i<IBlogDataSource>()),
    );

    // Controllers
    i.addSingleton<LoginController>(
      () => LoginController(authService: i<IAuthService>()),
    );
    i.addSingleton<HomeController>(
      () => HomeController(repository: i<IBlogRepository>()),
    );
    i.addSingleton<SearchPostController>(
      () => SearchPostController(repository: i<IBlogRepository>()),
    );
  }

  @override
  void routes(RouteManager r) {
    r.child(
      Routes.splash,
      child: (context) => SplashPage(),
    );
    r.child(
      Routes.login,
      child: (context) => LoginPage(
        loginController: Modular.get<LoginController>(),
      ),
    );
    r.child(
      Routes.home,
      child: (context) => HomePage(
        controller: Modular.get<HomeController>(),
      ),
    );
    r.child(
      Routes.postDetails,
      child: (context) => PostDetailsPage(
        post: r.args.data['post'],
      ),
    );
    r.child(
      Routes.favoritePosts,
      child: (context) => FavoritePostsPage(
        posts: r.args.data['favoritesPosts'],
      ),
    );
    r.child(
      Routes.searchPost,
      child: (context) => SearchPostPage(
        controller: Modular.get<SearchPostController>(),
      ),
    );
  }
}
