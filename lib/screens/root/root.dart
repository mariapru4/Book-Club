import 'package:book_reader/screens/home/home.dart';
import 'package:book_reader/states/currentUser.dart';
import 'package:book_reader/views/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

enum AuthStatus {
  notLoggedIn,
  loggedIn,
}

class OurRoot extends StatefulWidget {
  const OurRoot({Key? key}) : super(key: key);

  @override
  State<OurRoot> createState() => _OurRootState();
}

class _OurRootState extends State<OurRoot> {
  AuthStatus _authStatus = AuthStatus.notLoggedIn;
  @override
  void didChangeDependencies() async {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();

    //get the state, check current User, set AuthStatus based on state
    CurrentUser _currentUser = Provider.of<CurrentUser>(context, listen: false);
    String _returnString = await _currentUser.onStarUp();
    if (_returnString == "success") {
      setState(() {
        _authStatus = AuthStatus.loggedIn;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    Widget? retVal;
    switch (_authStatus) {
      case AuthStatus.loggedIn:
        retVal = HomeScreen();
        break;
      case AuthStatus.notLoggedIn:
        retVal = SplashScreen();
        break;
    }
    return retVal;
  }
}
