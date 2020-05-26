import 'package:flutter/material.dart';
import './shopping_screen.dart';
import './account_screen.dart';
import './cart_screen.dart';
import '../utils/Constants.dart';
import '../templates/counted_cart.dart';
import '../bloc/BlocProvider.dart';
import '../bloc/CartBloc.dart';
import '../bloc/ItemBloc.dart';
import '../models/Item.dart';
import '../screens/item_screen.dart';


class HomeScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _HomeScreenState();
  }
}

class _HomeScreenState extends State<HomeScreen> {

  String mainName = "HOME";
  String title = "Mallmore Shopping";
  Widget home = HomePage();
  Widget cartScreen = CartScreen();

  @override
  Widget build(BuildContext context) {
    Widget main;
    switch(mainName) {
      case "HOME":
        main = home;
        title = "Mallmore Shopping";
        break;
      case "CART":
        main = cartScreen;
        title = "Cart";
        break;
      default:
        main = home;
        title = "Mallmore Shopping";
        break;
    }
    var cartBloc = BlocProvider.of<CartBloc>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () async {
              var result = await showSearch<Item>(context: context, delegate: ItemSearchDelegate());
              if(result != null) {
                var itemBloc = BlocProvider.of<ItemBloc>(context);
                itemBloc.setSingleItem(result);
                Navigator.of(context).push(MaterialPageRoute(builder: (context){
                  return ItemDetailScreen();
                }));
              }
            },
          )
        ],
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              child: Text("Mallmore Shopping",
              style: TextStyle(
                fontSize: 30.0,
                fontWeight: FontWeight.bold
              ),),
              decoration: BoxDecoration(
                color: Colors.lightBlue
              ),
            ),
            ListTile(
              title: Text("Home"),
              leading: Icon(Icons.home),
              onTap: (){
                setState(() {
                  mainName = "HOME";
                  Navigator.of(context).pop();
                });
              },
            ),
            ListTile(
              title: Text("Cart"),
              leading: Icon(Icons.shopping_cart),
              trailing: StreamBuilder(
                initialData: 0,
                stream: cartBloc.cartCountStream,
                builder: (context, snapshot){
                  var count = snapshot.data as int;
                  return CountedCart(count : count);
                },
              ),
              onTap: (){
                Navigator.pop(context);
                Navigator.push(context, MaterialPageRoute(builder: (context){
                return CartScreen();
                }));
              },
            ),
            ListTile(
              title: Text("Offer"),
              leading: Icon(Icons.local_offer),
            ),
            ListTile(
              title: Text("Account"),
              leading: Icon(Icons.person),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(context, MaterialPageRoute(builder: (context){
                  return AccountScreen();
                }));
              },
            ),
            ListTile(
              title: Text("Settings"),
              leading: Icon(Icons.settings),
            ),
          ],
        ),
      ),
      body : main
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

class ItemSearchDelegate extends SearchDelegate<Item> {
  @override
  List<Widget> buildActions(BuildContext context) {
      return <Widget>[
        IconButton(
          icon: Icon(Icons.clear),
          onPressed: (){
            query = "";
          },
        )
      ];
    }
  
    @override
    Widget buildLeading(BuildContext context) {
      return IconButton(
        icon: Icon(Icons.arrow_back),
        onPressed: (){
          close(context, null);
        },
        );
    }
  
    @override
    Widget buildResults(BuildContext context) {
      var itemBloc = BlocProvider.of<ItemBloc>(context);
      return StreamBuilder<List<Item>>(
        stream: itemBloc.itemStream,
        builder : (context, snapshot) {
          var results = snapshot.data.where((item)=>item.name.toLowerCase().contains(query));
          
          if(!snapshot.hasData || results.isEmpty) {
            return Center(
              child : Text("No Results")
            );
          }
          
          return ListView(
            children: results.map<ListTile>((item)=>
            ListTile(
                title: Text(item.name),
                onTap: (){
                  close(context, item);
                },
            )
            ).toList()
          );
        }
      );
    }
  
    @override
    Widget buildSuggestions(BuildContext context) {
      return ListView(
        children: <Widget>[
          ListTile(
            title: Text("You've been here before, havent'cha"),
          )
        ],
      );
    }

}