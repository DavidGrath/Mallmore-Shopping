import 'package:rxdart/rxdart.dart';
import 'dart:async';
import './Bloc.dart';
import '../models/Item.dart';
import '../models/Category.dart';
import '../utils/Constants.dart';
import '../utils/sample_data.dart';
import 'package:flutter/material.dart';

class SearchBloc extends Bloc {
  //TODO Delete this dependency later
  int _category;
  int _sort;
  var _priceRange = RangeValues(0, 1000);
  List<Category> categories = CATEGORIES;
  List<Item> items = ITEMS;
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
