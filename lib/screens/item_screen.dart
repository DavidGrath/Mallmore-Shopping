import 'dart:async';
import 'package:flutter/material.dart';
import '../bloc/ItemBloc.dart';
import '../bloc/CartBloc.dart';
import '../bloc/BlocProvider.dart';
import '../models/Item.dart';
import '../templates/star_rating.dart';
import '../templates/counted_cart.dart';

class ItemDetailScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _ItemDetailScreenState();
}

class _ItemDetailScreenState extends State<ItemDetailScreen>{
  @override
  Widget build(BuildContext context) {
    ItemBloc bloc = BlocProvider.of<ItemBloc>(context);
    var cartBloc = BlocProvider.of<CartBloc>(context);
    var priceStyle = TextStyle(
      color: Colors.lightBlue,
      fontWeight: FontWeight.bold,
      fontSize: 20.0
    );
    return StreamBuilder(
      stream : bloc.singleItem,
      builder : (context, snapshot){
        var item = snapshot.data as Item;
        return Scaffold(
          appBar: AppBar(
            title: Text(item.name),
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
            child: ListView(
              children: <Widget>[
                Image(image: AssetImage(item.image), width: 200, height: 200,),
                Row(
                  children: <Widget>[
                    Expanded(
                      child : Text(item.name)
                    ),
                    FavoriteIcon(),
                  ],
                ),
                StarRating(averageRating: 4.5,),
                Text("${item.currencyCode}${item.price}",
                style: priceStyle,),
                RaisedButton(
                  color: Colors.lightBlue,
                  child: Text("Add to Cart",
                    style: TextStyle(
                      color: Colors.white,
                    ),),
                    onPressed: (){
                      cartBloc.addToCart(item);
                    },
                )
              ],
            ),
          ),
        );
      }
    );
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
    Icon icon = fav? 
            Icon(Icons.favorite, color: Colors.pink,): 
            Icon(Icons.favorite_border, color: Colors.grey,);
    return GestureDetector(
      child: icon,
      onTap: (){
        setState(() {         
          fav = !fav;
          var text = fav? "Item added to favorites" : "Item Removed from favorites";
          Scaffold.of(context).showSnackBar(
            SnackBar(
              content: Text(text),
              action: SnackBarAction(
                label: "Undo",
                onPressed: (){
                  setState(() {                  
                    fav = !fav;
                  });
                },
              ),
            )
          );
        });
      },
    );
  }

}