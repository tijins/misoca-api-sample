// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_repository.dart';

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps,no_leading_underscores_for_local_identifiers

class _AuthService implements AuthService {
  _AuthService(
    this._dio, {
    this.baseUrl,
  }) {
    baseUrl ??= 'https://dev.misoca.jp';
  }

  final Dio _dio;

  String? baseUrl;

  @override
  Future<OauthToken> token(
    String credential,
    String requestType,
    String username,
    String password,
    String scope,
    String grantType,
  ) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{
      r'Authorization': credential,
      r'Request-Type': requestType,
    };
    _headers.removeWhere((k, v) => v == null);
    final _data = {
      'username': username,
      'password': password,
      'scope': scope,
      'grant_type': grantType,
    };
    final _result = await _dio
        .fetch<Map<String, dynamic>>(_setStreamType<OauthToken>(Options(
      method: 'POST',
      headers: _headers,
      extra: _extra,
      contentType: 'application/x-www-form-urlencoded',
    )
            .compose(
              _dio.options,
              '/oauth2/token',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = OauthToken.fromJson(_result.data!);
    return value;
  }

  @override
  Future<OauthToken> tokenFromCode(
    clientId,
    clientSecret,
    grantType,
    redirectUri,
    code,
  ) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = {
      'client_id': clientId,
      'client_secret': clientSecret,
      'grant_type': grantType,
      'redirect_uri': redirectUri,
      'code': code,
    };
    final _result = await _dio
        .fetch<Map<String, dynamic>>(_setStreamType<OauthToken>(Options(
      method: 'POST',
      headers: _headers,
      extra: _extra,
      contentType: 'application/x-www-form-urlencoded',
    )
            .compose(
              _dio.options,
              '/oauth2/token',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = OauthToken.fromJson(_result.data!);
    return value;
  }

  @override
  Future<OauthToken> refreshToken(
    String credentials,
    String requestType,
    String refreshToken,
    String grantType,
  ) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{
      r'Authorization': credentials,
      r'Request-Type': requestType,
    };
    _headers.removeWhere((k, v) => v == null);
    final _data = {
      'refresh_token': refreshToken,
      'grant_type': grantType,
    };
    final _result = await _dio
        .fetch<Map<String, dynamic>>(_setStreamType<OauthToken>(Options(
      method: 'POST',
      headers: _headers,
      extra: _extra,
      contentType: 'application/x-www-form-urlencoded',
    )
            .compose(
              _dio.options,
              '/oauth2/token',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = OauthToken.fromJson(_result.data!);
    return value;
  }

  RequestOptions _setStreamType<T>(RequestOptions requestOptions) {
    if (T != dynamic &&
        !(requestOptions.responseType == ResponseType.bytes ||
            requestOptions.responseType == ResponseType.stream)) {
      if (T == String) {
        requestOptions.responseType = ResponseType.plain;
      } else {
        requestOptions.responseType = ResponseType.json;
      }
    }
    return requestOptions;
  }
}
