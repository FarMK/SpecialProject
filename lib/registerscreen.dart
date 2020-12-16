import 'package:flutter/material.dart';

class RegistrationScreen extends StatelessWidget {
  final TextEditingController _emailcontroller = TextEditingController();
  final TextEditingController _passwordcontroller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
    );
  }
}
