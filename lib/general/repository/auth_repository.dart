import 'dart:convert';

import 'package:dio/dio.dart' hide Headers;
import 'package:misoca_flutter/config/app_config.dart';
import 'package:retrofit/http.dart';

import '../data/oauth_token.dart';

part 'auth_repository.g.dart';

abstract class AuthService {
  factory AuthService(Dio dio, {String baseUrl}) = _AuthService;

  @POST("/oauth2/token")
  @FormUrlEncoded()
  Future<OauthToken> token(
      @Header("Authorization") String credential,
      @Header("Request-Type") String requestType,
      @Field("username") String username,
      @Field("password") String password,
      @Field("scope") String scope,
      @Field("grant_type") String grantType);

  @POST("/oauth2/token")
  @FormUrlEncoded()
  Future<OauthToken> tokenFromCode(
    @Field("client_id") String clientId,
    @Field("client_secret") String clientSecret,
    @Field("grant_type") String grantType,
    @Field("redirect_uri") String redirectUri,
    @Field("code") String code,
  );

  @POST("/oauth2/token")
  @FormUrlEncoded()
  Future<OauthToken> refreshToken(@Header("Authorization") String credentials, @Header("Request-Type") String requestType,
      @Field("refresh_token") String refreshToken, @Field("grant_type") String grantType);
}

class AuthRepository {
  final AuthService _service;

  // password flow
  static const String _REQUEST_TYPE_LOGIN = "login";
  static const String _GRANT_TYPE_PASSWORD = "password";

  // code implicit flow
  static const String _GRANT_TYPE_CODE = "authorization_code";

  // refresh
  static const String _REQUEST_TYPE_REFRESH = "refresh";
  static const String _GRANT_TYPE_REFRESH = "refresh_token";
  static const String _SCOPE = "write";

  AuthRepository([AuthService? service]) : _service = service ?? AuthService(Dio());

  String getCredentials() {
    var pair = "${AppConfig.CLIENT_ID}:${AppConfig.CLIENT_SECRET}";
    var encoded = utf8.encode(pair);
    return "Basic ${base64.encode(encoded)}";
  }

  Future<OauthToken> authorize(String credentials, String useName, String password) {
    return _service.token(credentials, _REQUEST_TYPE_LOGIN, useName, password, _SCOPE, _GRANT_TYPE_PASSWORD);
  }

  Future<OauthToken> tokenFromCode(String code) {
    return _service.tokenFromCode(AppConfig.CLIENT_ID, AppConfig.CLIENT_SECRET, _GRANT_TYPE_CODE, AppConfig.REDIRECT_URI, code);
  }

  Future<OauthToken> refreshToken(String credentials, String refreshToken) {
    return _service.refreshToken(credentials, _REQUEST_TYPE_REFRESH, refreshToken, _GRANT_TYPE_REFRESH);
  }

  Uri getAuthorizeUrl() {
    var uri = Uri(scheme: AppConfig.SCHEME, host: AppConfig.HOST, path: "/oauth2/authorize", queryParameters: {
      "response_type": "code",
      "client_id": AppConfig.CLIENT_ID,
      "redirect_uri": AppConfig.REDIRECT_URI,
      "scope": "write"
    });
    return uri;
  }
}
