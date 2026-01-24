import 'package:equatable/equatable.dart';

abstract class AuthEvent extends Equatable{

  const AuthEvent();

  @override
  List<Object?> get props => [];
}


class LoginRequested extends AuthEvent{

  final String email;
  final String password;

  const LoginRequested({
    required this.email,
    required this.password,
  });

  @override
  List<Object?> get props => [email, password];
}


class SignupRequested extends AuthEvent{
  final String email;
  final String password;
  final String name;
  final int studentNo;
  final String branch;
  final String section;
  final int year;

  const SignupRequested({
    required this.email,
    required this.password,
    required this.name,
    required this.studentNo,
    required this.branch,
    required this.section,
    required this.year
  });

  @override
  List<Object?> get props => [
    email,
    password,
    name,
    studentNo,
    branch,
    section,
    year,
  ];
}


class AppStarted extends AuthEvent{
  const AppStarted();
}


class LogoutRequested extends AuthEvent{
  const LogoutRequested();
}