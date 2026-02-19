class LoginResponse{
  final int statusCode;
  final LoginData data;
  final String message;
  final bool success;

  LoginResponse({
    required this.statusCode,
    required this.data,
    required this.message,
    required this.success
});

  factory LoginResponse.fromJson(Map<String, dynamic> json){
   return LoginResponse(
       statusCode: json['statusCode'],
       data: LoginData.fromJson(json['data']),
       message: json['message'],
       success: json['success']
   );
  }
}

class LoginData{
  final String token;
  final String name;
  final String role;

  LoginData({
    required this.token,
    required this.name,
    required this.role,
});

  factory LoginData.fromJson(Map<String, dynamic> json){
    return LoginData(
        token: json['token'],
        name: json['name'],
        role: json['role']
    );
  }
}