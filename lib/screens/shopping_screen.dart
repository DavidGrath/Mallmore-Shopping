import 'package:flutter/material.dart';
import 'dart:async';
import '../models/Item.dart';
import '../utils/Constants.dart';
import '../templates/ItemView.dart';
import '../bloc/Bloc.dart';
import '../bloc/BlocProvider.dart';
import '../bloc/ItemBloc.dart';

class ShoppingScreen extends StatefulWidget {
  int CATEGORY;
  ShoppingScreen(this.CATEGORY);
  @override
  State<StatefulWidget> createState() {
    return _ShoppingScreenState(CATEGORY);
  }
}

class _ShoppingScreenState extends State<ShoppingScreen>{
  int CATEGORY;
  _ShoppingScreenState(this.CATEGORY);
  var items = List<Item>();

  String titleFromCategory() {
    switch(CATEGORY){
      case CATEGORY_ELECTRONICS:
        return "Electronics";
      case CATEGORY_FOOD_AND_DRINK:
        return "Food and Drink";
      case CATEGORY_HOME_AND_OFFICE:
        return "Home and Office";
      case CATEGORY_VIDEO_GAMES:
        return "Video Games";
      default:
        return "";
    }
  }
  
  @override
  Widget build(BuildContext context) {

    final ItemBloc bloc = BlocProvider.of(context);
    bloc.fetchItems();

    return StreamBuilder(
      stream : bloc.itemStream,
      builder : (context, snapshot) {
    return Scaffold(
      appBar: AppBar(
        title : Text(titleFromCategory())
      ),
      body: Container(
        padding: EdgeInsets.all(10.0),
          child: Center(
            child : ListView(
            children : <Widget>[ 
              Wrap(
              alignment: WrapAlignment.start,
              spacing: 10.0,
              runSpacing: 10.0,
              direction: Axis.horizontal,
              children: 
                _buildItemViews(snapshot.data)
            )
            ]
          )
        ),
      ));
      });
  }
  
  List<ItemView> _buildItemViews(List<Item> items) {
    var views = List<ItemView>();
    if(items == null) return views;
    for(var i in items) {
      if(i.categories.contains(CATEGORY)) {
        views.add(ItemView(item: i,));
      }
    }
    return views;
  }
}