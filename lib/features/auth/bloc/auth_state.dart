import 'package:equatable/equatable.dart';
import 'package:examplify/models/registered_user.dart';
import '../../../models/user.dart';

enum AuthStatus {initial, loading, loginSuccess, registerSuccess, error}

class AuthState extends Equatable{
  final AuthStatus status;
  final User? user;
  final RegisterdUser? registerdUser;
  final String? errorMessage;

  const AuthState({
    this.status = AuthStatus.initial,
    this.user,
    this.registerdUser,
    this.errorMessage
});

  AuthState copyWith({
    AuthStatus? status,
    User? user,
    RegisterdUser? registerdUser,
    String? errorMessage
  }) {
    return AuthState(
      status: status ?? this.status,
      user: user ?? this.user,
      registerdUser: registerdUser ?? this.registerdUser,
      errorMessage: errorMessage ?? this.errorMessage
    );
  }

  @override
  // TODO: implement props
  List<Object?> get props => [status, user, registerdUser, errorMessage];
}