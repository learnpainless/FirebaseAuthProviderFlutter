import 'package:flutter/material.dart';
import 'package:flutter_provider_proto/providers/login_provider.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController _email;
  TextEditingController _password;
  final _key = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _email = TextEditingController(text: "");
    _password = TextEditingController(text: "");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _key,
      appBar: AppBar(
        title: Text('Login Screen'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              decoration: InputDecoration(hintText: 'Email'),
              controller: _email,
            ),
            TextField(
              decoration: InputDecoration(hintText: 'Password'),
              controller: _password,
            ),
            RaisedButton(
              onPressed: () async {
                if (!await context
                    .read<LoginProvider>()
                    .login(_email.text, _password.text)) {
                  _key.currentState.showSnackBar(
                      SnackBar(content: Text('Unable to login.')));
                }
              },
              child: Text('Login'),
            )
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _email.dispose();
    _password.dispose();
    super.dispose();
  }
}
