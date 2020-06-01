import 'package:flutter/material.dart';
import '../screens/cart_screen.dart';

class CountedCart extends StatelessWidget {
  int count;
  CountedCart({this.count});

  @override
  Widget build(BuildContext context) {
    return Stack(
      overflow: Overflow.visible,
      children: <Widget>[
        Icon(Icons.shopping_cart),
        Visibility(
          visible: count > 0,
          maintainState: false,
          child: Positioned(
            top: -7.0,
            right: -5.0,
            child: Material(
                type: MaterialType.circle,
                color: Colors.red,
                child: Padding(
                    padding: EdgeInsets.all(4.0),
                    child: Text(
                      count.toString(),
                      style: TextStyle(
                        fontSize: 11.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ))),
          ),
        )
      ],
    );
  }
}
