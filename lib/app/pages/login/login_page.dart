import 'package:aulas_app/app/classes/login_details.dart';
import 'package:aulas_app/app/pages/login/widgets/login_text_field.dart';
import 'package:aulas_app/app/pages/login/widgets/login_type.dart';
import 'package:flutter/material.dart';
import 'package:collection/collection.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  List<bool> _toogleBool = <bool>[true, false, false];
  bool _visiblePassword = true;
  late final TextEditingController _loginController;
  late final TextEditingController _passwordController;
  LoginTypes _loginType = LoginTypes.email;
  var _memorize = false;

  @override
  void initState() {
    _loginController = TextEditingController();
    _passwordController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _loginController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _alterareLoginType(int index) {
    setState(() {
      _loginType = LoginTypes.values[index];
      _toogleBool = _toogleBool.mapIndexed((ind, val) => ind == index).toList();
    });
  }

  void _alterateVisibility() {
    setState(() {
      _visiblePassword = !_visiblePassword;
    });
  }

  void testFields() {
    debugPrint('User: ${_loginController.text}');
    debugPrint('Password: ${_passwordController.text}');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: SizedBox(
            width: MediaQuery.of(context).size.width * 0.9,
            height: MediaQuery.of(context).size.height,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Image(
                  image: const AssetImage('assets/images/Logo.png'),
                  height: MediaQuery.of(context).size.height * 0.25,
                ),
                const SizedBox(height: 16),
                LoginType(
                  selectedList: _toogleBool,
                  alterareLoginType: _alterareLoginType,
                ),
                const SizedBox(height: 16),
                LoginTextField(
                  controller: _loginController,
                  loginType: _loginType,
                ),
                const SizedBox(height: 16),
                TextField(
                  controller: _passwordController,
                  obscureText: _visiblePassword,
                  decoration: InputDecoration(
                    prefixIcon: const Icon(Icons.lock),
                    suffixIcon: IconButton(
                      onPressed: _alterateVisibility,
                      icon: _visiblePassword ? const Icon(Icons.visibility) : const Icon(Icons.visibility_off),
                    ),
                    label: const Text('Senha'),
                    hintText: 'password',
                    border: const OutlineInputBorder(),
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    const Text('Memorizar dados'),
                    Switch(
                      value: _memorize,
                      onChanged: (value) {
                        setState(() {
                          _memorize = !_memorize;
                        });
                      },
                    )
                  ],
                ),
                const SizedBox(height: 16),
                ElevatedButton(
                  onPressed: testFields,
                  style: ElevatedButton.styleFrom(
                    minimumSize: Size(MediaQuery.of(context).size.width * 0.75, 60),
                  ),
                  child: const Text('Login'),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
