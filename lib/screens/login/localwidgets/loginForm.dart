import 'dart:ui';

import 'package:book_reader/screens/home/home.dart';
import 'package:book_reader/screens/singup/signup.dart';
import 'package:book_reader/states/currentUser.dart';
import 'package:book_reader/widgets/ourContainer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

enum LoginType {
  email,
  google,
}

class OurLoginForm extends StatefulWidget {
  @override
  State<OurLoginForm> createState() => _OurLoginFormState();
}

class _OurLoginFormState extends State<OurLoginForm> {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  void _loginUser({
    required LoginType type,
    String? email,
    String? password,
    BuildContext? context,
  }) async {
    CurrentUser _currentUser =
        Provider.of<CurrentUser>(context!, listen: false);

    try {
      String? _returnString;
      switch (type) {
        case LoginType.email:
          _returnString = await _currentUser.loginUser(email!, password!);
          break;
        case LoginType.google:
          _returnString = await _currentUser.loginUserWithGoogle();
          break;
        default:
      }

      if (_returnString == "success") {
        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (context) => HomeScreen()),
            (route) => false);
      } else {
        Scaffold.of(context).showSnackBar(SnackBar(
          content: Text(_returnString!),
          duration: Duration(seconds: 2),
        ));
      }
    } catch (e) {
      print(e);
    }
  }

  Widget _googleButton() {
    return OutlineButton(
      splashColor: Colors.grey,
      onPressed: () {
        _loginUser(type: LoginType.google, context: context);
      },
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)),
      highlightElevation: 0,
      borderSide: BorderSide(color: Colors.grey),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image(image: AssetImage("images/google.png"), height: 25.0),
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Text(
                'Sign in with Google',
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.grey,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return OurContainer(
        child: Column(
      children: <Widget>[
        Padding(
          padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 8.0),
          child: Text(
            'Log In',
            style: TextStyle(
                color: Theme.of(context).primaryColor,
                fontSize: 25.0,
                fontWeight: FontWeight.bold),
          ),
        ),
        TextFormField(
          controller: _emailController,
          decoration: InputDecoration(
              prefixIcon: Icon(Icons.alternate_email), hintText: "Email"),
        ),
        SizedBox(
          height: 20.0,
        ),
        TextFormField(
          controller: _passwordController,
          decoration: InputDecoration(
              prefixIcon: Icon(Icons.lock_outline), hintText: "Password"),
          obscureText: true,
        ),
        SizedBox(
          height: 20.0,
        ),
        RaisedButton(
          color: Theme.of(context).primaryColor,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 100),
            child: Text(
              "Log In",
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 20.0),
            ),
          ),
          onPressed: () {
            _loginUser(
                type: LoginType.email,
                email: _emailController.text,
                password: _passwordController.text,
                context: context);
          },
        ),
        FlatButton(
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => OurSignUp()));
            },
            materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
            child: Text("Dont have an account? Sign up here")),
        _googleButton(),
      ],
    ));
  }
}
