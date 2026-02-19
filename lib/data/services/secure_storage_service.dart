import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SecureStorageService{
  static const _storage = FlutterSecureStorage();

  static const String _tokenKey = 'auth_token';
  static const String _nameKey = 'user_name';
  static const String _roleKey = 'user_role';

  Future<void> saveAuthData({
    required String token,
    required String name,
    required String role
}) async{
    await _storage.write(key: _tokenKey, value: token);
    await _storage.write(key: _nameKey, value: name);
    await _storage.write(key: _roleKey, value: role);
  }

  Future<String?> getToken() async{
    return await _storage.read(key: _tokenKey);
  }

  Future<Map<String, String?>> getUserData() async{
    final token = await _storage.read(key: _tokenKey);
    final name = await _storage.read(key: _nameKey);
    final role = await _storage.read(key: _roleKey);

    return{
      'token': token,
      'name': name,
      'role': role,
    };
  }

  Future<void> clearAuthData() async{
    await _storage.delete(key: _tokenKey);
    await _storage.delete(key: _nameKey);
    await _storage.delete(key: _roleKey);
  }

  Future<bool> hasToken() async{
    final token = await getToken();
    return token != null && token.isNotEmpty;
  }
}