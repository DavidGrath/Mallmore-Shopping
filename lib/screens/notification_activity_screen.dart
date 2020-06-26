import 'package:flutter/material.dart';

class NotificationActivityScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Activity"),
      ),
      body: Container(
        padding: EdgeInsets.all(10.0),
        child: ListView(
          children: <Widget>[
            ListTile(
              leading: Icon(Icons.local_offer, color: Colors.lightBlue),
              title: Text("Offer of the Century"),
              subtitle: Text("Insert Lorem Ipsum Here"),
            ),
            ListTile(
              leading: Icon(Icons.local_offer, color: Colors.lightBlue),
              title: Text("Limited Time Offer"),
              subtitle: Text("Insert Lorem Ipsum Here"),
            ),
            ListTile(
              leading: Icon(Icons.local_offer, color: Colors.lightBlue),
              title: Text("Mega Sale all 80% Off"),
              subtitle: Text("Insert Lorem Ipsum Here"),
            ),
          ],
        ),
      ),
    );
  }
}
