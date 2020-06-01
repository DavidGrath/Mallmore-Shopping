import './Bloc.dart';
import '../models/Order.dart';
import 'dart:async';
import 'package:rxdart/rxdart.dart';

class OrderBloc extends Bloc {
  OrderBloc() {
    _order = orders[0];
    _fetchOrders();
  }
  var orders = <Order>[
    Order(items: [], currencyCode: "\$", totalPrice: 1000.0),
    Order(items: [], currencyCode: "\$", totalPrice: 20.0)
  ];
  Order _order;
  final _ordersController = BehaviorSubject<List<Order>>();
  final _singleController = BehaviorSubject<Order>();
  Stream<List<Order>> get ordersStream => _ordersController.stream;
  Stream<Order> get singleStream => _singleController.stream;

  void setOrder(Order o) {
    _singleController.sink.add(o);
  }

  //Database Call
  void _fetchOrders() {
    _singleController.sink.add(_order);
    _ordersController.sink.add(orders);
  }

  @override
  void dispose() {
    _ordersController.close();
    _singleController.close();
  }
}
