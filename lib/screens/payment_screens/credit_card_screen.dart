import 'package:flutter/material.dart';
import '../../models/CreditCard.dart';
import '../../templates/credit_card_view.dart';
import './add_card_screen.dart';

class CreditCardScreen extends StatelessWidget {
  List<CreditCard> cards;
  CreditCardScreen() {
    // https://ccard-generator.com/generate-card/mastercard
    var ccOne = "5150694885133154";
    var ccTwo = "5188908917381524";
    var cards = <CreditCard>[
      CreditCard(
          cardNumber: ccOne,
          expiry: DateTime.now(),
          cvv: 100,
          holderName: "Alan Hart"),
      CreditCard(
          cardNumber: ccTwo,
          expiry: DateTime.now(),
          cvv: 100,
          holderName: "Alan Hart")
    ];
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Credit and Debit Card"),
      ),
      body: Container(
        padding: EdgeInsets.all(10.0),
        child: Column(
          children: <Widget>[
            Expanded(
              child: ListView(
                  children: cards
                      .map<Widget>((c) => Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: CreditCardView(c),
                          ))
                      .toList()),
            ),
            Row(
              children: <Widget>[
                Expanded(
                  child: RaisedButton(
                    color: Colors.lightBlue,
                    child: Text("Add Card"),
                    onPressed: () {
                      Navigator.of(context)
                          .push(MaterialPageRoute(builder: (context) {
                        return AddCardScreen();
                      }));
                    },
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
