import 'package:ca_flutter_test/core/utils/result.dart';

abstract interface class IAuthService {
  Future<Result<bool>> loginWithEmailAndPassword({
    required String email,
    required String password,
  });
}
