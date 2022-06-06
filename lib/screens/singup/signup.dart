import 'package:book_reader/screens/singup/localwidgets/ourSignForm.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class OurSignUp extends StatelessWidget {
  const OurSignUp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Expanded(
              child: ListView(padding: EdgeInsets.all(20.0), children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                BackButton(),
              ],
            ),
            SizedBox(
              height: 40.0,
            ),
            OurSignUpForm(),
          ]))
        ],
      ),
    );
  }
}
