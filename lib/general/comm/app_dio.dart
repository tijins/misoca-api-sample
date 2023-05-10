import 'package:dio/dio.dart';
import 'package:misoca_flutter/general/repository/token_repository.dart';

import '../../config/app_config.dart';
import 'authorization_interceptor.dart';

class AppDio {
  static Dio? _dio;

  static Dio getClient() {
    if (_dio != null) {
      return _dio!;
    }
    final tokenRepository = TokenRepository();
    var options = BaseOptions(baseUrl: Uri(scheme: AppConfig.SCHEME, host: AppConfig.HOST).toString());
    _dio = Dio(options);
    _dio!.interceptors.addAll([AuthorizationInterceptor(_dio!, tokenRepository)]);
    return _dio!;
  }
}
