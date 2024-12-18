import 'package:internet_connection_checker/internet_connection_checker.dart';

class InternetConnectionService {
  Future<bool> checkInternetConnection() async =>
      await InternetConnectionChecker.instance.hasConnection;
}
