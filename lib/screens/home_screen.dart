import 'package:flutter/material.dart';
import './shopping_screen.dart';
import './cart_screen.dart';
import '../utils/Constants.dart';
import '../templates/counted_cart.dart';
import '../bloc/BlocProvider.dart';
import '../bloc/CartBloc.dart';


class HomeScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _HomeScreenState();
  }
}

class _HomeScreenState extends State<HomeScreen> {

  @override
  Widget build(BuildContext context) {

    var cartBloc = BlocProvider.of<CartBloc>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text("Mallmore Shopping"),
        actions: <Widget>[
          StreamBuilder(
                initialData: 0,
                stream: cartBloc.cartCountStream,
                builder: (context, snapshot){
                  var count = snapshot.data as int;
                  return CountedCart(count : count);
                },
              ),
        ],
      ),
      body : HomePage()
    );
  }

}

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _HomePageState();
  }

}

class _HomePageState extends State<HomePage> {

  @override
  Widget build(BuildContext context) {
    return Container(
        child : Padding(
          padding : EdgeInsets.all(10.0),
          child : Container(
            child : ListView(
              children: <Widget>[
                Text(
                  "Shop By Category",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20.0
                  ),
                ),
                Row(
                  children: <Widget>[
                    Expanded(child: 
                    ShoppingCategory(icon : Icons.computer, title : "Electronics", CATEGORY: CATEGORY_ELECTRONICS,),
                    ),
                    Expanded(child: 
                    ShoppingCategory(icon : Icons.fastfood, title : "Food and Drink", CATEGORY: CATEGORY_FOOD_AND_DRINK,),
                    ),
                  ],
                ),
                Row(
                  children: <Widget>[
                    Expanded(child: 
                    ShoppingCategory(icon : Icons.home, title : "Home and Office", CATEGORY: CATEGORY_HOME_AND_OFFICE,),
                    ),
                    Expanded(child: 
                    ShoppingCategory(icon : Icons.gamepad, title : "Video Games", CATEGORY: CATEGORY_VIDEO_GAMES,),
                    )
                  ],
                )
              ],
            )
          )
          )
    );
  }

}

class ShoppingCategory extends StatelessWidget {

IconData icon;
String title;
int CATEGORY;

ShoppingCategory({Key key, this.icon, this.title, this.CATEGORY}) : super(key : key);

var categoryStyle = TextStyle(
    fontSize: 16
  );

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        child : Card(
          child : Padding(
            padding: EdgeInsets.only(top: 15.0, bottom: 15.0),
              child : Column(
                children: <Widget>[
                  Text(title,
                    style: categoryStyle,
                  ),
                  Icon(icon, size: 60,),
                ],
              ),
          ),
        ),
      onTap: (){
        Navigator.push(context, MaterialPageRoute(builder : (context){
          return ShoppingScreen(CATEGORY);
        }));
      },
    );
  }

}