import 'package:flutter/material.dart';
import '../utils/app_theme.dart';

class LoginPage extends StatefulWidget {
  final VoidCallback onLoginSuccess;
  final VoidCallback onShowRegister;
  const LoginPage({super.key, required this.onLoginSuccess, required this.onShowRegister});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  String _email = '';
  String _password = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Login')),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextFormField(
                  decoration: const InputDecoration(labelText: 'Email'),
                  onSaved: (v) => _email = v ?? '',
                  validator: (v) => (v == null || v.isEmpty) ? 'Enter email' : null,
                ),
                const SizedBox(height: 16),
                TextFormField(
                  decoration: const InputDecoration(labelText: 'Password'),
                  obscureText: true,
                  onSaved: (v) => _password = v ?? '',
                  validator: (v) => (v == null || v.isEmpty) ? 'Enter password' : null,
                ),
                const SizedBox(height: 32),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(backgroundColor: AppTheme.primaryColor),
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        _formKey.currentState!.save();
                        widget.onLoginSuccess();
                      }
                    },
                    child: const Text('Login'),
                  ),
                ),
                TextButton(
                  onPressed: widget.onShowRegister,
                  child: const Text('No account? Register'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
