import 'package:ca_flutter_test/core/utils/result.dart';
import 'package:ca_flutter_test/features/auth/data/services/firebase_auth_service.dart';
import 'package:ca_flutter_test/features/auth/interactor/exceptions/auth_exception.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockFirebaseAuth extends Mock implements FirebaseAuth {}

class MockUserCredential extends Mock implements UserCredential {}

void main() {
  final firebaseAuth = MockFirebaseAuth();
  final service = FirebaseAuthService(firebaseAuth: firebaseAuth);
  const email = "teste@teste.com";
  const password = "!teste@1234";

  group('loginWithEmailAndPassword |', () {
    test(
      "should return Result.ok(true) when the login is successful",
      () async {
        // Arrange
        when(() => firebaseAuth.signInWithEmailAndPassword(
            email: email, password: password)).thenAnswer(
          (_) => Future.value(MockUserCredential()),
        );

        // Act
        final result = await service.loginWithEmailAndPassword(
          email: email,
          password: password,
        );

        // Assert
        expect(result, Result<bool>.ok(true));
      },
    );

    test(
      "should return Result.error(NetworkRequestFailureException()) when the exception is FirebaseAuthException and the error code is 'network-request-failed'",
      () async {
        // Arrange
        when(() => firebaseAuth.signInWithEmailAndPassword(
              email: email,
              password: password,
            )).thenThrow(FirebaseAuthException(code: "network-request-failed"));

        // Act
        final result = await service.loginWithEmailAndPassword(
          email: email,
          password: password,
        );

        // Assert
        expect(
          result,
          Result<bool>.error(NetworkRequestFailureException()),
        );
      },
    );

    test(
      "should return Result.error(InvalidCredentialsException()) when the exception is FirebaseAuthException and the error code is different than 'network-request-failed'",
      () async {
        // Arrange
        when(() => firebaseAuth.signInWithEmailAndPassword(
              email: email,
              password: password,
            )).thenThrow(FirebaseAuthException(code: ""));

        // Act
        final result = await service.loginWithEmailAndPassword(
          email: email,
          password: password,
        );

        // Assert
        expect(
          result,
          Result<bool>.error(InvalidCredentialsException()),
        );
      },
    );

    test(
      "should return Result.error(Exception()) when the exception is not FirebaseAuthException",
      () async {
        final e = Exception();
        // Arrange
        when(() => firebaseAuth.signInWithEmailAndPassword(
              email: email,
              password: password,
            )).thenThrow(e);

        // Act
        final result = await service.loginWithEmailAndPassword(
          email: email,
          password: password,
        );

        // Assert
        expect(
          result,
          Result<bool>.error(e),
        );
      },
    );
  });
}
