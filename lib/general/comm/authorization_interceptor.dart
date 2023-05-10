import 'package:dio/dio.dart';

import '../../util/app_logger.dart';
import '../repository/auth_repository.dart';
import '../repository/token_repository.dart';

class AuthorizationInterceptor extends Interceptor {
  static const int _AUTH_ERR_CODE = 401;
  static const _RETRY_HEADER = "X-Misoca-Retry";
  static const _AUTHORIZATION = "Authorization";
  final Dio _dio;
  final TokenRepository _token;

  AuthorizationInterceptor(this._dio, this._token);

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    super.onRequest(options, handler);
    options.headers[_AUTHORIZATION] = "Bearer ${_token.accessToken}";
  }

  @override
  void onError(DioError err, ErrorInterceptorHandler handler) async {
    logger.d("onError (${err.response?.statusCode})");
    var retry = err.requestOptions.headers[_RETRY_HEADER];
    if (err.response?.statusCode == _AUTH_ERR_CODE && retry == null) {
      if (_token.refreshToken.isNotEmpty) {
        try {
          await _refreshToken();
          var retryResult = await _retry(err.requestOptions);
          handler.resolve(retryResult);
        } on DioError catch (e) {
          handler.reject(e);
        } catch (e) {
          handler.reject(err);
        }
      } else {
        handler.reject(err);
      }
    } else {
      handler.next(err);
    }
  }

  Future<void> _refreshToken() async {
    //Interceptorは使用しないので、別のDioクライアントを使用する
    var authRepository = AuthRepository();
    var credentials = authRepository.getCredentials();
    var oauth = await authRepository.refreshToken(credentials, _token.refreshToken);
    _token.accessToken = oauth.accessToken;
    _token.refreshToken = oauth.refreshToken;
    await _token.save();
  }

  Future<Response<dynamic>> _retry(RequestOptions prevOptions) async {
    // Authorizationヘッダーはリクエスト時のInterceptorで再設定される為、新しいtokenに差し替え不要
    final options = Options(
        method: prevOptions.method,
        headers: prevOptions.headers,
        receiveDataWhenStatusError: prevOptions.receiveDataWhenStatusError,
        responseType: prevOptions.responseType);
    options.headers![_RETRY_HEADER] = "true";
    return _dio.request(prevOptions.path,
        data: prevOptions.data, queryParameters: prevOptions.queryParameters, options: options);
  }
}
