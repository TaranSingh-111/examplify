import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/auth_bloc.dart';
import '../bloc/auth_event.dart';
import '../bloc/auth_state.dart';
import '../widgets/auth_button.dart';
import '../widgets/auth_text_field.dart';
import 'signup_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  void _login() {
    if (!_formKey.currentState!.validate()) return;

    context.read<AuthBloc>().add(
      LoginRequested(
        email: emailController.text.trim(),
        password: passwordController.text.trim(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Color(0xFF04151F), Color(0xFF0A3A4A)],
          ),
        ),
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(24),
            child: BlocBuilder<AuthBloc, AuthState>(
              builder: (context, state) {
                return Container(
                  padding: const EdgeInsets.all(24),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(24),
                    border: Border.all(color: Colors.white54),
                  ),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        const Text(
                          "Sign in",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 24,
                              fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 8),
                        const Text(
                          "Sign in to your account via email",
                          style: TextStyle(color: Colors.white70),
                        ),

                        const SizedBox(height: 24),

                        AuthTextField(
                          controller: emailController,
                          hint: "Enter your email id",
                          prefixIcon: Icons.email_outlined,
                          validator: (v) =>
                          v == null || v.isEmpty ? "Required" : null,
                        ),

                        const SizedBox(height: 16),

                        AuthTextField(
                          controller: passwordController,
                          hint: "Enter your password",
                          prefixIcon: Icons.lock_outline,
                          isPassword: true,
                          validator: (v) =>
                          v == null || v.length < 6 ? "Min 6 chars" : null,
                        ),

                        const SizedBox(height: 24),

                        AuthButton(
                          text: "Sign in",
                          isLoading: state is AuthLoading,
                          onPressed: _login,
                        ),

                        const SizedBox(height: 12),

                        TextButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (_) => const SignupScreen()),
                            );
                          },
                          child: const Text(
                            "Create account",
                            style: TextStyle(color: Colors.white),
                          ),
                        ),

                        const SizedBox(height: 16),

                        const Text(
                          "Sign in with social media",
                          style: TextStyle(color: Colors.white70),
                        ),

                        const SizedBox(height: 12),

                        // GOOGLE BUTTON (UI ONLY)
                        SizedBox(
                          width: double.infinity,
                          height: 50,
                          child: OutlinedButton.icon(
                            onPressed: () {}, // intentionally empty
                            icon: Image.network(
                              "https://upload.wikimedia.org/wikipedia/commons/0/09/IOS_Google_icon.png",
                              height: 20,
                            ),
                            label: const Text("Sign in with Google"),
                            style: OutlinedButton.styleFrom(
                              foregroundColor: Colors.white,
                              side: const BorderSide(color: Colors.white),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(14),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
