import 'package:chat_2gether/model_view/login_view_model.dart';
import 'package:chat_2gether/service/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../utils/app_logo.dart';
import '../../utils/widgets/project_auth_button.dart';
import '../../utils/widgets/project_auth_text.dart';
import '../../utils/widgets/project_text_field.dart';

class LoginView extends StatefulWidget {
  const LoginView({Key? key}) : super(key: key);
  @override
  State<LoginView> createState() => LoginViewState();
}

class LoginViewState extends State<LoginView> {
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController emailContoller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => LoginViewModel(AuthService()),
      builder: (context, child) {
        return Scaffold(
          backgroundColor: const Color.fromARGB(255, 81, 118, 148),
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const AppLogo(),
                  const SizedBox(height: 60),
                  ProjectTextField(controller: emailContoller, isEmail: true),
                  const SizedBox(height: 20),
                  ProjectTextField(
                      controller: passwordController, isEmail: false),
                  const SizedBox(height: 30),
                  _authButton(context),
                  const SizedBox(height: 20),
                  _authText(context),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  ProjectAuthText _authText(BuildContext context) {
    return ProjectAuthText(
      isLogin: true,
      onTap: () {
        context.read<LoginViewModel>().navigateToRegister(context);
      },
    );
  }

  ProjectAuthButton _authButton(BuildContext context) {
    return ProjectAuthButton(
      isLogin: true,
      onPressed: () {
        context.read<LoginViewModel>().navigateToRegister(context);
      },
    );
  }
}
