import 'package:book_reader/screens/root/root.dart';
import 'package:book_reader/services/database.dart';
import 'package:book_reader/states/currentUser.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class JoinGroup extends StatefulWidget {
  const JoinGroup({Key? key}) : super(key: key);

  @override
  State<JoinGroup> createState() => _JoinGroupState();
}

class _JoinGroupState extends State<JoinGroup> {
  void _joinGroup(BuildContext contextm, String groupId) async {
    CurrentUser _currentUser = Provider.of<CurrentUser>(context, listen: false);
    String _returnString = await OurDatabase()
        .joinGroup(groupId, _currentUser.getCurrentUser.uid as String);
    if (_returnString == "success") {
      Navigator.pop(context);
    }
  }

  TextEditingController _groupIdController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Row(
              children: <Widget>[BackButton()],
            ),
          ),
          Spacer(),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: <Widget>[
                TextFormField(
                  controller: _groupIdController,
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.group),
                    hintText: "Group Id",
                  ),
                ),
                SizedBox(
                  height: 20.0,
                ),
                RaisedButton(
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 80),
                      child: Text(
                        "Join",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 20.0,
                        ),
                      ),
                    ),
                    onPressed: () =>
                        _joinGroup(context, _groupIdController.text))
              ],
            ),
          ),
          Spacer(),
        ],
      ),
    );
  }
}
