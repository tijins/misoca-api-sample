import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:misoca_flutter/document/invoice/invoice_list_page.dart';
import 'package:misoca_flutter/general/data/network_state.dart';
import 'package:misoca_flutter/login/login_page_func.dart';

import 'login_provider.dart';

class LoginPage extends ConsumerStatefulWidget {
  static const routeName = "/login";

  const LoginPage({Key? key}) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() {
    return LoginPageState();
  }
}

class LoginPageState extends ConsumerState with LoginPageFunc {
  late TextEditingController _emailController;
  late TextEditingController _passwordIdController;
  bool _visiblePassword = false;
  Exception? lastError;

  @override
  void initState() {
    super.initState();
    _emailController = TextEditingController(text: "");
    _passwordIdController = TextEditingController(text: "");
  }

  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _passwordIdController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    ref.listen(loginProvider, (previous, next) {
      if (next.status == NetworkStatus.success) {
        WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
          await Navigator.of(context).pushReplacementNamed(InvoiceListPage.routeName);
        });
      } else if (next.status == NetworkStatus.failed) {
        showError(context, next.error!);
      }
    });
    var loginCard = Card(
        child: Padding(
            padding: const EdgeInsets.all(8),
            child: LayoutBuilder(builder: (context, constraints) {
              return Column(children: [
                TextFormField(
                  controller: _emailController,
                  keyboardType: TextInputType.emailAddress,
                  maxLines: null,
                  decoration: const InputDecoration(
                    border: UnderlineInputBorder(),
                    contentPadding: EdgeInsets.all(0),
                    hintText: 'メールアドレス',
                    labelText: 'メールアドレス',
                  ),
                ),
                Container(
                  height: 8,
                ),
                TextFormField(
                    controller: _passwordIdController,
                    obscureText: _visiblePassword,
                    keyboardType: TextInputType.visiblePassword,
                    decoration: InputDecoration(
                        border: const UnderlineInputBorder(),
                        contentPadding: const EdgeInsets.all(0),
                        hintText: 'パスワード',
                        labelText: 'パスワード',
                        suffixIcon: IconButton(
                          icon: Icon(_visiblePassword ? Icons.visibility : Icons.visibility_off),
                          onPressed: () {
                            setState(() {
                              _visiblePassword = !_visiblePassword;
                            });
                          },
                        ))),
                Container(
                  height: 8,
                ),
                Container(
                    margin: EdgeInsets.symmetric(vertical: 8),
                    child: ElevatedButton(
                        onPressed: () {
                          loginWithPassword(ref, _emailController.text, _passwordIdController.text);
                        },
                        child: const Text(
                          "ログイン",
                        ))),
                Container(
                  margin: EdgeInsets.symmetric(vertical: 8),
                  child: ElevatedButton(
                      onPressed: () {
                        loginWithCode(ref);
                      },
                      child: const Text(
                        "OAuth2認証",
                      )),
                )
              ]);
            })));
    return Scaffold(
      appBar: AppBar(
// Here we take the value from the MyHomePage object that was created by
// the App.build method, and use it to set our appbar title.
        title: const Text("ログイン"),
      ),
      body: loginCard,
    );
  }

  void showError(BuildContext context, Exception e) {
    if (lastError != e) {
      lastError = e;
      SchedulerBinding.instance.addPostFrameCallback((timeStamp) {
        var snackBar = SnackBar(content: Text(e.toString()));
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
      });
    }
  }
}
