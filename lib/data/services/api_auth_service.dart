import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiAuthService{
  final String baseUrl;
  final Map<String, String> defaultHeaders;

  ApiAuthService({
    required this.baseUrl,
    required this.defaultHeaders
});



  Future<Map<String,dynamic>> login({
    required String email,
    required String password,
}) async{
    final response = await http.post(
      Uri.parse('$baseUrl/login'),
      headers: {
        'Content-Type': 'application/json; charset=utf-8',
        ...defaultHeaders,
      },
      body: jsonEncode({
        'email': email,
        'password': password
      })
    );

    if(response.statusCode != 200){
      throw Exception('Login Failed');
    }

    return jsonDecode(response.body);
  }



  Future<Map<String, dynamic>> signup({
    required String name,
    required String email,
    required String password,
    required int studentNo,
    required String branch,
    required String section,
    required int year,
}) async{
    final response = await http.post(
      Uri.parse('$baseUrl/register'),
      headers: {
        'Content-Type' : 'application/json',
        ...defaultHeaders
      },
      body: jsonEncode({
        'name': name,
        'email': email,
        'password': password,
        'studentno': studentNo,
        'branch': branch,
        'section': section,
        'year': year,
      })
    );

    if (response.statusCode == 200 || response.statusCode == 201) {
      return jsonDecode(response.body);
    }

    if(response.statusCode == 400){
      final body = jsonDecode(response.body);
      throw Exception(body['message'] ?? 'Invalid signup data');
    }
    throw Exception(
      'Signup failed (${response.statusCode}): ${response.body}',
    );

  }
}