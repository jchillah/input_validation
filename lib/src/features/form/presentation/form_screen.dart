import 'package:flutter/material.dart';

class FormScreen extends StatelessWidget {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  // GlobalKey zur Identifikation der Form
  final formKey = GlobalKey<FormState>();
  final String email = '';
  final String password = '';

  // Konstruktor
  FormScreen({super.key});

  // Methoden
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(32.0),
        child: Form(
          key: formKey,
          child: Column(children: [
            buildEmail(),
            const SizedBox(height: 8),
            buildPassword(),
            const SizedBox(height: 32),
            FilledButton(
              onPressed: () {
                if (formKey.currentState?.validate() ?? false) {
                  // Die Form ist valide
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Form ist valide!')),
                  );
                } else {
                  // Die Form ist nicht valide
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                        content: Text('Bitte korrigiere deine Eingaben.')),
                  );
                }
              },
              child: const Text("Login"),
            ),
          ]),
        ),
      ),
    );
  }

  Widget buildEmail() => TextFormField(
        controller: emailController,
        decoration: const InputDecoration(
          border: OutlineInputBorder(),
          label: Text("Email"),
        ),
        autovalidateMode: AutovalidateMode.onUserInteraction,
        validator: validateEmail,
      );

  String? validateEmail(String? input) {
    if (input == null || input.isEmpty) {
      return "Email darf nicht leer sein";
    }
    if (input.length < 5) {
      return "Email muss mindestens aus 6 Zeichen bestehen";
    }
    if (!input.contains("@")) {
      return 'Email muss das Zeichen "@" enthalten';
    }
    if (!(input.endsWith(".com") || input.endsWith(".de"))) {
      return 'Email muss mit ".com" oder ".de" enden';
    }
    return null;
  }

  Widget buildPassword() => TextFormField(
        controller: passwordController,
        decoration: const InputDecoration(
          border: OutlineInputBorder(),
          label: Text("Passwort"),
        ),
        autovalidateMode: AutovalidateMode.onUserInteraction,
        validator: validatePw,
      );

  String? validatePw(String? input) {
    if (input == null || input.isEmpty) {
      return "Passwort darf nicht leer sein";
    }
    if (input.length < 6 || input.length > 12) {
      return "Passwort muss zwischen 6 und maximal 12 Zeichen lang sein";
    }
    return null;
  }
}
