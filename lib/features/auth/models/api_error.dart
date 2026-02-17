class ApiError{
  final bool success;
  final String message;
  final List<dynamic> errors;

  ApiError({required this.success, required this.message, required this.errors});

  factory ApiError.fromJson(Map<String, dynamic> json){
    return ApiError(
        success: json['success'] ?? false,
        message: json['message'] ?? 'An error occured',
        errors: json['errors'] ?? []
    );
  }
}