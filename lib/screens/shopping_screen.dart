import 'package:flutter/material.dart';
import '../models/Item.dart';
import '../utils/Constants.dart';

class ShoppingScreen extends StatefulWidget {
  int CATEGORY;
  ShoppingScreen(this.CATEGORY);

  @override
  State<StatefulWidget> createState() {
    return _ShoppingScreenState(CATEGORY);
  }
}

class _ShoppingScreenState extends State<ShoppingScreen>{
  int CATEGORY;
  _ShoppingScreenState(this.CATEGORY);

  var items = List<Item>();

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.red,
      child: Column(
        children: <Widget>[
          Image(
            image : AssetImage('images/washing_machine.jpeg'), 
            width: 120, 
            height: 120,
          ),
          Text(
            "\$125",
            textAlign: TextAlign.center,
          )
        ],
      ),
    );
  }
  
}