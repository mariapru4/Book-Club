import 'package:book_reader/screens/noGroup/noGroup.dart';
import 'package:book_reader/screens/root/root.dart';
import 'package:book_reader/states/currentUser.dart';
import 'package:book_reader/widgets/ourContainer.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  void _goToNoGroup(BuildContext context) {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => OurNoGroup()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          SizedBox(
            height: 40,
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: OurContainer(
                child: Column(
              children: [
                Text(
                  "Harry Potter and the Sorcerer's Stone",
                  style: TextStyle(fontSize: 25, color: Colors.grey[600]),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20.0),
                  child: Row(
                    children: [
                      Text(
                        "Due In:",
                        style: TextStyle(fontSize: 25, color: Colors.grey[600]),
                      ),
                      Text(
                        '8 Days',
                        style: TextStyle(fontSize: 25, color: Colors.black),
                      ),
                    ],
                  ),
                ),
                RaisedButton(
                  child: Text(
                    "Finished Book",
                    style: TextStyle(color: Colors.white),
                  ),
                  onPressed: () {},
                ),
              ],
            )),
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: OurContainer(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Next Book Revealed In:",
                      style: TextStyle(fontSize: 25, color: Colors.grey[600]),
                    ),
                    Text(
                      '22 Hours',
                      style: TextStyle(fontSize: 25, color: Colors.black),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 40.0, vertical: 20.0),
            child: RaisedButton(
              child: Text(
                "Book Club History",
                style: TextStyle(color: Colors.white),
              ),
              onPressed: () => _goToNoGroup(context),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40.0),
            child: RaisedButton(
              child: Text("Sign Out"),
              onPressed: () => _signOut(context),
              color: Colors.white,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0),
                  side: BorderSide(
                      color: Theme.of(context).secondaryHeaderColor, width: 2)),
            ),
          ),
        ],
      ),
    );
  }

  void _signOut(BuildContext context) async {
    CurrentUser _currentUser = Provider.of<CurrentUser>(context, listen: false);
    String _returnString = await _currentUser.signOut();
    if (_returnString == "success") {
      Navigator.pushAndRemoveUntil(context,
          MaterialPageRoute(builder: (context) => OurRoot()), (route) => false);
    }
  }
}
