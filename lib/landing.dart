import 'package:flutter/cupertino.dart';
import 'package:hello/loginscreen.dart';
import 'package:hello/user.dart';
import 'package:provider/provider.dart';

import 'main.dart';

class Landing extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final MyUser user = Provider.of<MyUser>(context);
    final bool _islogged = user != null;
    if (_islogged)
      return HomePage();
    else
      return LoginScreen();
  }
}
