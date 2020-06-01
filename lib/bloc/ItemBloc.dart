import 'dart:async';
import 'dart:developer' as developer;
import './Bloc.dart';
import '../utils/Constants.dart';
import '../models/Item.dart';
import '../models/Category.dart';
import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';

class ItemBloc implements Bloc {
  final itemsController = BehaviorSubject<List<Item>>();
  final singleItemController = BehaviorSubject<Item>();

  Stream<List<Item>> get itemStream => itemsController.stream;
  Stream<Item> get singleItem => singleItemController.stream;

  List<Category> categories = [
    Category(
        title: "Men Shirts",
        image: "images/flaticons/shirt-1.png",
        constant: CATEGORY_MEN_SHIRT,
        group: GROUP_MEN_FASHION),
    Category(
        title: "Men Work Equipment",
        image: "images/flaticons/portfolio.png",
        constant: CATEGORY_WORK_EQUIPMENT,
        group: GROUP_MEN_FASHION),
    Category(
        title: "Men T-Shirt",
        image: "images/flaticons/shirt-5.png",
        constant: CATEGORY_MEN_T_SHIRT,
        group: GROUP_MEN_FASHION),
    Category(
        title: "Men Shoes",
        image: "images/flaticons/shoe.png",
        constant: CATEGORY_SHOES_MEN,
        group: GROUP_MEN_FASHION),
    Category(
        title: "Pants",
        image: "images/flaticons/trousers.png",
        constant: CATEGORY_MEN_PANTS,
        group: GROUP_MEN_FASHION),
    Category(
        title: "Men's Underwear",
        image: "images/flaticons/underwear.png",
        constant: CATEGORY_MEN_UNDERWEAR,
        group: GROUP_MEN_FASHION),
    Category(
        title: "Dresses",
        image: "images/flaticons/dress.png",
        constant: CATEGORY_DRESS,
        group: GROUP_WOMEN_FASHION),
    Category(
        title: "Women Shirts",
        image: "images/flaticons/shirt-4.png",
        constant: CATEGORY_WOMEN_SHIRT,
        group: GROUP_WOMEN_FASHION),
    Category(
        title: "Skirts",
        image: "images/flaticons/skirt.png",
        constant: CATEGORY_SKIRT,
        group: GROUP_WOMEN_FASHION),
    Category(
        title: "Handbags",
        image: "images/flaticons/handbag-2.png",
        constant: CATEGORY_HANDBAG,
        group: GROUP_WOMEN_FASHION),
    Category(
        title: "High Heels",
        image: "images/flaticons/high-heel.png",
        constant: CATEGORY_SHOES_WOMEN,
        group: GROUP_WOMEN_FASHION),
    Category(
        title: "Bikinis",
        image: "images/flaticons/lingerie.png",
        constant: CATEGORY_BIKINI,
        group: GROUP_WOMEN_FASHION)
  ];
  List<Item> items = [
    Item("Washing Machine", "", "\$", 125, 2.2, 10, [CATEGORY_ELECTRONICS],
        'images/washing_machine.jpeg'),
    Item("Converse Shoes", "", "\$", 100, 4.5, 10, [CATEGORY_SHOES_MEN],
        'images/chucks_allstars_shoe_pixabay.png'),
    Item("DC Shoes", "", "\$", 105, 3.3, 55, [CATEGORY_SHOES_MEN],
        'images/shoes_pixabay_3.jpg'),
    Item("Leather Bag", "", "\$", 100, 3.9, 20, [CATEGORY_HANDBAG],
        'images/leather_case_pixabay.png'),
    Item("Fashion Handbag", "", "\$", 107, 4.1, 30, [CATEGORY_HANDBAG],
        'images/handbag_pixabay.jpg'),
    Item("Handbag", "", "\$", 25, 3.7, 150, [CATEGORY_HANDBAG],
        'images/handbag_pixabay_2.jpg'),
    Item("Office Handbag", "", "\$", 125, 4.4, 420, [CATEGORY_HANDBAG],
        'images/handbag_pixabay_3.jpg'),
  ];

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
