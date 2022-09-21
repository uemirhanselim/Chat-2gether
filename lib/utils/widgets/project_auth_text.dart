import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class ProjectAuthText extends StatelessWidget {
  const ProjectAuthText({
    Key? key,
     required this.isLogin,
  }) : super(key: key);

  final bool isLogin;

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
          text: isLogin
              ? "Don't you have an account?   "
              : "Already have an account?   ",
          style: const TextStyle(color: Color.fromARGB(248, 172, 192, 247)),
          children: [
            TextSpan(
                recognizer: TapGestureRecognizer(),
                text: isLogin ? "Sign Up" : "Sign In",
                style: const TextStyle(
                    color: Colors.white, fontWeight: FontWeight.bold))
          ]),
    );
  }
}
