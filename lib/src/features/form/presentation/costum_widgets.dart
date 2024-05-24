// custom_widgets.dart
import 'package:flutter/material.dart';

Widget buildEmail(TextEditingController emailController,
        String? Function(String?) validateEmail) =>
    TextFormField(
      controller: emailController,
      decoration: const InputDecoration(
        border: OutlineInputBorder(),
        label: Text("Email"),
      ),
      autovalidateMode: AutovalidateMode.onUserInteraction,
      validator: validateEmail,
    );

Widget buildPassword(TextEditingController passwordController,
        String? Function(String?) validatePw) =>
    TextFormField(
      controller: passwordController,
      decoration: const InputDecoration(
        border: OutlineInputBorder(),
        label: Text("Passwort"),
      ),
      autovalidateMode: AutovalidateMode.onUserInteraction,
      validator: validatePw,
    );

Widget buildLoginButton(BuildContext context, GlobalKey<FormState> formKey) =>
    FilledButton(
      onPressed: () {
        if (formKey.currentState?.validate() ?? false) {
          // Die Form ist valide
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Eingaben sind korrekt!')),
          );
        } else {
          // Die Form ist nicht valide
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Bitte korrigiere deine Eingaben.')),
          );
        }
      },
      child: const Text("Login"),
    );
