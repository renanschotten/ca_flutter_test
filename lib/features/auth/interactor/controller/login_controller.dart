import 'package:ca_flutter_test/core/utils/result.dart';
import 'package:ca_flutter_test/features/auth/interactor/services/i_auth_service.dart';
import 'package:ca_flutter_test/features/auth/interactor/states/login_state.dart';
import 'package:ca_flutter_test/features/auth/interactor/validators/auth_validators.dart';
import 'package:flutter/foundation.dart';

enum ButtonState {
  enabled,
  disabled,
}

class LoginController {
  final IAuthService authService;
  final loginState = ValueNotifier<LoginState>(InitialLoginState());
  final buttonState = ValueNotifier<ButtonState>(ButtonState.disabled);

  LoginController({required this.authService});

  Future<void> loginWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    updateStatesForRequest();
    final result = await authService.loginWithEmailAndPassword(
      email: email,
      password: password,
    );
    buttonState.value = ButtonState.enabled;
    switch (result) {
      case Ok():
        loginState.value = SuccessLoginState();
        break;
      case Error():
        loginState.value = FailureLoginState();
        break;
    }
  }

  void updateStatesForRequest() {
    loginState.value = LoadingLoginState();
    buttonState.value = ButtonState.disabled;
  }

  String? validateEmail(String? value) =>
      AuthValidators.validateEmail(value) ? null : 'Email inválido';

  String? validatePassword(String? value) =>
      AuthValidators.validatePassword(value) ? null : 'Senha inválida';

  void validateForm(String email, String password) {
    buttonState.value = AuthValidators.validateEmail(email) &&
            AuthValidators.validatePassword(password)
        ? ButtonState.enabled
        : ButtonState.disabled;
  }
}
