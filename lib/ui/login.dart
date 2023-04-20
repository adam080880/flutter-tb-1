import 'package:flutter/material.dart';
import 'package:tb_1/ui/product_list.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({Key? key}) : super(key: key);

  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(title: const Text('Login')),
      body: Center(
        child: Container(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _renderTitle(),
              _renderTextBoxUsername(),
              _renderTextBoxPassword(),
              _renderSaveButton(context),
            ]
          )
        )
      ),
    );
  }

  _renderTitle() {
    return Container(
      margin: const EdgeInsets.only(bottom: 24),
      child: const Text(
        'Login Page',
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 24,
        ),
        textAlign: TextAlign.center,
      )
    );
  }

  _renderTextBoxUsername() {
    return TextField(
        decoration: const InputDecoration(
            hintText: 'Ex: Muhamad Adam', labelText: 'Nama Mahasiswa'),
        controller: _usernameController
      );
  }

  _renderTextBoxPassword() {
    return TextField(
        obscureText: true,
        enableSuggestions: false,
        autocorrect: false,
        decoration: const InputDecoration(
            hintText: 'Ex: 0006', labelText: 'Password'),
        controller: _passwordController
      );
  }

  _renderSaveButton(context) {
    return Container(
      margin: const EdgeInsets.only(top: 24),
      child: ElevatedButton(
        onPressed: _handleLoginButton(context), child: const Text('Login'))
    );
  }

  _handleLoginButton(context) {
    return () {
      String username = _usernameController.text;
      String password = _passwordController.text;

      if (username.isEmpty || password.isEmpty) {
        AlertDialog alert = AlertDialog(
            title: const Text('Input tidak valid'),
            content: const Text('Username dan password harus diisi'),
            actions: [
              TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text('OK'))
            ]);

        showDialog(context: context, builder: (BuildContext context) => alert);

        return;
      }

      if (username == 'Muhamad Adam' && password == '0006') {
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => const ProductList()
        ));
      } else {
        AlertDialog alert = AlertDialog(
            title: const Text('Login tidak valid'),
            content: const Text('Username atau password salah'),
            actions: [
              TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text('OK'))
            ]);

        showDialog(context: context, builder: (BuildContext context) => alert);
      }

    };
  }
}