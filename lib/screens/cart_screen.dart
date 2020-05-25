import 'package:flutter/material.dart';
import '../models/Cart.dart';
import '../templates/item_view_cart.dart';
import '../bloc/BlocProvider.dart';
import '../bloc/CartBloc.dart';

class CartScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    var cartBloc = BlocProvider.of<CartBloc>(context);
    return StreamBuilder(
      stream: cartBloc.cartStream,
      builder : (context, snapshot) {
        var cart = snapshot.data as Cart;
        return (snapshot.hasData)?Scaffold(
          appBar: AppBar(title: Text("Cart"),),
          body: Container(
            padding: EdgeInsets.all(10.0),
            child: ListView.builder(
              itemCount: cart.items.length + 2,
              itemBuilder: (context, i){
                if(i < cart.items.length) {
                  return ItemViewCart(item : cart.items[i]);
                } else if(i == cart.items.length){
                  return Row(children: <Widget>[
                    Expanded(child: 
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text("Total"),
                    )
                    ),
                    Expanded(child: 
                    Align(
                      alignment: Alignment.centerRight,
                      child: Text("\$${cart.total}"),
                    )
                    )
                  ],);
                } else {
                  return RaisedButton(
                    child: Text("Checkout"),
                    onPressed: () {
                    },
                  );
                }
              },
            ),
          ),
          ): Container();
      }
    );
  }

}