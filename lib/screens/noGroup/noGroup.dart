import 'package:book_reader/screens/createGroup/createGroup.dart';
import 'package:book_reader/screens/joinGroup/joinGroup.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class OurNoGroup extends StatelessWidget {
  const OurNoGroup({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    void _goToJoin(BuildContext context) {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => JoinGroup()));
    }

    ;
    void _goToCreate(BuildContext context) {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => CreateGroup()));
    }

    ;

    return Scaffold(
      body: Column(
        children: [
          Spacer(
            flex: 1,
          ),
          Padding(
            padding: EdgeInsets.all(80.0),
            child: Image.asset("images/book.png"),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40.0),
            child: Text(
              "Welcome to Book Club",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 45.0, color: Colors.grey[400]),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Text(
              "Since you are not in a book club, you can select either" +
                  "to join a club or create a club",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 18.0, color: Colors.grey[400]),
            ),
          ),
          Spacer(
            flex: 1,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                RaisedButton(
                  onPressed: () => _goToCreate(context),
                  child: Text("Create"),
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0),
                      side: BorderSide(
                          color: Theme.of(context).secondaryHeaderColor,
                          width: 2)),
                ),
                RaisedButton(
                  onPressed: () => _goToJoin(context),
                  child: Text(
                    "Join",
                    style: TextStyle(color: Colors.white),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
