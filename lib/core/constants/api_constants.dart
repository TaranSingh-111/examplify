
import 'package:flutter_dotenv/flutter_dotenv.dart';

class ApiConstants{
  static String baseUrl = dotenv.env['BASE_URL'] ?? '';

  static String get loginUrl => '$baseUrl/login';
  static String get registerUrl => '$baseUrl/register';
}