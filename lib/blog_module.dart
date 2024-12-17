import 'package:ca_flutter_test/core/routing/routes.dart';
import 'package:ca_flutter_test/features/auth/data/services/firebase_auth_service.dart';
import 'package:ca_flutter_test/features/auth/interactor/controller/login_controller.dart';
import 'package:ca_flutter_test/features/auth/interactor/services/i_auth_service.dart';
import 'package:ca_flutter_test/features/auth/ui/pages/login_page.dart';
import 'package:ca_flutter_test/features/splash/ui/pages/splash_page.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter_modular/flutter_modular.dart';

class BlogModule extends Module {
  @override
  void binds(Injector i) {
    i.addSingleton<FirebaseAuth>(() => FirebaseAuth.instance);
    i.addSingleton<IAuthService>(
      () => FirebaseAuthService(firebaseAuth: i<FirebaseAuth>()),
    );
    i.addSingleton<LoginController>(
        () => LoginController(authService: i<IAuthService>()));
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
  }
}
