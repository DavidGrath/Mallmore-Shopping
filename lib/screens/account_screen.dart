import 'package:flutter/material.dart';
import './profile_screen.dart';
import './order_screen.dart';
import './addresses_screen.dart';
import './payment_screens/payment_screen.dart';

class AccountScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        ListTile(
          title: Text("Profile"),
          leading: Icon(Icons.person, color: Colors.lightBlue),
          onTap: () {
            Navigator.of(context).push(MaterialPageRoute(builder: (context) {
              return ProfileScreen();
            }));
          },
        ),
        ListTile(
          title: Text("Orders"),
          leading: Icon(Icons.person, color: Colors.lightBlue),
          onTap: () {
            Navigator.of(context).push(MaterialPageRoute(builder: (context) {
              return OrderScreen();
            }));
          },
        ),
        ListTile(
            title: Text("Address"),
            leading: Icon(Icons.location_on, color: Colors.lightBlue),
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                return AddressesScreen();
              }));
            }),
        ListTile(
            title: Text("Payment"),
            leading: Icon(Icons.credit_card, color: Colors.lightBlue),
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                return PaymentScreen();
              }));
            }),
      ],
    );
  }
}
