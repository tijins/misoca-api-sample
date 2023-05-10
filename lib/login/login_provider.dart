import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:misoca_flutter/general/data/network_state.dart';

import '../general/data/user.dart';
import '../util/app_logger.dart';
import 'login_use_case.dart';

class LoginNotifier extends StateNotifier<NetworkState<User>> {
  LoginNotifier() : super(const NetworkState(status: NetworkStatus.idle));

  // エラーの表示期間
  static const _errorTime = 1000;

  final _useCase = LoginUseCase();

  void login(String email, String password) async {
    try {
      await _useCase.login(email, password);
      state = NetworkState(status: NetworkStatus.success);
    } on Exception catch (e) {
      logger.d(e);
      state = NetworkState(status: NetworkStatus.failed, error: e);
      await Future.delayed(const Duration(milliseconds: _errorTime));
      state = const NetworkState(status: NetworkStatus.idle);
    } catch (e) {
      logger.d(e);
    }
  }

  void loginWithCode(String code) async {
    try {
      await _useCase.loginWithCode(code);
      state = NetworkState(status: NetworkStatus.success);
    } on Exception catch (e) {
      logger.d(e);
      state = NetworkState(status: NetworkStatus.failed, error: e);
      await Future.delayed(const Duration(milliseconds: _errorTime));
      state = const NetworkState(status: NetworkStatus.idle);
    } catch (e) {
      logger.d(e);
    }
  }

  void authorizeWithCode() {
    _useCase.launchOauth2();
  }
}

final loginProvider = StateNotifierProvider<LoginNotifier, NetworkState<User>>((ref) => LoginNotifier());
