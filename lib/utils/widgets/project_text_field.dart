import 'package:flutter/material.dart';

class ProjectTextField extends StatefulWidget {
  const ProjectTextField({
    Key? key,
    required this.controller,
    required this.isEmail,
  }) : super(key: key);

  final TextEditingController controller;
  final bool isEmail;

  @override
  State<ProjectTextField> createState() => _ProjectTextFieldState();
}

class _ProjectTextFieldState extends State<ProjectTextField> {
  bool isVisible = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      decoration: const BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Color.fromARGB(255, 255, 255, 255),
              spreadRadius: 1,
              blurRadius: 5,
            ),
          ],
          color: Color.fromARGB(252, 109, 134, 201),
          borderRadius: BorderRadius.all(Radius.circular(12))),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: TextField(
          controller: widget.controller,
          keyboardType:
              widget.isEmail ? TextInputType.emailAddress : TextInputType.text,
          textInputAction: TextInputAction.next,
          obscureText: isVisible,
          decoration: InputDecoration(
              suffixIcon: !widget.isEmail
                  ? Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: InkWell(
                        onTap: () {
                          setState(() {
                            isVisible = !isVisible;
                          });
                        },
                        child: AnimatedCrossFade(
                            firstChild: const Icon(
                              Icons.visibility_off,
                              color: Colors.white,
                            ),
                            secondChild: const Icon(Icons.visibility,
                                color: Colors.white),
                            crossFadeState: !isVisible
                                ? CrossFadeState.showFirst
                                : CrossFadeState.showSecond,
                            duration: const Duration(seconds: 1)),
                      ),
                    )
                  : null,
              border: InputBorder.none,
              hintText:
                  widget.isEmail ? 'Your e-mail here' : 'Your password here',
              hintStyle: const TextStyle(
                  fontSize: 18, color: Color.fromARGB(255, 198, 195, 195))),
          textAlignVertical: TextAlignVertical.center,
          style: const TextStyle(fontSize: 18, color: Colors.white),
        ),
      ),
    );
  }
}
