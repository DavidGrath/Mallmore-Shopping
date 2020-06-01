import 'package:flutter/material.dart';
import '../models/Order.dart';
import 'package:intl/intl.dart';

class OrderView extends StatefulWidget {
  Order order;
  OrderView({this.order});
  @override
  State<StatefulWidget> createState() => _OrderViewState(order: order);
}

class _OrderViewState extends State<OrderView> {
  Order order;
  _OrderViewState({this.order});
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10.0),
      decoration: BoxDecoration(
          border: Border.all(
            color: Colors.grey,
            width: 0.5,
          ),
          borderRadius: BorderRadius.circular(10.0)),
      child: Column(
        children: <Widget>[
          Align(
            alignment: Alignment.centerLeft,
            child: Text(order.id),
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: Text(DateFormat.yMMMd()
                .format(DateTime.fromMillisecondsSinceEpoch(order.time))),
          ),
          Row(
            children: <Widget>[
              Expanded(
                child: Text(
                  "Order Status",
                  textAlign: TextAlign.start,
                ),
              ),
              Expanded(
                child: Text(
                  order.status,
                  textAlign: TextAlign.end,
                ),
              ),
            ],
          ),
          Row(
            children: <Widget>[
              Expanded(
                child: Text(
                  "Items",
                  textAlign: TextAlign.start,
                ),
              ),
              Expanded(
                child: Text(
                  "${order.items.length} items purchased",
                  textAlign: TextAlign.end,
                ),
              ),
            ],
          ),
          Row(
            children: <Widget>[
              Expanded(
                child: Text(
                  "Price",
                  textAlign: TextAlign.start,
                ),
              ),
              Expanded(
                child: Text(
                  "${order.currencyCode}${order.totalPrice}",
                  textAlign: TextAlign.end,
                  style: TextStyle(color: Colors.lightBlue),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
