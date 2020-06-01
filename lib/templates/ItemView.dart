import 'package:flutter/material.dart';
import '../models/Item.dart';
import '../bloc/BlocProvider.dart';
import '../bloc/ItemBloc.dart';
import '../screens/item_screen.dart';

class ItemView extends StatefulWidget {
  Item item;

  ItemView({Key key, this.item}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _ItemViewState(item);
  }
}

class _ItemViewState extends State<ItemView> {
  Item item;
  TextStyle itemStyle = TextStyle(
    fontWeight: FontWeight.bold,
  );

  _ItemViewState(this.item);

  @override
  Widget build(BuildContext context) {
    ItemBloc bloc = BlocProvider.of(context);
    return Container(
      width: 150,
      child: GestureDetector(
        child: Container(
          margin: EdgeInsets.all(5.0),
          decoration: BoxDecoration(
              border: Border.all(width: 0.5, color: Colors.blueGrey),
              borderRadius: BorderRadius.circular(5.0)),
          child: Padding(
            padding: EdgeInsets.all(10.0),
            child: Column(
              children: <Widget>[
                ClipRRect(
                  borderRadius: BorderRadius.circular(5.0),
                  child: Image(
                    image: AssetImage(item.image),
                    width: 120,
                    height: 120,
                  ),
                ),
                Container(
                  width: 120,
                  child: Text(
                    item.name,
                    style: itemStyle,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "${item.currencyCode}${item.price}",
                    textAlign: TextAlign.start,
                    style: TextStyle(
                      color: Colors.blue,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
        onTap: () {
          bloc.setSingleItem(item);
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return ItemDetailScreen();
          }));
        },
      ),
    );
  }
}
