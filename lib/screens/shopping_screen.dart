import 'package:flutter/material.dart';
import '../models/Item.dart';
import '../utils/Constants.dart';
import '../templates/ItemView.dart';
import '../templates/counted_cart.dart';
import '../bloc/BlocProvider.dart';
import '../bloc/ItemBloc.dart';
import '../bloc/CartBloc.dart';

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
  
  // @override
  // void dispose() {
  //   bloc.dispose();
  //   super.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    final ItemBloc bloc = BlocProvider.of(context);

    var cartBloc = BlocProvider.of<CartBloc>(context);

    return StreamBuilder(
      stream : bloc.itemStream,
      builder : (context, snapshot) {

    return Scaffold(
      appBar: AppBar(
        title : Text(titleFromCategory()),
        actions: <Widget>[
              StreamBuilder(
                initialData: 0,
                stream: cartBloc.cartCountStream,
                builder: (context, snapshot){
                  var count = snapshot.data as int;
                  return CountedCart(count : count);
                },
              )
            ],
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
    if(items == null) {
      return views;
    }
    for(var i in items) {
      if(i.categories.contains(CATEGORY)) {
        views.add(ItemView(item: i,));
      }
    }
    return views;
  }
}