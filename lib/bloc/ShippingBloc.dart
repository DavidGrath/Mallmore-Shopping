import './Bloc.dart';
import 'dart:async';
import 'package:rxdart/rxdart.dart';
import '../models/ShippingAddress.dart';

class ShippingBloc extends Bloc {
  var _shippingListController = BehaviorSubject<List<ShippingAddress>>();
  Stream<List<ShippingAddress>>  get shippingListStream => _shippingListController.stream;
  var _shippingList = List<ShippingAddress>();
  ShippingBloc() {
    _shippingList.add(ShippingAddress(name : "David Drake", 
    address: "1, 123 Drive, Lagos, Nigeria",
    number: "+234 8012345678"));
    _shippingList.add(ShippingAddress(name : "Peter Pragmatic", 
    address: "23 Dapo Lane, Hansen Estate, Imagi-Nation",
    number: "+234 7012345678"));
    _shippingListController.sink.add(_shippingList);
  }
  @override
  void dispose() {
    _shippingListController.close();
  }
  
}