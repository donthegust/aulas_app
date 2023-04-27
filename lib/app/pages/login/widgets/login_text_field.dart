import 'package:aulas_app/app/classes/login_details.dart';
import 'package:flutter/material.dart';

class LoginTextField extends StatefulWidget {
  final TextEditingController _controller;
  final LoginTypes loginType;

  const LoginTextField({
    required controller,
    required this.loginType,
    super.key,
  }) : _controller = controller;

  @override
  State<LoginTextField> createState() => _LoginTextFieldState();
}

class _LoginTextFieldState extends State<LoginTextField> {
  //final Map<LoginTypes, LoginDetails> loginDetails = LoginDetails.loginDetails();
  var loginDetails = LoginDetails.loginDetails();

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: widget._controller,
      decoration: InputDecoration(
        prefixIcon: loginDetails[widget.loginType]!.prefixIcon,
        label: Text(loginDetails[widget.loginType]!.label),
        hintText: loginDetails[widget.loginType]!.hintText,
        border: const OutlineInputBorder(),
      ),
    );
  }
}
