import './Item.dart';

class Cart {
  List<Item> items = [];
  double total = 0.0;
  Cart();
  void addItem(Item item) {
    items.add(item);
    total += item.price;
  }
}