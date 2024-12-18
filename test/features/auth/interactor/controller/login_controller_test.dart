import 'package:ca_flutter_test/core/utils/result.dart';
import 'package:ca_flutter_test/features/auth/interactor/controller/login_controller.dart';
import 'package:ca_flutter_test/features/auth/interactor/exceptions/auth_exception.dart';
import 'package:ca_flutter_test/features/auth/interactor/services/i_auth_service.dart';
import 'package:ca_flutter_test/features/auth/interactor/states/login_state.dart';
import 'package:mocktail/mocktail.dart';
import 'package:flutter_test/flutter_test.dart';

class MockAuthService extends Mock implements IAuthService {}

void main() {
  final authService = MockAuthService();
  final controller = LoginController(authService: authService);
  const email = "teste@teste.com";
  const password = "!teste@1234";
  group(
    "loginWithEmailAndPassword |",
    () {
      test(
        "should assign SuccessLoginState to loginState and ButtonState.enabled to buttonState when authService response is Result.ok(true)",
        () async {
          // Arrange
          when(
            () => authService.loginWithEmailAndPassword(
              email: email,
              password: password,
            ),
          ).thenAnswer((_) => Future.value(Result.ok(true)));

          // Act
          await controller.loginWithEmailAndPassword(
            email: email,
            password: password,
          );

          // Assert
          expect(controller.buttonState.value, ButtonState.enabled);
          expect(controller.loginState.value, SuccessLoginState());
        },
      );

      test(
        "should assign FailureLoginState to loginState and ButtonState.enabled to buttonState when authService response is Result.error()",
        () async {
          // Arrange
          when(
            () => authService.loginWithEmailAndPassword(
              email: email,
              password: password,
            ),
          ).thenAnswer((_) => Future.value(Result.error(Exception())));

          // Act
          await controller.loginWithEmailAndPassword(
            email: email,
            password: password,
          );

          // Assert
          expect(controller.buttonState.value, ButtonState.enabled);
          expect(controller.loginState.value, FailureLoginState());
        },
      );

      test(
        "should assign NoConnectionLoginState to loginState and ButtonState.enabled to buttonState when authService response is Result.error(NetworkRequestFailureException())",
        () async {
          // Arrange
          when(
            () => authService.loginWithEmailAndPassword(
              email: email,
              password: password,
            ),
          ).thenAnswer((_) =>
              Future.value(Result.error(NetworkRequestFailureException())));

          // Act
          await controller.loginWithEmailAndPassword(
            email: email,
            password: password,
          );

          // Assert
          expect(controller.buttonState.value, ButtonState.enabled);
          expect(
            controller.loginState.value,
            isInstanceOf<NoConnectionLoginState>(),
          );
        },
      );
    },
  );
  group(
    "updateStatesForRequest |",
    () {
      test(
        "should assign LoadingLoginState to loginState and ButtonState.disabled for buttonState",
        () async {
          // Act
          controller.updateStatesForRequest();

          // Assert
          expect(controller.buttonState.value, ButtonState.disabled);
          expect(controller.loginState.value, LoadingLoginState());
        },
      );
    },
  );

  group(
    "validateEmail |",
    () {
      test("should return null if the email is valid", () {
        // Act
        final result = controller.validateEmail(email);

        // Assert
        expect(result, null);
      });
      test("should return 'Email inválido' when the email is invalid", () {
        // Act
        final result = controller.validateEmail("teste@teste");

        // Assert
        expect(result, "Email inválido");
      });
    },
  );
  group(
    "validatePassword |",
    () {
      test("should return null if the password is valid", () {
        // Act
        final result = controller.validatePassword(password);

        // Assert
        expect(result, null);
      });
      test("should return 'Senha inválida' when the password is invalid", () {
        // Act
        final result = controller.validatePassword('');

        // Assert
        expect(result, "Senha inválida");
      });
    },
  );

  group(
    "validateForm |",
    () {
      test(
        "should assign ButtonState.enabled to buttonState when the email and password are valid",
        () {
          // Act
          controller.validateForm(email, password);

          // Assert
          expect(controller.buttonState.value, ButtonState.enabled);
        },
      );

      test(
        "should assign ButtonState.disabled to buttonState when the email is invalid and the password is valid",
        () {
          // Act
          controller.validateForm("teste@teste", password);

          // Assert
          expect(controller.buttonState.value, ButtonState.disabled);
        },
      );

      test(
        "should assign ButtonState.disabled to buttonState when the email is valid and the password is invalid",
        () {
          // Act
          controller.validateForm(email, "");

          // Assert
          expect(controller.buttonState.value, ButtonState.disabled);
        },
      );
    },
  );
}
