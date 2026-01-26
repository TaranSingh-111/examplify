import 'package:examplify/data/services/api_auth_service.dart';
import 'package:jwt_decode/jwt_decode.dart';


class AuthRepository{
  final ApiAuthService _apiAuthService;

  AuthRepository({required ApiAuthService apiAuthService}):
      _apiAuthService = apiAuthService;

  String? _cachedUserId;
  String? _cachedToken;


  Future<String> signUp({
    required String email,
    required String password,
    required String name,
    required int studentNo,
    required String branch,
    required String section,
    required int year,
  }) async{
      final response = await _apiAuthService.signup(
          email: email,
          password: password,
          name: name,
          studentNo: studentNo,
          branch: branch,
          section: section,
          year: year,
      );

      final data = response['data'];
      final userId = data['id'] as String;

      _cachedUserId = userId;
      return userId;
  }



  Future<String> login({
    required String email,
    required String password,
  }) async{
    final response = await _apiAuthService.login(
      email: email,
      password: password
    );

    final token = response['data']['token'] as String;

    final decodedToken = Jwt.parseJwt(token);
    final userId = decodedToken['_id'] as String;

    _cachedUserId = userId;
    _cachedToken = token;
    return userId;
  }



  Future<void> logout() async{

  }

  String? get currentUserId => _cachedUserId;
}
