import 'package:examplify/core/errors/auth_exceptions.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'auth_event.dart';
import 'auth_state.dart';
import 'package:examplify/data/repositories/auth_repository.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState>{
  final AuthRepository _authRepository;

  AuthBloc({required AuthRepository authRepository}) :
        _authRepository = authRepository,
        super(const AuthState()) {
    on<LoginEvent>(_onLogin);
    on<RegisterEvent>(_onRegister);
    on<CheckAuthStatusEvent>(_onCheckAuthStatus);
    on<LogoutEvent>(_onLogout);
  }

  Future<void> _onLogin(LoginEvent event, Emitter<AuthState> emit) async{
    emit(state.copyWith(status: AuthStatus.loading));

    try{
      final user = await _authRepository.login(
        email: event.email,
        password: event.password
      );
      emit(state.copyWith(status: AuthStatus.loginSuccess, user: user));
    }on AuthException catch(e){
      emit(state.copyWith(
        status: AuthStatus.error,
        errorMessage: e.message
      ));
    }catch (e){
      emit(state.copyWith(
        status: AuthStatus.error,
        errorMessage: 'An unexpected error occured'
      ));
    }
  }

  Future<void> _onRegister(RegisterEvent event, Emitter<AuthState> emit) async{
    emit(state.copyWith(status: AuthStatus.loading));

    try{
      final registeredUser = await _authRepository.register(
          name: event.name,
          email: event.email,
          password: event.password,
          studentno: event.studentno,
          branch: event.branch,
          section: event.section,
          year: event.year
      );

      emit(state.copyWith(status: AuthStatus.registerSuccess, registerdUser: registeredUser));
    }on AuthException catch(e){
      emit(state.copyWith(
        status: AuthStatus.error,
        errorMessage: e.message
      ));
    }catch(e){
      emit(state.copyWith(
        status: AuthStatus.error,
        errorMessage: 'An unexpected error occurred'
      ));
    }
  }

  Future<void> _onCheckAuthStatus(
      CheckAuthStatusEvent event,
      Emitter<AuthState> emit
      ) async{
    emit(state.copyWith(status: AuthStatus.loading));

    try{
      final user = await _authRepository.checkAuthStatus();

      if(user != null){
        emit(state.copyWith(
          status: AuthStatus.loginSuccess,
          user: user
        ));
      }
      else{
        emit(state.copyWith(status: AuthStatus.initial));
      }
    }
    catch(e){
      emit(state.copyWith(status: AuthStatus.initial));
    }
  }

  Future<void> _onLogout(LogoutEvent event, Emitter<AuthState> emit) async{
    await _authRepository.logout();
    emit(const AuthState());
  }
}