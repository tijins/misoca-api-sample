import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:misoca_flutter/general/data/network_state.dart';
import 'package:misoca_flutter/login/login_provider.dart';
import 'package:uni_links/uni_links.dart';

import '../document/invoice/invoice_detail_page.dart';
import '../document/invoice/invoice_list_page.dart';
import '../document/invoice/invoice_preview_page.dart';
import '../general/repository/token_repository.dart';
import '../login/login_page.dart';
import '../style/app_color.dart';
import '../style/app_theme.dart';
import '../util/app_logger.dart';

class MainApp extends ConsumerStatefulWidget {
  const MainApp({Key? key}) : super(key: key);

  @override
  ConsumerState<MainApp> createState() => _MainAppState();
}

class _MainAppState extends ConsumerState<MainApp> {
  bool _initialUriIsHandled = false;
  StreamSubscription? _sub;

  @override
  void initState() {
    super.initState();
    _handleIncomingLinks();
    _handleInitialUri();
    ref.read(initAppProvider.notifier).init();
  }

  @override
  Widget build(BuildContext context) {
    final token = ref.watch(initAppProvider);
    if (token == null) {
      return Container(color: AppColor.secondaryColors.shade100);
    } else {
      Widget home;
      ref.listen(loginProvider, (previous, next) {
        if (next.status == NetworkStatus.success) {
          Navigator.of(context).pushReplacementNamed(InvoiceListPage.routeName);
        }
      });
      if (token.accessToken.isNotEmpty) {
        home = InvoiceListPage();
      } else {
        home = LoginPage();
      }
      return MaterialApp(
          title: 'Flutter Demo',
          theme: appTheme,
          routes: {
            LoginPage.routeName: (BuildContext context) => LoginPage(),
            InvoiceListPage.routeName: (BuildContext context) => InvoiceListPage(),
            InvoiceDetailPage.routeName: (BuildContext context) => InvoiceDetailPage(),
            InvoicePreviewPage.routeName: (BuildContext context) => InvoicePreviewPage(),
          },
          home: home);
    }
  }

  void _handleExternalUri(Uri? uri) {
    if (uri != null) {
      if (uri.path == "/oauth2/callback" && uri.queryParameters.containsKey("code")) {
        final code = uri.queryParameters["code"]!;
        ref.read(loginProvider.notifier).loginWithCode(code);
      }
    }
  }

  void _handleIncomingLinks() {
    _sub = uriLinkStream.listen((Uri? uri) {
      if (!mounted) return;
      logger.d('got uri: $uri');
      _handleExternalUri(uri);
    }, onError: (Object err) {
      if (!mounted) return;
      logger.e('got err: $err');
    });
  }

  Future<void> _handleInitialUri() async {
    if (!_initialUriIsHandled) {
      _initialUriIsHandled = true;
      try {
        final uri = await getInitialUri();
        if (uri == null) {
          logger.d('no initial uri');
        } else {
          logger.d('initial $uri');
          _handleExternalUri(uri);
        }
      } on PlatformException catch (e) {
        logger.d(e);
      } on FormatException catch (e) {
        logger.d(e);
      }
    }
  }
}

class InitAppNotifier extends StateNotifier<TokenRepository?> {
  InitAppNotifier() : super(null);

  void init() async {
    final tokenRepo = TokenRepository();
    await tokenRepo.load();
    state = tokenRepo;
  }
}

final initAppProvider = StateNotifierProvider<InitAppNotifier, TokenRepository?>((ref) => InitAppNotifier());
