import 'package:flutter/material.dart';
import './shipping_screen.dart';
import '../models/Cart.dart';
import '../templates/item_view_cart.dart';
import '../bloc/BlocProvider.dart';
import '../bloc/CartBloc.dart';

class CartScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  var shipping_costs = 100.0;
  var import_costs = 40.0;
  @override
  Widget build(BuildContext context) {
    var cartBloc = BlocProvider.of<CartBloc>(context);
    return StreamBuilder(
        stream: cartBloc.cartStream,
        builder: (context, snapshot) {
          var cart = snapshot.data as Cart;
          return Container(
            padding: EdgeInsets.all(10.0),
            child: Column(
              children: <Widget>[
                Expanded(
                  child: (!snapshot.hasData || cart.items.isEmpty)
                      ? Container(
                          child: Center(
                            child: Text("No Items"),
                          ),
                        )
                      : ListView.builder(
                          itemCount: cart.items.length + 1,
                          itemBuilder: (context, i) {
                            if (i < cart.items.length) {
                              return ItemViewCart(item: cart.items[i]);
                            } else {
                              return Container(
                                padding: EdgeInsets.all(10.0),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10.0),
                                    border: Border.all(
                                        width: 1.0, color: Colors.grey)),
                                child: Column(
                                  children: <Widget>[
                                    Row(
                                      children: <Widget>[
                                        Expanded(
                                            child: Align(
                                          alignment: Alignment.centerLeft,
                                          child: Text(
                                              "Items (${cart.items.length})"),
                                        )),
                                        Expanded(
                                            child: Align(
                                          alignment: Alignment.centerRight,
                                          child: Text("\$${cart.total}"),
                                        ))
                                      ],
                                    ),
                                    Row(
                                      children: <Widget>[
                                        Expanded(
                                            child: Align(
                                          alignment: Alignment.centerLeft,
                                          child: Text("Shipping"),
                                        )),
                                        Expanded(
                                            child: Align(
                                          alignment: Alignment.centerRight,
                                          child: Text("\$$shipping_costs"),
                                        ))
                                      ],
                                    ),
                                    Row(
                                      children: <Widget>[
                                        Expanded(
                                            child: Align(
                                          alignment: Alignment.centerLeft,
                                          child: Text("Import Charges"),
                                        )),
                                        Expanded(
                                            child: Align(
                                          alignment: Alignment.centerRight,
                                          child: Text("\$$import_costs"),
                                        ))
                                      ],
                                    ),
                                    Row(
                                      children: <Widget>[
                                        Expanded(
                                            child: Align(
                                          alignment: Alignment.centerLeft,
                                          child: Text(
                                            "Total",
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold),
                                          ),
                                        )),
                                        Expanded(
                                            child: Align(
                                          alignment: Alignment.centerRight,
                                          child: Text(
                                            "\$${cart.total + shipping_costs + import_costs}",
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                color: Colors.lightBlue),
                                          ),
                                        ))
                                      ],
                                    ),
                                  ],
                                ),
                              );
                            }
                          },
                        ),
                ),
                Row(
                  mainAxisSize: MainAxisSize.max,
                  children: <Widget>[
                    Expanded(
                      child: RaisedButton(
                        child: Text("Checkout"),
                        color: Colors.lightBlue,
                        onPressed: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) {
                            return ShippingScreen();
                          }));
                        },
                      ),
                    ),
                  ],
                )
              ],
            ),
          );
        });
  }
}
