import 'package:flutter/material.dart';

class AccountScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Account"),
      ),
      body : ListView(
        children: <Widget>[
          ListTile(
            title: Text("Profile"),
            leading: Icon(Icons.person, color: Colors.lightBlue),
          ),
          ListTile(
            title: Text("Orders"),
            leading: Icon(Icons.person, color: Colors.lightBlue),
          ),
          ListTile(
            title: Text("Address"),
            leading: Icon(Icons.location_on, color: Colors.lightBlue),
          ),
          ListTile(
            title: Text("Payment"),
            leading: Icon(Icons.credit_card, color: Colors.lightBlue),
          ),
        ],
      )
    );
  }

}