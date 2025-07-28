import 'package:carraze/core/router/route_names.dart';
import 'package:carraze/core/widgets/custom_button.dart';
import 'package:carraze/core/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/car1.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(16.0),
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Login',
                    style: TextStyle(
                      fontSize: 36,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 40),
                  CustomTextFormField(
                    labelText: 'Email',
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your email';
                      }
                      if (!RegExp(
                        r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$',
                      ).hasMatch(value)) {
                        return 'Please enter a valid email';
                      }
                      return null;
                    },
                    controller: _emailController,
                    hint: 'Email',
                    keyboardType: TextInputType.emailAddress,
                  ),
                  const SizedBox(height: 20),
                  CustomTextFormField(
                    labelText: 'Password',
                    obscureText: true,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your password';
                      }
                      if (value.length < 6) {
                        return 'Password must be at least 6 characters';
                      }
                      return null;
                    },
                    controller: _passwordController,
                    hint: 'Password',
                    keyboardType: TextInputType.text,
                  ),
                  const SizedBox(height: 20),
                  CustomButton(
                    backgroundColor: const Color(0xFF2E4A62),
                    content: const Text(
                      'Login',
                      style: TextStyle(fontSize: 18, color: Colors.white),
                    ),
                    onPressed: () {
                      // if (_formKey.currentState!.validate()) {
                      //   // Add login logic here
                      // }
                      GoRouter.of(context).replace(RouteNames.home);
                    },
                  ),
                  const SizedBox(height: 10),
                  TextButton(
                    onPressed: () {
                      // Add forgot password logic here
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        const Text(
                          'Forgot Password?',
                          style: TextStyle(color: Colors.white70),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 10),
                  TextButton(
                    onPressed: () {
                      // Navigate to sign up page
                      GoRouter.of(context).push(RouteNames.signUp);
                    },
                    child: const Text(
                      'Don\'t have an account? Sign Up',
                      style: TextStyle(color: Colors.white70),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
