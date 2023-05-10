import 'package:misoca_flutter/general/data/oauth_token.dart';
import 'package:url_launcher/url_launcher.dart';

import '../general/repository/auth_repository.dart';
import '../general/repository/token_repository.dart';
import '../util/app_logger.dart';

class LoginUseCase {
  Future<OauthToken> login(String email, String password) async {
    var repository = AuthRepository();
    var oauth = await repository.authorize(repository.getCredentials(), email, password);
    final tokenRepository = TokenRepository();
    tokenRepository.refreshToken = oauth.refreshToken;
    tokenRepository.accessToken = oauth.accessToken;
    tokenRepository.save();
    return oauth;
  }

  Future<OauthToken> loginWithCode(String code) async {
    var repository = AuthRepository();
    var oauth = await repository.tokenFromCode(code);
    final tokenRepository = TokenRepository();
    tokenRepository.refreshToken = oauth.refreshToken;
    tokenRepository.accessToken = oauth.accessToken;
    tokenRepository.save();
    return oauth;
  }

  void logout() {
    final tokenRepository = TokenRepository();
    tokenRepository.accessToken = "";
    tokenRepository.refreshToken = "";
    tokenRepository.save();
  }

  void launchOauth2() {
    final url = AuthRepository().getAuthorizeUrl();
    logger.d("launch browser:$url");
    launchUrl(url, mode: LaunchMode.externalApplication);
  }
}
