import 'package:flutter/material.dart';
import '../models/Order.dart';
import '../templates/item_view_cart.dart';
import '../bloc/BlocProvider.dart';
import '../bloc/OrderBloc.dart';

class OrderDetailScreen extends StatefulWidget {
  OrderBloc bloc;
  OrderDetailScreen({this.bloc});
  @override
  State<StatefulWidget> createState() => _OrderDetailState(bloc: bloc);
}

class _OrderDetailState extends State<OrderDetailScreen> {
  OrderBloc bloc;
  _OrderDetailState({this.bloc});
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<Order>(
      stream: bloc.singleStream,
      builder: (context, snapshot) {
        return Scaffold(
          appBar: AppBar(
            title: Text("Order Details"),
          ),
          body: Container(
            padding: EdgeInsets.all(10.0),
            child: Column(
              children: <Widget>[
                Expanded(
                  child: ListView(),
                ),
                Row(
                  mainAxisSize: MainAxisSize.max,
                  children: <Widget>[
                    Expanded(
                      child: RaisedButton(
                        color: Colors.lightBlue,
                        child: Text("Notify Me"),
                        onPressed: () {},
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
