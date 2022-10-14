import 'package:chat_2gether/service/auth_service.dart';
import 'package:chat_2gether/view/auth/register_view.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class LoginViewModel extends ChangeNotifier {
  final IAuthService authService;

  LoginViewModel(this.authService);

  Future<UserCredential> signUpWithGoogle() async {
    return await authService.signInWithGoogle();
  }

  navigateToRegister(BuildContext context) {
    return Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => const RegisterView()));
  }
}
