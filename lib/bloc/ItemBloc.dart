import 'dart:async';
import './Bloc.dart';
import '../utils/Constants.dart';
import '../models/Item.dart';
import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';

class ItemBloc implements Bloc {

  final itemsController = BehaviorSubject<List<Item>>();
  final singleItemController = BehaviorSubject<Item>();

  Stream<List<Item>> get itemStream => itemsController.stream;
  Stream<Item> get singleItem => singleItemController.stream;

  List<Item> items = [
      Item("Washing Machine with a very long name","","\$",125,4.2,10,[CATEGORY_ELECTRONICS],'images/washing_machine.jpeg'),
      Item("Washing Drink","","\$",125,4.2,10,[CATEGORY_FOOD_AND_DRINK],'images/washing_machine.jpeg'),
      Item("Washing Game","","\$",125,4.2,10,[CATEGORY_VIDEO_GAMES],'images/washing_machine.jpeg'),
      Item("Washing Shoes","","\$",125,4.2,10,[CATEGORY_HOME_AND_OFFICE],'images/washing_machine.jpeg'),
      Item("Washing Gra","","\$",125,4.2,10,[CATEGORY_ELECTRONICS],'images/washing_machine.jpeg'),
    ];

  ItemBloc() {
    _fetchItems();
  }

  void _fetchItems() {
    itemsController.sink.add(items);
  }

  void setSingleItem(Item item) {
    singleItemController.sink.add(item);
    debugPrint("Added item to sink");
  }

  void updateItems() {
    debugPrint("Update Called");
    var count = items.length;
    for (int i = count; i < count + 10; i++) {
      items.add(Item("Washing Machine $i","","\$",i.toDouble(),4.2,10,[],'images/washing_machine.jpeg'));
    }
    itemsController.sink.add(items);
  }

  @override
  void dispose() {
    itemsController.close();
  }
}