import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/auth_bloc.dart';
import '../bloc/auth_event.dart';
import '../bloc/auth_state.dart';
import '../widgets/auth_button.dart';
import '../widgets/auth_text_field.dart';

class SignupScreen extends StatefulWidget {
  final VoidCallback onLoginTap;
  const SignupScreen({super.key, required this.onLoginTap});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final name = TextEditingController();
  final email = TextEditingController();
  final password = TextEditingController();
  final studentno = TextEditingController();
  final branch = TextEditingController();
  final section = TextEditingController();
  final year = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  void _signup() {
    if (!_formKey.currentState!.validate()) return;

    context.read<AuthBloc>().add(
      RegisterEvent(
        name: name.text.trim(),
        email: email.text.trim(),
        password: password.text.trim(),
        studentno: int.parse(studentno.text.trim()),
        branch: branch.text.trim(),
        section: section.text.trim(),
        year: int.parse(year.text.trim()),
      ),
    );
  }

  @override
  void dispose() {
    name.dispose();
    email.dispose();
    password.dispose();
    studentno.dispose();
    branch.dispose();
    section.dispose();
    year.dispose();
    super.dispose();
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
            child: BlocConsumer<AuthBloc, AuthState>(
              listener: (context, state){
                if(state.status == AuthStatus.error){
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(state.errorMessage ?? 'An error occurred'),
                      backgroundColor: Colors.red,
                    )
                  );
                }
                if(state.status == AuthStatus.registerSuccess){
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Account created! Please log in.'),
                      backgroundColor: Colors.green,
                    ),
                  );
                  widget.onLoginTap();
                }
              },
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

                        AuthTextField(
                          controller: name,
                          hint: "Full name",
                          validator: (v) => v == null || v.isEmpty ? "Required" : null,

                        ),
                        const SizedBox(height: 12),

                        AuthTextField(
                          controller: email,
                          hint: "Email",
                          validator: (v) => v == null || v.isEmpty ? "Required" : null,
                        ),
                        const SizedBox(height: 12),

                        AuthTextField(
                          controller: password,
                          hint: "Password",
                          isPassword: true,
                          validator: (v) => v == null || v.length < 6 ? "Min 6 chars" : null,
                        ),
                        const SizedBox(height: 12),

                        AuthTextField(
                          controller: studentno,
                          hint: "Student number",
                          keyboardType: TextInputType.number,
                          validator: (v) {
                            if (v == null || v.isEmpty) return "Required";
                            if (int.tryParse(v) == null) return "Must be a number";
                            return null;
                          }
                        ),
                        const SizedBox(height: 12),

                        AuthTextField(
                          controller: branch,
                          hint: "Branch",
                          validator: (v) => v == null || v.isEmpty ? "Required" : null,
                        ),
                        const SizedBox(height: 12),

                        AuthTextField(
                            controller: section,
                            hint: "Section",
                            validator: (v) => v == null || v.isEmpty ? "Required" : null
                        ),
                        const SizedBox(height: 12),

                        AuthTextField(
                          controller: year,
                          hint: "Year",
                          keyboardType: TextInputType.number,
                          validator: (v) {
                            if (v == null || v.isEmpty) return "Required";
                            if (int.tryParse(v) == null) return "Must be a number";
                            return null;
                          },
                        ),

                        const SizedBox(height: 24),

                        AuthButton(
                          text: "Sign Up",
                          isLoading: state.status == AuthStatus.loading,
                          onPressed: _signup,
                        ),

                        const SizedBox(height: 12,),

                        TextButton(
                            onPressed: widget.onLoginTap,
                            child: const Text(
                              "Already have an account? Sign in",
                              style: TextStyle(color: Colors.white),
                            )
                        )
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
