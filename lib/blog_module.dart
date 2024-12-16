import 'package:ca_flutter_test/core/routing/routes.dart';
import 'package:ca_flutter_test/features/login/ui/pages/login_page.dart';
import 'package:ca_flutter_test/features/shared/connectivity/interactor/controller/connectivity_controller.dart';
import 'package:ca_flutter_test/features/splash/ui/pages/splash_page.dart';

import 'package:flutter_modular/flutter_modular.dart';

class BlogModule extends Module {
  @override
  void binds(Injector i) {
    i.addSingleton(ConnectivityController.new);
  }

  @override
  void routes(RouteManager r) {
    r.child(
      Routes.splash,
      child: (context) => SplashPage(),
    );
    r.child(
      Routes.login,
      child: (context) => LoginPage(),
    );
  }
}
