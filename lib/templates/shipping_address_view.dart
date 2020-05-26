import 'package:flutter/material.dart';
import '../models/ShippingAddress.dart';

class ShippingAddressView extends StatelessWidget {

  ShippingAddress address;

  ShippingAddressView({this.address});

  var nameStyle = TextStyle(
    fontWeight: FontWeight.bold,
    fontSize: 20.0,
  );

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.all(10.0),
            child: Text(address.name,
              style: nameStyle,
            ),
          ),
          Padding(
            padding: EdgeInsets.all(10.0),
            child: Text(address.address,),
          ),
          Padding(
            padding: EdgeInsets.all(10.0),
            child: Text(address.number,),
          ),
          Padding(
            padding: EdgeInsets.all(10.0),
            child: Row(
              children: <Widget>[
                RaisedButton(
                  color: Colors.lightBlue,
                  child: Text("Edit"),
                  onPressed: (){
                    
                  },
                ),
                SizedBox(width: 10.0,),
                IconButton(
                  icon: Icon(Icons.delete_outline),
                  onPressed: (){

                  },
                )
              ],
            )
          )
          
        ],
      ),
    );
  }

}