import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/auth_bloc.dart';
import '../bloc/auth_event.dart';
import '../bloc/auth_state.dart';
import '../widgets/auth_button.dart';
import '../widgets/auth_text_field.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final name = TextEditingController();
  final email = TextEditingController();
  final password = TextEditingController();
  final studentNo = TextEditingController();
  final branch = TextEditingController();
  final section = TextEditingController();
  final year = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  void _signup() {
    if (!_formKey.currentState!.validate()) return;

    context.read<AuthBloc>().add(
      SignupRequested(
        name: name.text.trim(),
        email: email.text.trim(),
        password: password.text.trim(),
        studentNo: int.parse(studentNo.text),
        branch: branch.text.trim(),
        section: section.text.trim(),
        year: int.parse(year.text),
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
                        const Text("Create Account",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 22,
                                fontWeight: FontWeight.bold)),

                        const SizedBox(height: 20),

                        AuthTextField(controller: name, hint: "Full name"),
                        const SizedBox(height: 12),

                        AuthTextField(controller: email, hint: "Email"),
                        const SizedBox(height: 12),

                        AuthTextField(
                          controller: password,
                          hint: "Password",
                          isPassword: true,
                        ),
                        const SizedBox(height: 12),

                        AuthTextField(
                          controller: studentNo,
                          hint: "Student number",
                          keyboardType: TextInputType.number,
                        ),
                        const SizedBox(height: 12),

                        AuthTextField(controller: branch, hint: "Branch"),
                        const SizedBox(height: 12),

                        AuthTextField(controller: section, hint: "Section"),
                        const SizedBox(height: 12),

                        AuthTextField(
                          controller: year,
                          hint: "Year",
                          keyboardType: TextInputType.number,
                        ),

                        const SizedBox(height: 24),

                        AuthButton(
                          text: "Sign Up",
                          isLoading: state is AuthLoading,
                          onPressed: _signup,
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
