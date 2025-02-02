import 'package:evently/auth/register_screen.dart';
import 'package:evently/firebase_service.dart';
import 'package:evently/widgets/default_button.dart';
import 'package:evently/widgets/default_text_form_field.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../providers/user_provider.dart';
import '../screens/home_screen.dart';
import '../utils/app_theme.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  static const String routeName = '/login';

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
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
                DefaultButton(onPressed: login, label: AppLocalizations.of(context)!.login),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Don't have an account?",
                      style: Theme.of(context).textTheme.labelLarge,
                    ),
                    TextButton(
                      onPressed: () => Navigator.of(context)
                          .pushNamed(RegisterScreen.routeName),
                      child: const Text(
                        'Create Account',
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
    if (formKey.currentState!.validate()) {
      FirebaseService.login(
        email: emailController.text,
        password: passwordController.text,
      ).then(
            (user) {
          Provider.of<UserProvider>(context, listen: false).updateCUrrrentUser(user);
          Navigator.of(context).pushReplacementNamed(HomeScreen.routeName);
        },
      )
          .catchError(
            (error) {
              String? errorMessage;
              if(error is FirebaseAuthException){
                errorMessage =error.message;
              }
              Fluttertoast.showToast(
                  msg: errorMessage ?? "something went wrong",
                  toastLength: Toast.LENGTH_LONG,
                  gravity: ToastGravity.BOTTOM,
                  timeInSecForIosWeb: 1,
                  backgroundColor: AppTheme.green,
                  textColor: Colors.white,
                  fontSize: 16.0
              );
        },
      );
      }
  }
}
