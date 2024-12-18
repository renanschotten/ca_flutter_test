import 'package:ca_flutter_test/core/routing/routes.dart';
import 'package:ca_flutter_test/features/auth/interactor/controller/login_controller.dart';
import 'package:ca_flutter_test/features/auth/interactor/states/login_state.dart';
import 'package:ca_flutter_test/features/auth/ui/widgets/failure_dialog_widget.dart';
import 'package:ca_flutter_test/features/shared/ui/widgets/failure_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key, required this.loginController});
  final LoginController loginController;

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final emailFocus = FocusNode();
  final passwordFocus = FocusNode();

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    widget.loginController.loginState.addListener(loginStateListener);
  }

  void loginStateListener() async {
    switch (widget.loginController.loginState.value) {
      case FailureLoginState():
        await showDialog(
          context: context,
          builder: (context) => FailureDialogWidget(
            title: 'Erro',
            description: 'Email ou senha incorretos',
            buttonText: 'Fechar',
            onTap: Modular.to.pop,
          ),
        );
        break;
      case SuccessLoginState():
        Modular.to.pushReplacementNamed(Routes.home);
        break;
      default:
    }
  }

  @override
  void dispose() {
    widget.loginController.loginState.removeListener(loginStateListener);
    emailController.dispose();
    passwordController.dispose();
    emailFocus.dispose();
    passwordFocus.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
      ),
      body: ValueListenableBuilder(
        valueListenable: widget.loginController.loginState,
        builder: (context, state, _) {
          return switch (state) {
            LoadingLoginState() => Center(
                child: CircularProgressIndicator(),
              ),
            NoConnectionLoginState() => FailureWidget(
                title: state.title,
                description: state.description,
                buttonText: state.buttonText,
                onTapButton: state.onTapButton,
              ),
            _ => Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  spacing: 16.0,
                  children: [
                    Form(
                      autovalidateMode: AutovalidateMode.always,
                      onChanged: () => widget.loginController.validateForm(
                        emailController.text,
                        passwordController.text,
                      ),
                      child: Column(
                        children: [
                          TextFormField(
                            onTapOutside: (_) => emailFocus.unfocus(),
                            maxLength: 50,
                            focusNode: emailFocus,
                            controller: emailController,
                            keyboardType: TextInputType.emailAddress,
                            decoration: InputDecoration(hintText: "Email"),
                            validator: (value) =>
                                widget.loginController.validateEmail(value),
                          ),
                          TextFormField(
                            maxLength: 12,
                            focusNode: passwordFocus,
                            onTapOutside: (_) => passwordFocus.unfocus(),
                            decoration: InputDecoration(
                              hintText: "Senha",
                            ),
                            controller: passwordController,
                            validator: (value) =>
                                widget.loginController.validatePassword(value),
                          ),
                        ],
                      ),
                    ),
                    Spacer(),
                    ValueListenableBuilder(
                      valueListenable: widget.loginController.buttonState,
                      builder: (context, state, _) => SizedBox(
                        width: MediaQuery.sizeOf(context).width,
                        child: ElevatedButton(
                          onPressed: state == ButtonState.enabled
                              ? () async {
                                  await widget.loginController
                                      .loginWithEmailAndPassword(
                                    email: emailController.text,
                                    password: passwordController.text,
                                  );
                                }
                              : null,
                          child: Text('Login'),
                        ),
                      ),
                    ),
                  ],
                ),
              )
          };
        },
      ),
    );
  }
}
