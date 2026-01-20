import 'package:flutter_bloc/flutter_bloc.dart';
import 'auth_event.dart';
import 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState>{
  AuthBloc() : super(const AuthInitial()){
    on<LoginRequested>(_onLoginRequested);
    on<SignupRequested>(_onSignupRequested);
    on<LogoutRequested>(_onLogoutRequested);
  }


  Future<void> _onLoginRequested(
      LoginRequested event,
      Emitter<AuthState> emit,
  ) async{
    emit(const AuthLoading());

    await Future.delayed(const Duration(seconds: 1));

    if(event.email == 'test@test.com' && event.password == '123456'){
      emit(const AuthAuthenticated(userId: 'dummy_user_id'));
    }
    else{
      emit(const AuthError(message: 'Invalid email or password'));
      emit(const AuthUnauthenticated());
    }
  }


  Future<void> _onSignupRequested(
    SignupRequested event,
    Emitter<AuthState> emit,
  ) async{
    emit(const AuthLoading());

    await Future.delayed(const Duration(seconds: 1));

    emit(const AuthAuthenticated(userId: 'new_user_id'));
  }

  void _onLogoutRequested(
      LogoutRequested event,
      Emitter<AuthState> emit,
  ) {
    emit(const AuthUnauthenticated());
  }
}