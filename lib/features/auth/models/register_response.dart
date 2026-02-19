class RegisterResponse{
  final int statusCode;
  final RegisterData data;
  final String message;
  final bool success;

  RegisterResponse({
    required this.statusCode,
    required this.data,
    required this.message,
    required this.success,
});
  
  factory RegisterResponse.fromJson(Map<String, dynamic> json){
    return RegisterResponse(
        statusCode: json['statusCode'],
        data: RegisterData.fromJson(json['data']),
        message: json['message'],
        success: json['success']
    );
  }
}

class RegisterData{
  final String id;
  final String email;
  final String role;
  
  RegisterData({
    required this.id,
    required this.email,
    required this.role,
});
  
  factory RegisterData.fromJson(Map<String, dynamic> json){
    return RegisterData(id: 'id', email: 'email', role: 'role');
  }
}