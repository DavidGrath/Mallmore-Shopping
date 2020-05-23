import 'package:flutter/material.dart';
import '../models/Item.dart';
import '../bloc/BlocProvider.dart';
import '../bloc/ItemBloc.dart';


class ItemView extends StatefulWidget {

  Item item;

  ItemView({Key key, this.item}) : super(key : key);

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


    return Card(
      child : Padding(
        padding: EdgeInsets.all(10.0),
        child : Column(
          children: <Widget>[
            Image(
                image : AssetImage(item.image), 
                width: 120, 
                height: 120,
            ),
            Container(
              width: 120,
            
            child :Text(item.name,
              style: itemStyle,
            ),
            ),
            Text("${item.currencyCode}${item.price}",
              textAlign: TextAlign.start,
              style: TextStyle(
                color: Colors.blue,
                fontWeight: FontWeight.bold,
              ),
            )
          ],
        ),
      ),
    );
  }
}