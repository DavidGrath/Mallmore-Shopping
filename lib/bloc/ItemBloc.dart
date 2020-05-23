import 'dart:async';
import './Bloc.dart';
import '../utils/Constants.dart';
import '../models/Item.dart';
import 'package:flutter/material.dart';

class ItemBloc implements Bloc {

  final itemsController = StreamController<List<Item>>.broadcast();

  Stream<List<Item>> get itemStream => itemsController.stream;

  List<Item> items = [
      Item("Washing Machine","","\$",125,4.2,10,[CATEGORY_ELECTRONICS],'images/washing_machine.jpeg'),
      Item("Washing Drink","","\$",125,4.2,10,[CATEGORY_FOOD_AND_DRINK],'images/washing_machine.jpeg'),
      Item("Washing Game","","\$",125,4.2,10,[CATEGORY_VIDEO_GAMES],'images/washing_machine.jpeg'),
      Item("Washing Shoes","","\$",125,4.2,10,[CATEGORY_HOME_AND_OFFICE],'images/washing_machine.jpeg'),
      Item("Washing Gra","","\$",125,4.2,10,[CATEGORY_ELECTRONICS],'images/washing_machine.jpeg'),
    ];

  void fetchItems() {
    itemsController.sink.add(items);
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