import 'package:chat_2gether/view/home_view.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../view/auth/login_view.dart';

abstract class IAuthService {
  handleAuthState();
  Future<void> signUpWithEmailAndPassword(String email, String password);
  Future<void> signInWithEmailAndPassword(String email, String password);
  Future<UserCredential> signInWithGoogle();
  signOut();
}

class AuthService extends IAuthService {
  final FirebaseAuth authInstance = FirebaseAuth.instance;

  //* Checks if user logged in or logged out
  @override
  handleAuthState() {
    return StreamBuilder(
      stream: authInstance.authStateChanges(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return const HomeView();
        } else {
          return const LoginView();
        }
      },
    );
  }

  //* Sign Up with email and password
  @override
  Future<void> signUpWithEmailAndPassword(String email, String password) async {
    await authInstance.createUserWithEmailAndPassword(
        email: email, password: password);
  }

  //* Sign in with email and password
  @override
  Future<void> signInWithEmailAndPassword(String email, String password) async {
    await authInstance.signInWithEmailAndPassword(
        email: email, password: password);
  }

  //* Sign in with google
  @override
  Future<UserCredential> signInWithGoogle() async {
    // Trigger the authentication flow
    final GoogleSignInAccount? googleUser =
        await GoogleSignIn(scopes: <String>["email"]).signIn();

    // Obtain the auth details from the request
    final GoogleSignInAuthentication googleAuth =
        await googleUser!.authentication;

    // Create a new credentinal
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );

    // Once signed in, return the UserCredential
    return await authInstance.signInWithCredential(credential);
  }

  //* Sign out
  @override
  signOut() {
    authInstance.signOut();
  }
}
