import 'package:book_reader/screens/root/root.dart';
import 'package:book_reader/services/database.dart';
import 'package:book_reader/states/currentUser.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CreateGroup extends StatefulWidget {
  @override
  _CreateGroupState createState() => _CreateGroupState();
}

class _CreateGroupState extends State<CreateGroup> {
  void _createGroup(BuildContext context, String groupName) async {
    User user = await FirebaseAuth.instance.currentUser!;
    CurrentUser _currentUser = Provider.of<CurrentUser>(context, listen: false);
    String _returnString = await OurDatabase().createGroup(groupName, user.uid);
    if (_returnString == "success") {
      Navigator.pop(context);
    }
  }

  TextEditingController _groupNameController = TextEditingController();
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
                  controller: _groupNameController,
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.group),
                    hintText: "Group Name",
                  ),
                ),
                SizedBox(
                  height: 20.0,
                ),
                RaisedButton(
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 80),
                      child: Text(
                        "Add Book",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 20.0,
                        ),
                      ),
                    ),
                    onPressed: () =>
                        _createGroup(context, _groupNameController.text)),
              ],
            ),
          ),
          Spacer(),
        ],
      ),
    );
  }
}
