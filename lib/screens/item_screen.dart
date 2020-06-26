import 'dart:math';
import 'package:flutter/material.dart';
import '../bloc/ItemBloc.dart';
import '../bloc/CartBloc.dart';
import '../bloc/BlocProvider.dart';
import '../models/Item.dart';
import '../templates/star_rating.dart';
import '../templates/counted_cart.dart';
import '../templates/review_view.dart';
import '../templates/ItemView.dart';
import '../templates/pageview_indicator.dart';
import './review_screen.dart';

class ItemDetailScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _ItemDetailScreenState();
}

class _ItemDetailScreenState extends State<ItemDetailScreen> {
  var colors = <Color>[
    Colors.yellow,
    Colors.lightBlue,
    Colors.red,
    Colors.green,
    Colors.blue,
    Colors.blueGrey
  ];
  @override
  Widget build(BuildContext context) {
    ItemBloc bloc = BlocProvider.of<ItemBloc>(context);
    var cartBloc = BlocProvider.of<CartBloc>(context);
    var priceStyle = TextStyle(
        color: Colors.lightBlue, fontWeight: FontWeight.bold, fontSize: 20.0);
    return StreamBuilder(
        stream: bloc.singleItem,
        builder: (context, snapshot) {
          var item = snapshot.data as Item;
          return Scaffold(
            appBar: AppBar(
              title: Text(item.name),
            ),
            body: Container(
              padding: EdgeInsets.all(10.0),
              child: Column(
                children: <Widget>[
                  Expanded(
                    child: ListView(
                      children: <Widget>[
                        Image(
                          image: AssetImage(item.image),
                          width: 200,
                          height: 200,
                        ),
                        PageViewIndicator(
                          index: 2,
                          size: 5,
                        ),
                        Row(
                          children: <Widget>[
                            Expanded(child: Text(item.name)),
                            FavoriteIcon(),
                          ],
                        ),
                        StarRating(
                          averageRating: item.rating,
                        ),
                        Text(
                          "${item.currencyCode}${item.price}",
                          style: priceStyle,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text("Select Size"),
                        ),
                        SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Flex(
                            direction: Axis.horizontal,
                            children: List<double>.generate(6, (i) {
                              return (i * 0.5) + 6;
                            }).map<Widget>((num) {
                              return Container(
                                margin: EdgeInsets.all(10.0),
                                padding: EdgeInsets.all(10.0),
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  border: Border.all(
                                      width: 0.5, color: Colors.lightBlue),
                                ),
                                child: Text(
                                  num.toString(),
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                              );
                            }).toList(),
                          ),
                        ),
                        Text("Select Color"),
                        SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Flex(
                            direction: Axis.horizontal,
                            children: colors.map<Widget>((c) {
                              return Container(
                                padding: EdgeInsets.all(10.0),
                                margin: EdgeInsets.all(10.0),
                                child: Material(
                                  type: MaterialType.circle,
                                  color: c,
                                  child: Padding(
                                    padding: EdgeInsets.all(20.0),
                                  ),
                                ),
                              );
                            }).toList(),
                          ),
                        ),
                        Text("Specification"),
                        Column(
                          children: <Widget>[
                            Row(
                              children: <Widget>[
                                Expanded(
                                  child: Align(
                                    alignment: Alignment.topLeft,
                                    child: Text(
                                      "Shown:",
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: Text(
                                    "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec et varius diam.",
                                    textAlign: TextAlign.end,
                                  ),
                                )
                              ],
                            ),
                            Row(
                              children: <Widget>[
                                Expanded(
                                  child: Text(
                                    "Style:",
                                    textAlign: TextAlign.start,
                                  ),
                                ),
                                Expanded(
                                  child: Text(
                                    "Lorem ipsum ",
                                    textAlign: TextAlign.end,
                                  ),
                                )
                              ],
                            ),
                            Text(
                                "Donec lobortis massa nisl, vel consequat arcu iaculis id. Mauris fringilla nisl justo, in fringilla lacus placerat accumsan. Etiam in ipsum nec ipsum vulputate dignissim at id eros. Morbi iaculis sem at velit dictum, ut scelerisque magna commodo. Cras aliquet gravida quam vitae efficitur. ")
                          ],
                        ),
                        Column(
                          children: <Widget>[
                            Row(
                              children: <Widget>[
                                Expanded(
                                  child: Text(
                                    "Product Review",
                                    textAlign: TextAlign.start,
                                  ),
                                ),
                                Expanded(
                                  child: GestureDetector(
                                    child: Text(
                                      "See More",
                                      textAlign: TextAlign.end,
                                      style: TextStyle(color: Colors.lightBlue),
                                    ),
                                    onTap: () {
                                      Navigator.of(context).push(
                                          MaterialPageRoute(builder: (context) {
                                        return ReviewScreen();
                                      }));
                                    },
                                  ),
                                )
                              ],
                            ),
                            Row(
                              children: <Widget>[
                                StarRating(
                                  averageRating: 4.5,
                                ),
                                Text("4.5 (5 reviews)")
                              ],
                            ),
                            Visibility(
                                visible: (item.reviews ?? []).length > 0,
                                child: Container(
                                    child: ((item.reviews ?? []).length > 0)
                                        ? ReviewView(item.reviews[0])
                                        : Container()))
                          ],
                        ),
                        //TODO There must be a better way around nested StreamBuilders
                        StreamBuilder<List<Item>>(
                            stream: bloc.itemStream,
                            builder: (context, snapshot) {
                              if (!snapshot.hasData) return Container();
                              var items = snapshot.data;

                              return Column(
                                children: <Widget>[
                                  Text("You Might Also Like"),
                                  SingleChildScrollView(
                                      scrollDirection: Axis.horizontal,
                                      child: Flex(
                                          direction: Axis.horizontal,
                                          children: [0, 1, 2]
                                              .map<ItemView>(
                                                (i) => ItemView(
                                                    item: items[Random()
                                                        .nextInt(
                                                            items.length)]),
                                              )
                                              .toList()))
                                ],
                              );
                            })
                      ],
                    ),
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    children: <Widget>[
                      Expanded(
                        child: RaisedButton(
                          color: Colors.lightBlue,
                          child: Text(
                            "Add to Cart",
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                          onPressed: () {
                            cartBloc.addToCart(item);
                          },
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          );
        });
  }
}

class FavoriteIcon extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _FavoriteIconState();
}

class _FavoriteIconState extends State<FavoriteIcon> {
  bool fav = false;

  @override
  Widget build(BuildContext context) {
    Icon icon = fav
        ? Icon(
            Icons.favorite,
            color: Colors.pink,
          )
        : Icon(
            Icons.favorite_border,
            color: Colors.grey,
          );
    return GestureDetector(
      child: icon,
      onTap: () {
        setState(() {
          fav = !fav;
          var text =
              fav ? "Item added to favorites" : "Item Removed from favorites";
          Scaffold.of(context).showSnackBar(SnackBar(
            content: Text(text),
            action: SnackBarAction(
              label: "Undo",
              onPressed: () {
                setState(() {
                  fav = !fav;
                });
              },
            ),
          ));
        });
      },
    );
  }
}
