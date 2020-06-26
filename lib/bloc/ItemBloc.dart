import 'dart:async';
import './Bloc.dart';
import '../utils/Constants.dart';
import '../utils/sample_data.dart';
import '../models/Item.dart';
import '../models/Category.dart';
import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';

class ItemBloc implements Bloc {
  final itemsController = BehaviorSubject<List<Item>>();
  final singleItemController = BehaviorSubject<Item>();

  Stream<List<Item>> get itemStream => itemsController.stream;
  Stream<Item> get singleItem => singleItemController.stream;

  List<Category> categories = CATEGORIES;
  List<Item> items = ITEMS;

  ItemBloc() {
    _fetchItems();
  }

  //
  // Simulate a database request
  void _fetchItems() {
    itemsController.sink.add(items);
  }

  void setSingleItem(Item item) {
    singleItemController.sink.add(item);
  }

  void updateItems() {
    debugPrint("Update Called");
    var count = items.length;
    for (int i = count; i < count + 10; i++) {
      items.add(Item("Washing Machine $i", "", "\$", i.toDouble(), 4.2, 10, [],
          'images/washing_machine.jpeg'));
    }
    itemsController.sink.add(items);
  }

  @override
  void dispose() {
    itemsController.close();
    singleItemController.close();
  }
}
