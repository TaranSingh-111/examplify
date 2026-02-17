import 'dart:convert';
import 'package:examplify/core/constants/api_constants.dart';
import 'package:examplify/features/auth/models/api_error.dart';
import 'package:examplify/features/auth/models/login_request.dart';
import 'package:examplify/features/auth/models/login_response.dart';
import 'package:examplify/features/auth/models/register_request.dart';
import 'package:examplify/features/auth/models/register_response.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;

class AuthApiService{
  Future<LoginResponse> login(LoginRequest request) async{
    try{
      final response = await http.post(
        Uri.parse(ApiConstants.loginUrl),
        headers: {'Content-Type' : 'application/json'},
        body: jsonEncode(request.toJson())
      );

      final jsonResponse = jsonDecode(response.body);

      if(response.statusCode == 200 && jsonResponse['success'] == true){
        return LoginResponse.fromJson(jsonResponse);
      }else{
        final error = ApiError.fromJson(jsonResponse);
        throw Exception(error.message);
      }

    }
    catch(e){
      throw Exception('Login Failed: ${e.toString()}');
    }
  }

  Future<RegisterResponse> register(RegisterRequest request) async{
    try{
      final response = await http.post(
        Uri.parse(ApiConstants.registerUrl),
        headers: {'Content-Type' : 'application/json'},
        body: jsonEncode(request.toJson())
      );

      final jsonResponse = jsonDecode(response.body);

      if(response.statusCode == 201 && jsonResponse['success'] == true){
        return RegisterResponse.fromJson(jsonResponse);
      }else{
        final error = ApiError.fromJson(jsonResponse);
        throw Exception(error.message);
      }
    }
    catch(e){
      throw Exception('Registration Failed : ${e.toString()}');
    }
  }
}