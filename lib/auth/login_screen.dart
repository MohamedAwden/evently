import 'package:evently/widgets/default_text_form_field.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  static const String RouteName = '/login';

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Image.asset(
              'assets/images/Logo.png',
              height: MediaQuery.sizeOf(context).height * 0.2,
            ),
            DefaultTextFormField(
              controller: emailController,
              hintText: 'Email',
              prefixIconImage: 'mail',
              validator: (value) {},
            ),
          ],
        ),
      ),
    );
  }
}
