import 'package:flutter/material.dart';
import '../models/Item.dart';

class ItemViewCart extends StatelessWidget {

  Item item;
  ItemViewCart({Key key, @required this.item}) : super(key : key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height : 150,
      child : Card(
      child: Padding(
        padding: EdgeInsets.all(10.0),
        child : Row(
          children: <Widget>[
            // Flexible(
              // flex : 2,
              Image(image: AssetImage(item.image),),
            // ),
            // Flexible(
              // flex: 3,
              // child: 
            Expanded(child:
            Padding(
              padding: EdgeInsets.all(10.0),
              child :
            Column(children: <Widget>[
            Expanded(
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child : Text(item.name,
                        style: TextStyle(
                          fontWeight: FontWeight.bold
                        ),
                      )
                    ),
                    Padding(
                      padding: EdgeInsets.all(5),
                      child:Icon(Icons.favorite, color: Colors.pink,),
                    ),
                    Padding(
                      padding: EdgeInsets.all(5),
                      child:Icon(Icons.delete),
                    )
                  ],
                ),
            ),
            Container(
                alignment: Alignment.bottomCenter,
            child : Expanded( 
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: Text("${item.currencyCode}${item.price}"),
                    ),
                    TempIncrementWidget()
                  ]
              ),
            ))
            ],)
            ))
          ],
        )
      ),
    ));
  }

}

class TempIncrementWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _TempIncState();
}

class _TempIncState extends State<TempIncrementWidget> {

  int count = 1;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        IconButton(
          icon: Icon(Icons.remove),
          onPressed: (){
            setState(() {
              count = (count - 1 >= 0) ? count - 1 : count;
            });
          },
        ),
        Text(count.toString()),
        IconButton(
          icon: Icon(Icons.add),
          onPressed: (){
            setState(() {
              count = (count + 1 <= 100) ? count + 1 : count;
            });
          },
        )
      ],
    );
  }

}