import './User.dart';
import 'package:flutter/material.dart';

class Review {
  User owner;
  int rating;
  String content;
  //TODO Replace with String uri
  List<Widget> pictures;
  int date;
  Review({this.owner, this.rating, this.content, this.pictures}) {
    date = DateTime.now().millisecondsSinceEpoch;
  }
}
