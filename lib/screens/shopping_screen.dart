import 'package:flutter/material.dart';
import '../models/Item.dart';
import '../utils/Constants.dart';
import '../templates/ItemView.dart';
import '../templates/counted_cart.dart';
import '../bloc/BlocProvider.dart';
import '../bloc/ItemBloc.dart';
import '../bloc/CartBloc.dart';
import '../models/Category.dart';

class ShoppingScreen extends StatefulWidget {
  Category category;
  ShoppingScreen(this.category);
  @override
  State<StatefulWidget> createState() {
    return _ShoppingScreenState(category);
  }
}

class _ShoppingScreenState extends State<ShoppingScreen> {
  Category category;
  _ShoppingScreenState(this.category);

  @override
  Widget build(BuildContext context) {
    final ItemBloc bloc = BlocProvider.of(context);

    var cartBloc = BlocProvider.of<CartBloc>(context);

    return StreamBuilder(
        stream: bloc.itemStream,
        builder: (context, snapshot) {
          return Scaffold(
              appBar: AppBar(
                title: Text(category.title),
                actions: <Widget>[
                  StreamBuilder(
                    initialData: 0,
                    stream: cartBloc.cartCountStream,
                    builder: (context, snapshot) {
                      var count = snapshot.data as int;
                      return CountedCart(count: count);
                    },
                  )
                ],
              ),
              body: Container(
                padding: EdgeInsets.all(10.0),
                child: Center(
                    child: ListView(children: <Widget>[
                  Wrap(
                      alignment: WrapAlignment.start,
                      spacing: 10.0,
                      runSpacing: 10.0,
                      direction: Axis.horizontal,
                      children: _buildItemViews(snapshot.data))
                ])),
              ));
        });
  }

  List<ItemView> _buildItemViews(List<Item> items) {
    var views = List<ItemView>();
    if (items == null) {
      return views;
    }
    for (var i in items) {
      if (i.categories.contains(category.constant)) {
        views.add(ItemView(
          item: i,
        ));
      }
    }
    return views;
  }
}
