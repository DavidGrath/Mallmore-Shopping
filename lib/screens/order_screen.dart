import 'package:flutter/material.dart';
import '../bloc/OrderBloc.dart';
import '../bloc/BlocProvider.dart';
import '../models/Order.dart';
import './order_detail_screen.dart';
import '../templates/order_view.dart';

class OrderScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _OrderScreenState();
}

class _OrderScreenState extends State<OrderScreen> {
  var bloc = OrderBloc();
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<Order>>(
        stream: bloc.ordersStream,
        builder: (context, snapshot) {
          int count = (snapshot.hasData) ? snapshot.data.length : 0;
          return Scaffold(
            appBar: AppBar(
              title: Text("Orders"),
            ),
            body: Container(
              padding: EdgeInsets.all(10.0),
              child: ListView.builder(
                itemCount: count,
                itemBuilder: (context, i) {
                  return Padding(
                    padding: EdgeInsets.only(bottom: 10),
                    child: GestureDetector(
                      child: OrderView(order: snapshot.data[i]),
                      onTap: () {
                        bloc.setOrder(snapshot.data[i]);
                        Navigator.of(context)
                            .push(MaterialPageRoute(builder: (context) {
                          return OrderDetailScreen(bloc: bloc);
                        }));
                      },
                    ),
                  );
                },
              ),
            ),
          );
        });
  }
}
