import 'package:shared_preferences/shared_preferences.dart';

import '../../util/app_logger.dart';

class TokenRepository {
  // シングルトン初期化用
  TokenRepository._internal();

  String accessToken = "";
  String refreshToken = "";

  static const _accessTokenKey = "access_token";
  static const _refreshTokenKey = "refresh_token";
  static TokenRepository _instance = TokenRepository._internal();

  Future<void> save() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_accessTokenKey, accessToken);
    await prefs.setString(_refreshTokenKey, refreshToken);
  }

  Future<void> load() async {
    final prefs = await SharedPreferences.getInstance();
    accessToken = prefs.getString(_accessTokenKey) ?? "";
    refreshToken = prefs.getString(_refreshTokenKey) ?? "";
    logger.d("accessToken:$accessToken");
  }

  void clear() {
    accessToken = "";
    refreshToken = "";
    save();
  }

  factory TokenRepository() {
    return _instance;
  }
}
