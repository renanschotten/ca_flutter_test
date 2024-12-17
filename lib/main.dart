import 'package:ca_flutter_test/blog_module.dart';
import 'package:ca_flutter_test/blog_widget.dart';
import 'package:ca_flutter_test/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(
    ModularApp(
      module: BlogModule(),
      child: BlogWidget(),
    ),
  );
}
