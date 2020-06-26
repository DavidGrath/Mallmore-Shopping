import 'package:flutter/material.dart';
import './notification_activity_screen.dart';
import './notification_feed_screen.dart';
import './notification_offer_screen.dart';

class NotificationScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Notifications"),
      ),
      body: Container(
        padding: EdgeInsets.all(10.0),
        child: ListView(
          children: <Widget>[
            ListTile(
              leading: Icon(Icons.local_offer, color: Colors.lightBlue),
              title: Text(
                "Offer",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              trailing: Material(
                type: MaterialType.circle,
                color: Colors.red,
                child: Container(
                  padding: EdgeInsets.all(4.0),
                  child: Text("2"),
                ),
              ),
              onTap: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) {
                  return NotificationOfferScreen();
                }));
              },
            ),
            ListTile(
              leading: Icon(Icons.list, color: Colors.lightBlue),
              title: Text(
                "Feed",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              trailing: Material(
                type: MaterialType.circle,
                color: Colors.red,
                child: Container(
                  padding: EdgeInsets.all(4.0),
                  child: Text("3"),
                ),
              ),
              onTap: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) {
                  return NotificationFeedScreen();
                }));
              },
            ),
            ListTile(
              leading: Icon(Icons.notifications, color: Colors.lightBlue),
              title: Text(
                "Activity",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              trailing: Material(
                type: MaterialType.circle,
                color: Colors.red,
                child: Container(
                  padding: EdgeInsets.all(4.0),
                  child: Text("3"),
                ),
              ),
              onTap: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) {
                  return NotificationActivityScreen();
                }));
              },
            )
          ],
        ),
      ),
    );
  }
}
