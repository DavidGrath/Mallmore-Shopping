import './Item.dart';
import './ShippingAddress.dart';
import 'package:uuid/uuid.dart';

class Order {
  int time;
  String id;
  List<Item> items;
  String status;
  String currencyCode;
  double totalPrice;
  ShippingAddress address;

  Order({this.items, this.currencyCode, this.totalPrice, this.address}) {
    id = Uuid().v4();
    time = DateTime.now().millisecondsSinceEpoch;
    status = "Packing";
  }
}
