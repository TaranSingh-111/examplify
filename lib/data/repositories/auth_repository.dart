import 'dart:io';

import 'package:examplify/core/errors/auth_exceptions.dart';
import 'package:examplify/data/services/auth_api_service.dart';
import 'package:examplify/data/services/secure_storage_service.dart';
import 'package:examplify/features/auth/models/login_request.dart';
import 'package:examplify/features/auth/models/register_request.dart';
import 'package:examplify/models/registered_user.dart';

import '../../models/user.dart';

class AuthRepository{
  final AuthApiService _apiService;
  final SecureStorageService _storageService;

  AuthRepository({AuthApiService? apiService, SecureStorageService? secureService}) :
      _apiService = apiService ?? AuthApiService(),
      _storageService = secureService ?? SecureStorageService();

  Future<User> login({
    required String email,
    required String password,
}) async{
    try{
      final request = LoginRequest(email: email, password: password);
      final response = await _apiService.login(request);

      await _storageService.saveAuthData(
          token: response.data.token,
          name: response.data.name,
          role: response.data.role
      );

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


  Future<User?> checkAuthStatus() async{
    try{
      final userData = await _storageService.getUserData();
      if(userData['token'] != null &&
        userData['name'] != null &&
        userData['role'] != null){
        return User(
          token: userData['token']!,
          name: userData['name']!,
          role: userData['role']!
        );
      }
      return null;
    } catch(e){
      return null;
    }
  }

  Future<void> logout() async{
    await _storageService.clearAuthData();
  }
}