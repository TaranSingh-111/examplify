import 'package:flutter_bloc/flutter_bloc.dart';
import 'auth_event.dart';
import 'auth_state.dart';
import 'package:examplify/data/repositories/auth_repository.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState>{
  final AuthRepository _authRepository;

  AuthBloc({required AuthRepository authRepository}) :
        _authRepository = authRepository,
        super(const AuthInitial()){
    on<LoginRequested>(_onLoginRequested);
    on<SignupRequested>(_onSignupRequested);
    on<LogoutRequested>(_onLogoutRequested);
  }



  Future<void> _onLoginRequested(
      LoginRequested event,
      Emitter<AuthState> emit,
  ) async{
    emit(const AuthLoading());

    try{
      final userId = await _authRepository.login(
          email: event.email,
          password: event.password,
      );
      emit(AuthAuthenticated(userId: userId));
    }catch (e){
      emit(AuthError(message: e.toString()));
      emit(const AuthUnauthenticated());
    }
  }



  Future<void> _onSignupRequested(
    SignupRequested event,
    Emitter<AuthState> emit,
  ) async{
    emit(const AuthLoading());

    try{
      final userId = await _authRepository.signUp(
          email: event.email,
          password: event.password
      );
      emit(AuthAuthenticated(userId: userId));
    } catch (e){
      emit(AuthError(message: e.toString()));
      emit(const AuthUnauthenticated());
    }
  }



  Future<void> _onLogoutRequested(
      LogoutRequested event,
      Emitter<AuthState> emit,
  ) async{
    await _authRepository.logout();
    emit(const AuthUnauthenticated());
  }
}