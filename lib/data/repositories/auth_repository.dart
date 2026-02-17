import 'package:examplify/core/errors/auth_exceptions.dart';
import 'package:examplify/data/services/auth_api_service.dart';
import 'package:examplify/features/auth/models/login_request.dart';
import 'package:examplify/features/auth/models/register_request.dart';
import 'package:examplify/models/registered_user.dart';

import '../../models/user.dart';

class AuthRepository{
  final AuthApiService _apiService;

  AuthRepository({AuthApiService? apiService}) :
      _apiService = apiService ?? AuthApiService();

  Future<User> login({
    required String email,
    required String password,
}) async{
    try{
      final request = LoginRequest(email: email, password: password);
      final response = await _apiService.login(request);

      return User(
        name: response.data.name,
        token: response.data.token,
        role: response.data.role
      );
    }
    on Exception catch(e){
      throw AuthException(e.toString().replaceAll('Exception:', ''));
    }
    catch(e){
      throw AuthException('An unexpected error occured during login');
    }
  }

  Future<RegisterdUser> register({
    required String name,
    required String email,
    required String password,
    required int studentno,
    required String branch,
    required String section,
    required int year
}) async{
    try{
      final request = RegisterRequest(
          name: name,
          email: email,
          password: password,
          studentno: studentno,
          branch: branch,
          section: section,
          year: year
      );
      final response = await _apiService.register(request);

      return RegisterdUser(
          id: response.data.id,
          email: response.data.email,
          role: response.data.role,
      );
    }
    on Exception catch(e){
      throw AuthException(e.toString().replaceAll('Exception:', ''));
    }
    catch (e){
      throw AuthException('An unexpected error occured during registration');
    }
  }
}