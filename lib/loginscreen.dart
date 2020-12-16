import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hello/authServices.dart';
import 'package:hello/registerscreen.dart';

import 'main.dart';
import 'user.dart';

class LoginScreen extends StatefulWidget {
  @override
  LoginScreenState createState() => LoginScreenState();
}

class LoginScreenState extends State {
  TextEditingController _emailcontroller = TextEditingController();
  TextEditingController _passwordcontroller = TextEditingController();
  bool _isobscure = true;

  AuthServices _authcreation = AuthServices();

  String email;
  String password;

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

  void buttonpressed() async {
    email = _emailcontroller.text;
    password = _passwordcontroller.text;
    if (email.isEmpty || password.isEmpty) return;

    MyUser user = await _authcreation.loginwithEmailandPassword(
        email.trim(), password.trim());
    if (user == null) {
      errorInfo('check your email/password');
    } else {
      _emailcontroller.clear();
      _passwordcontroller.clear();
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => HomePage()));
    }
  }

  void changePrivacy() {
    setState(() {
      if (_isobscure)
        _isobscure = false;
      else
        _isobscure = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          color: Colors.blue,
          padding: EdgeInsets.only(top: 30, bottom: 30, left: 20, right: 20),
          width: double.infinity,
          height: double.infinity,
          alignment: Alignment.center,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('ShopNow',
                  style: TextStyle(fontSize: 40, color: Colors.white)),
              Container(
                margin: EdgeInsets.symmetric(vertical: 30),
                padding: EdgeInsets.symmetric(horizontal: 20),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(30),
                ),
                child: TextField(
                  controller: _emailcontroller,
                  decoration: InputDecoration(
                    labelText: 'EMAIL',
                    hintText: 'Write your email',
                    prefixIcon: Icon(Icons.email),
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 20),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(30),
                ),
                child: TextField(
                  obscureText: _isobscure,
                  controller: _passwordcontroller,
                  decoration: InputDecoration(
                      labelText: 'PASSWORD',
                      hintText: 'Write your password',
                      prefixIcon: Icon(Icons.lock),
                      suffixIcon: IconButton(
                        icon: Icon(_isobscure
                            ? Icons.privacy_tip
                            : Icons.remove_red_eye),
                        onPressed: () {
                          changePrivacy();
                        },
                      )),
                ),
              ),
              InkWell(
                onTap: () {
                  buttonpressed();
                },
                child: Container(
                  alignment: Alignment.center,
                  width: 150,
                  margin: EdgeInsets.only(top: 60),
                  padding: EdgeInsets.all(13),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Text('LOGIN',
                      style: TextStyle(
                        fontSize: 25,
                      )),
                ),
              ),
              SizedBox(height: 20),
              InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => RegistrationScreen()));
                },
                child: Text('create an account?',
                    style: TextStyle(color: Colors.white, fontSize: 20)),
              )
            ],
          )),
    );
  }
}
