import 'package:book_reader/screens/login/localwidgets/loginForm.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../screens/login/login.dart';

class SplashScreen extends StatefulWidget {
  static const String id = 'splash-screen';

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  AnimationController? _bookController;
  bool copAnimated = false;
  bool animatedBookText = false;

  @override
  void initState() {
    super.initState();
    _bookController = AnimationController(vsync: this);
    _bookController!.addListener(() {
      if (_bookController!.value > 0.9) {
        _bookController!.stop();
        copAnimated = true;
        setState(() {});
        Future.delayed(Duration(seconds: 1), () {
          animatedBookText = true;
          setState(() {});
        });
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    _bookController!.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Color(0xFFEF5350),
      body: Stack(
        children: [
          // White Container top half
          AnimatedContainer(
            duration: const Duration(seconds: 1),
            height: copAnimated ? screenHeight / 2 : screenHeight,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(40.0),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Visibility(
                  visible: !copAnimated,
                  child: Lottie.network(
                    'https://assets9.lottiefiles.com/packages/lf20_ad3uxjiv.json',
                    controller: _bookController,
                    onLoaded: (composition) {
                      _bookController!
                        ..duration = composition.duration
                        ..forward();
                    },
                  ),
                ),
                Visibility(
                  visible: copAnimated,
                  child: Image(
                    image: AssetImage('images/book.png'),
                    height: 220.0,
                    width: 220.0,
                  ),
                ),
                Center(
                  child: AnimatedOpacity(
                    opacity: animatedBookText ? 1 : 0,
                    duration: const Duration(seconds: 1),
                    child: const Text(
                      'B O O K',
                      style:
                          TextStyle(fontSize: 50.0, color: Color(0xFFEF5350)),
                    ),
                  ),
                )
              ],
            ),
          ),

          // Text bottom part
          Visibility(visible: copAnimated, child: const _BottomPart()),
        ],
      ),
    );
  }
}

class _BottomPart extends StatelessWidget {
  const _BottomPart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 40.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text(
              'Find The Best Book for you',
              style: TextStyle(
                  fontSize: 27.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
            const SizedBox(
              height: 30.0,
            ),
            Text(
              'Lorem ipsum dolor sit amet, consectetur adipiscing elit, '
              'sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. '
              'Aliquet porttitor lacus luctus accumsan.',
              style: TextStyle(
                  fontSize: 15.0,
                  color: Colors.white.withOpacity(0.8),
                  height: 1.5),
            ),
            const SizedBox(
              height: 50.0,
            ),
            Align(
              alignment: Alignment.centerRight,
              child: Container(
                height: 85.0,
                width: 85.0,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: Colors.white, width: 2.0),
                ),
                child: IconButton(
                  color: Colors.white,
                  icon: Icon(Icons.chevron_right),
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => OurLogin()));
                  },
                ),
              ),
            ),
            const SizedBox(
              height: 50.0,
            )
          ],
        ),
      ),
    );
  }
}
