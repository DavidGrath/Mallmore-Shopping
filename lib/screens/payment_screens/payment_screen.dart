import 'package:flutter/material.dart';
import './credit_card_screen.dart';

class PaymentScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Payment"),
      ),
      body: Container(
        padding: EdgeInsets.all(10.0),
        child: ListView(
          children: <Widget>[
            ListTile(
              leading: Icon(Icons.credit_card),
              title: Text("Credit Card or Debit"),
              onTap: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) {
                  return CreditCardScreen();
                }));
              },
            ),
            ListTile(
              leading: Image(
                image: AssetImage("images/paypal_logo.png"),
                width: 24,
                height: 24,
              ),
              title: Text("Paypal"),
              onTap: () {},
            ),
            ListTile(
              leading: Icon(Icons.money_off),
              title: Text("Bank Transfer"),
              onTap: () {},
            )
          ],
        ),
      ),
    );
  }
}
