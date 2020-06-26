import 'package:flutter/material.dart';
import './checkout_screen.dart';
import '../bloc/ShippingBloc.dart';
import '../models/ShippingAddress.dart';
import '../templates/shipping_address_view.dart';
import './add_address_screen.dart';

class AddressesScreen extends StatelessWidget {
  var bloc = ShippingBloc();

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: bloc.shippingListStream,
      builder: (context, snapshot) {
        var addresses = snapshot.data as List<ShippingAddress>;

        return Scaffold(
            appBar: AppBar(
              title: Text("Addresses"),
            ),
            body: Container(
              padding: EdgeInsets.all(10.0),
              child: Column(children: <Widget>[
                Expanded(
                  child: ListView(
                    children: addresses
                        .map<ShippingAddressView>(
                            (a) => ShippingAddressView(address: a))
                        .toList(),
                  ),
                ),
                Row(
                  children: <Widget>[
                    Expanded(
                        child: RaisedButton(
                      color: Colors.lightBlue,
                      child: Text("Add Address"),
                      onPressed: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return AddAddressScreen();
                        }));
                      },
                    ))
                  ],
                )
              ]),
            ));
      },
    );
  }
}
