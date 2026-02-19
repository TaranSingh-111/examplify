import 'package:equatable/equatable.dart';

abstract class AuthEvent extends Equatable{
  const AuthEvent();
}

class LoginEvent extends AuthEvent{
  final String email;
  final String password;

  const LoginEvent({
    required this.email,
    required this.password
});

  @override
  // TODO: implement props
  List<Object?> get props => [email, password];
}


class RegisterEvent extends AuthEvent{
  final String name;
  final String email;
  final String password;
  final int studentno;
  final String branch;
  final String section;
  final int year;

  RegisterEvent({
    required this.name,
    required this.email,
    required this.password,
    required this.studentno,
    required this.branch,
    required this.section,
    required this.year,
  });

  @override
  // TODO: implement props
  List<Object?> get props => [name, email, password, studentno, branch, section, year];
}

class CheckAuthStatusEvent extends AuthEvent{
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class LogoutEvent extends AuthEvent{
  @override
  // TODO: implement props
  List<Object?> get props => [];
}