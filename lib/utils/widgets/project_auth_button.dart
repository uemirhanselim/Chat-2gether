import 'package:flutter/material.dart';

class ProjectAuthButton extends StatelessWidget {
  const ProjectAuthButton(
      {Key? key, required this.isLogin, required this.onPressed})
      : super(key: key);

  final bool isLogin;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
          shadowColor: Colors.white,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          backgroundColor: const Color.fromARGB(255, 22, 139, 235),
          minimumSize: const Size.fromHeight(50)),
      child: isLogin ? const Text("Sign In") : const Text("Sign Up"),
    );
  }
}
