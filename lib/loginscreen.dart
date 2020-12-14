import 'package:flutter/material.dart';

import 'main.dart';

class LoginScreen extends StatefulWidget {
  @override
  LoginScreenState createState() => LoginScreenState();
}

class LoginScreenState extends State {
  TextEditingController _emailcontroller = TextEditingController();
  TextEditingController _passwordcontroller = TextEditingController();
  bool _isobscure = true;

  String email;
  String password;

  void buttonpressed() {
    email = _emailcontroller.text;
    password = _passwordcontroller.text;

    _emailcontroller.clear();
    _passwordcontroller.clear();
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => HomePage()));
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
                    hintText: 'Write your user name',
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
                      hintText: 'Write your password name',
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
              )
            ],
          )),
    );
  }
}
