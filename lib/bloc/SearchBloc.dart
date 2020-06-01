import 'package:rxdart/rxdart.dart';
import 'dart:async';
import './Bloc.dart';
import '../models/Item.dart';
import '../models/Category.dart';
import '../utils/Constants.dart';
import 'package:flutter/material.dart';

class SearchBloc extends Bloc {
  //TODO Delete this dependency later
  int _category;
  int _sort;
  var _priceRange = RangeValues(0, 1000);
  List<Category> categories = [
    Category(
        title: "All", image: null, constant: CATEGORY_NONE, group: GROUP_NONE),
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
  SearchBloc() {
    _category = CATEGORY_NONE;
    _sort = SORT_NONE;
    _categoryController.sink.add(_category);
    _sortController.sink.add(_sort);
    _priceFilterController.sink.add(_priceRange);
    _itemsController.sink.add(items);
  }

  var _categoryController = BehaviorSubject<int>();
  var _sortController = BehaviorSubject<int>();
  var _priceFilterController = BehaviorSubject<RangeValues>();
  var _itemsController = BehaviorSubject<List<Item>>();

  Stream<List<Item>> get itemsStream => _itemsController.stream;
  Stream<List<Item>> get resultStream {
    var comb = CombineLatestStream.combine4(
        _categoryController.stream,
        _sortController.stream,
        _priceFilterController.stream,
        _itemsController.stream, (cat, s, val, i) {
      var category = cat as int;
      var sort = s as int;
      var values = val as RangeValues;
      var items = i as List<Item>;
      //Pass through sort...
      items.sort((a, b) {
        //TODO Add other fields in Item class for sorting
        switch (sort) {
          case SORT_NONE:
            return a.price.compareTo(b.price);
          case SORT_PRICE:
            return a.price.compareTo(b.price);
          case SORT_NAME:
            return a.name.compareTo(b.name);
          default:
            return a.price.compareTo(b.price);
        }
      });
      //... then through category...
      List<Item> categorized = (category != CATEGORY_NONE)
          ? items.where((k) {
              return k.categories.contains(category);
            }).toList()
          : items;
      //... then finally through the filters
      List<Item> filtered = categorized.where((anItem) {
        return anItem.price >= values.start && anItem.price <= values.end;
      }).toList();
      //Please tell me if there's a better way
      return filtered;
    });
    return comb;
  }

  set priceRange(RangeValues range) {
    this._priceRange = range;
    _priceFilterController.sink.add(range);
  }

  RangeValues get priceRange => this._priceRange;

  set category(int category) {
    this._category = category;
    _categoryController.sink.add(category);
  }

  int get category => this._category;

  set sort(int sortBy) {
    this._sort = sortBy;
    _sortController.sink.add(sortBy);
  }

  int get sort => this._sort;

  @override
  void dispose() {
    _categoryController.close();
    _sortController.close();
    _priceFilterController.close();
    _itemsController.close();
  }
}
