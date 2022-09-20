import 'package:chat_2gether/view/home_view.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../view/login_view.dart';

class AuthService {
  final FirebaseAuth authInstance = FirebaseAuth.instance;

  //* Checks if user logged in or logged out
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
  signUpWithEmailAndPassword(String email, String password) async {
    await authInstance.createUserWithEmailAndPassword(
        email: email, password: password);
  }

  //* Sign in with email and password
  signInWithEmailAndPassword(String email, String password) async {
    await authInstance.signInWithEmailAndPassword(
        email: email, password: password);
  }

  //* Sign in with google
  signInWithGoogle() async {
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
  signOut() {
    authInstance.signOut();
  }
}
