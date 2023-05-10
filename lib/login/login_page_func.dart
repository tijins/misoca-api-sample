import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'login_provider.dart';

mixin LoginPageFunc {
  void loginWithPassword(WidgetRef ref, String email, String password) {
    ref.read(loginProvider.notifier).login(email, password);
  }

  void loginWithCode(WidgetRef ref) {
    ref.read(loginProvider.notifier).authorizeWithCode();
  }
}
