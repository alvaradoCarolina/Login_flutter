import 'package:flutter/material.dart';
import 'SecondScreen.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  final String _correctUsername = 'usuario';
  final String _correctPassword = 'clave';

  void _login() {
    final String username = _usernameController.text;
    final String password = _passwordController.text;

    if (username == _correctUsername && password == _correctPassword) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => SecondScreen(),
        ),
      );
    } else {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text('Error de Login'),
          content: Text('Usuario o contraseña incorrectos.'),
          actions: <Widget>[
            TextButton(
              child: Text('OK'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pantalla de Login'),
      ),
      body: Container(
        color: Colors.lightBlueAccent,
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              TextField(
                controller: _usernameController,
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.person),
                  labelText: 'Usuario',
                  filled: true,
                  fillColor: Colors.white,
                ),
              ),
              SizedBox(height: 20),
              TextField(
                controller: _passwordController,
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.lock),
                  labelText: 'Contraseña',
                  filled: true,
                  fillColor: Colors.white,
                ),
                obscureText: true,
              ),
              SizedBox(height: 20),
              ElevatedButton(
                child: Text('Login'),
                onPressed: _login,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

