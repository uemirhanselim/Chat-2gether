import 'package:chat_2gether/service/auth_service.dart';
import 'package:chat_2gether/view/login_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RegisterViewModel extends ChangeNotifier {
  final IAuthService authService;

  RegisterViewModel(this.authService);

  Future<void> signUpWithEmailAndPassword(String email, String password) async {
    print("Entered to method");
    try {
      await authService.signUpWithEmailAndPassword(email, password);
    } on Exception catch (e) {
      print(
          'Error occured while creating an account with email and password $e');
    }
  }

  navigateToLogin(BuildContext context) {
    return Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => const LoginView()));
  }
}
