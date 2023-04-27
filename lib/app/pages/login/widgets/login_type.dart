import 'package:flutter/material.dart';

class LoginType extends StatefulWidget {
  final List<bool> selectedList;
  final Function(int) alterareLoginType;

  const LoginType({required this.selectedList, required this.alterareLoginType, super.key});

  @override
  State<LoginType> createState() => _LoginTypeState();
}

class _LoginTypeState extends State<LoginType> {
  final List<Widget> _toggleWidget = <Widget>[
    const Text(
      'Email',
      style: TextStyle(fontWeight: FontWeight.bold),
    ),
    const Text(
      'CPF',
      style: TextStyle(fontWeight: FontWeight.bold),
    ),
    const Text(
      'Telefone',
      style: TextStyle(fontWeight: FontWeight.bold),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        const Text('Logar com: '),
        const SizedBox(
          width: 20,
        ),
        ToggleButtons(
          //renderBorder: false,
          //isSelected: _toogleBool,
          //onPressed: _alterareLoginType,
          isSelected: widget.selectedList,
          onPressed: widget.alterareLoginType,
          borderRadius: const BorderRadius.all(Radius.circular(10)),
          selectedBorderColor: Colors.green[700],
          selectedColor: Colors.green,
          fillColor: Colors.white.withAlpha(50),
          color: Colors.green[400],
          constraints: const BoxConstraints(
            minHeight: 40.0,
            minWidth: 80.0,
          ),
          //renderBorder: false,
          children: _toggleWidget,
        ),
      ],
    );
  }
}
