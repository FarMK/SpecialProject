import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hello/authServices.dart';
import 'package:hello/user.dart';

import 'loginscreen.dart';
import 'main.dart';

class RegistrationScreen extends StatelessWidget {
  final TextEditingController _emailcontroller = TextEditingController();
  final TextEditingController _passwordcontroller = TextEditingController();

  Future errorInfo(String text) {
    return Fluttertoast.showToast(
        msg: text,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0);
  }

  AuthServices _authcreation = AuthServices();
  String password;
  String email;

  void _buttonpressed() async {
    email = _emailcontroller.text;
    password = _passwordcontroller.text;
    if (email.isEmpty || password.isEmpty) return;

    MyUser user = await _authcreation.registerwithEmailandPassword(
        email.trim(), password.trim());
    if (user == null) {
      errorInfo('check your email/password');
    } else {
      _emailcontroller.clear();
      _passwordcontroller.clear();
    }
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () => Future.value(true),
      child: Scaffold(
        body: Container(
          width: double.infinity,
          height: double.infinity,
          color: Colors.blue,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Create your account',
                style: TextStyle(fontSize: 30, color: Colors.white),
              ),
              Container(
                margin: EdgeInsets.all(20),
                padding: EdgeInsets.symmetric(horizontal: 20),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(30),
                ),
                child: TextField(
                  controller: _emailcontroller,
                  decoration: InputDecoration(
                    labelText: 'EMAIL',
                    hintText: 'write your email adress',
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.all(20),
                padding: EdgeInsets.symmetric(horizontal: 20),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(30),
                ),
                child: TextField(
                  controller: _passwordcontroller,
                  decoration: InputDecoration(
                    labelText: 'PASSWORD',
                    hintText: 'write your password',
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  _buttonpressed();
                  Navigator.pop(context, false);
                },
                child: Container(
                  alignment: Alignment.center,
                  width: 150,
                  margin: EdgeInsets.only(top: 30),
                  padding: EdgeInsets.all(13),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Text('REGISTER',
                      style: TextStyle(
                        fontSize: 25,
                      )),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
