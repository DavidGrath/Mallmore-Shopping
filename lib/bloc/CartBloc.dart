import 'package:rxdart/rxdart.dart';
import 'dart:async';
import 'package:flutter/material.dart';
import './Bloc.dart';
import '../models/Cart.dart';
import '../models/Item.dart';

class CartBloc implements Bloc {

  Cart cart;
  CartBloc() {
    cart = Cart();
    cartController.sink.add(cart);
    cartCountController.sink.add(0);
  }
  var cartController = BehaviorSubject<Cart>();
  var cartCountController = BehaviorSubject<int>();

  Stream<Cart> get cartStream => cartController.stream;
  Stream<int> get cartCountStream => cartCountController.stream;

  void addToCart(Item item) {
    if(!cart.items.contains(item)) {
      cart.addItem(item);
    }
    cartController.sink.add(cart);
    cartCountController.sink.add(cart.items.length);
  }

  @override
  void dispose() {
    cartController.close();
    cartCountController.close();
  }
}