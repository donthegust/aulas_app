import 'package:flutter/material.dart';

enum LoginTypes {
  email,
  cpf,
  telefone,
}

class LoginDetails {
  late String label;
  late String hintText;
  late Icon prefixIcon;

  LoginDetails({
    required this.label,
    required this.hintText,
    required this.prefixIcon,
  });

  static Map<LoginTypes, LoginDetails> loginDetails() {
    return {
      LoginTypes.email: LoginDetails(
        label: 'Email',
        hintText: 'user@mail.com',
        prefixIcon: const Icon(Icons.mail),
      ),
      LoginTypes.cpf: LoginDetails(
        label: 'CPF',
        hintText: '111.111.111-11',
        prefixIcon: const Icon(Icons.credit_card),
      ),
      LoginTypes.telefone: LoginDetails(
        label: 'Telefone',
        hintText: '(11) 11111-1111',
        prefixIcon: const Icon(Icons.phone),
      ),
    };
  }
}
