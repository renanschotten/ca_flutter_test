import 'package:ca_flutter_test/core/utils/result.dart';
import 'package:ca_flutter_test/features/auth/interactor/exceptions/auth_exception.dart';
import 'package:ca_flutter_test/features/auth/interactor/services/i_auth_service.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FirebaseAuthService implements IAuthService {
  final FirebaseAuth firebaseAuth;

  FirebaseAuthService({required this.firebaseAuth});

  @override
  Future<Result<bool>> loginWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      await firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      return Result.ok(true);
    } on FirebaseAuthException catch (e) {
      final exception = _getAuthException(e);
      return Result.error(exception);
    } on Exception catch (e) {
      return Result.error(e);
    }
  }

  AuthException _getAuthException(FirebaseAuthException e) {
    if (e.code == "network-request-failed") {
      return NetworkRequestFailureException();
    }
    return InvalidCredentialsException();
  }
}
