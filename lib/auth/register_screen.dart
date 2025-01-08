import 'package:evently/auth/login_screen.dart';
import 'package:evently/widgets/default_button.dart';
import 'package:evently/widgets/default_text_form_field.dart';
import 'package:flutter/material.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  static const String routeName = '/register';

  @override
  State<RegisterScreen> createState() => RegisterScreenState();
}

class RegisterScreenState extends State<RegisterScreen> {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Form(
            key: formKey,
            child: Column(
              children: [
                Image.asset(
                  'assets/images/Logo.png',
                  height: MediaQuery.sizeOf(context).height * 0.2,
                ),
                const SizedBox(
                  height: 16,
                ),
                DefaultTextFormField(
                  controller: emailController,
                  hintText: 'Name',
                  prefixIconImage: 'username',
                  validator: (value) {
                    if (value == null || value.length < 3) {
                      return 'invalid username';
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 16,
                ),
                DefaultTextFormField(
                  controller: emailController,
                  hintText: 'Email',
                  prefixIconImage: 'mail',
                  validator: (value) {
                    if (value == null || value.length < 5) {
                      return 'invalid email';
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 16,
                ),
                DefaultTextFormField(
                  controller: passwordController,
                  hintText: 'Password',
                  prefixIconImage: 'password',
                  validator: (value) {
                    if (value == null || value.length < 8) {
                      return 'password can be less than 8 characters';
                    }
                    return null;
                  },
                  isPassword: true,
                ),
                const SizedBox(
                  height: 24,
                ),
                DefaultButton(onPressed: login, label: 'Register'),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Already have an account?",
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                    TextButton(
                      onPressed: () => Navigator.of(context)
                          .pushNamed(LoginScreen.routeName),
                      child: const Text(
                        'Login',
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void login() {
    if (formKey.currentState!.validate()) {}
  }
}
