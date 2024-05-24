// form_screen.dart
import 'package:flutter/material.dart';
import 'package:input_validation/src/features/form/presentation/costum_widgets.dart';
import 'validators.dart'; // Import validators

class FormScreen extends StatelessWidget {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  FormScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(32.0),
          child: Form(
            key: formKey,
            child: Column(children: [
              buildEmail(emailController, validateEmail),
              const SizedBox(height: 8),
              buildPassword(passwordController, validatePw),
              const SizedBox(height: 32),
              buildLoginButton(context, formKey),
            ]),
          ),
        ),
      ),
    );
  }
}
