import 'package:ca_flutter_test/core/routing/routes.dart';
import 'package:ca_flutter_test/features/splash/ui/pages/splash_page.dart';

import 'package:flutter_modular/flutter_modular.dart';

class BlogModule extends Module {
  @override
  void binds(Injector i) {
    // TODO: implement binds
    super.binds(i);
  }

  @override
  void routes(RouteManager r) {
    r.child(
      Routes.splash,
      child: (context) => SplashPage(),
    );
  }
}
