import 'package:flutter/material.dart';
import '../models/CreditCard.dart';

class CreditCardView extends StatelessWidget {
  CreditCard card;
  CreditCardView(this.card);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(15.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        color: Colors.blueAccent,
      ),
      child: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20.0),
            child: Text(
              card.cardNumber,
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 30,
                  fontWeight: FontWeight.bold),
            ),
          ),
          Row(
            children: <Widget>[
              Column(
                children: <Widget>[
                  Text(
                    "Card Holder",
                    style: TextStyle(color: Colors.white54),
                  ),
                  Text(
                    card.holderName,
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  )
                ],
              ),
              Column(
                children: <Widget>[
                  Text(
                    "Exp",
                    style: TextStyle(color: Colors.white54),
                  ),
                  Text(
                      simpleExpireFormat(
                        card.expiry,
                      ),
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold))
                ],
              )
            ],
          )
        ],
      ),
    );
  }

  String simpleExpireFormat(DateTime datetime) {
    return "${datetime.month}/${datetime.year.toString().substring(2, 4)}";
  }
}
