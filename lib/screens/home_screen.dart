import 'package:flutter/material.dart';
import './shopping_screen.dart';
import './account_screen.dart';
import './cart_screen.dart';
import './explore_screen.dart';
import './offer_screen.dart';
import '../utils/Constants.dart';
import '../utils/item_search_delegate.dart';
import '../templates/counted_cart.dart';
import '../bloc/BlocProvider.dart';
import '../bloc/CartBloc.dart';
import '../bloc/ItemBloc.dart';
import '../models/Item.dart';
import './item_screen.dart';
import '../templates/ItemView.dart';
import '../templates/pageview_indicator.dart';
import '../templates/shopping_category.dart';
import 'dart:math';

class HomeScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _HomeScreenState();
  }
}

class _HomeScreenState extends State<HomeScreen> {
  int _currIndex = 0;
  var titles = ["Mallmore Shopping", "Explore", "Cart", "Offer", "Account"];
  var screens = [
    HomePage(),
    ExploreScreen(),
    CartScreen(),
    OfferScreen(),
    AccountScreen()
  ];

  @override
  Widget build(BuildContext context) {
    var cartBloc = BlocProvider.of<CartBloc>(context);

    return Scaffold(
        appBar: AppBar(
          title: Text("Mallmore Shopping"),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.search),
              onPressed: () async {
                var result = await showSearch<Item>(
                    context: context, delegate: ItemSearchDelegate());
                if (result != null) {
                  var itemBloc = BlocProvider.of<ItemBloc>(context);
                  itemBloc.setSingleItem(result);
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (context) {
                    return ItemDetailScreen();
                  }));
                }
              },
            ),
            IconButton(
              icon: Icon(Icons.favorite_border),
              onPressed: () {},
            ),
            IconButton(
              icon: Stack(
                overflow: Overflow.visible,
                children: <Widget>[
                  Icon(Icons.notifications),
                  Positioned(
                    top: 2.0,
                    right: 2.0,
                    child: Material(
                      type: MaterialType.circle,
                      color: Colors.red,
                      child: Padding(
                        padding: EdgeInsets.all(4.0),
                      ),
                    ),
                  )
                ],
              ),
              onPressed: () {},
            )
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
          selectedItemColor: Colors.lightBlue,
          unselectedItemColor: Colors.grey,
          currentIndex: _currIndex,
          onTap: (i) {
            setState(() {
              _currIndex = i;
            });
          },
          items: [
            BottomNavigationBarItem(
              title: Text("Home"),
              icon: Icon(
                Icons.home,
              ),
            ),
            BottomNavigationBarItem(
              title: Text("Explore"),
              icon: Icon(
                Icons.search,
              ),
            ),
            BottomNavigationBarItem(
              title: Text("Cart"),
              icon: StreamBuilder(
                initialData: 0,
                stream: cartBloc.cartCountStream,
                builder: (context, snapshot) {
                  var count = snapshot.data as int;
                  return CountedCart(count: count);
                },
              ),
            ),
            BottomNavigationBarItem(
              title: Text("Offer"),
              icon: Icon(Icons.local_offer),
            ),
            BottomNavigationBarItem(
              title: Text("Account"),
              icon: Icon(Icons.person),
            ),
          ],
        ),
        body: screens[_currIndex]);
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
    var itemBloc = BlocProvider.of<ItemBloc>(context);

    return StreamBuilder<List<Item>>(
        stream: itemBloc.itemStream,
        builder: (context, snapshot) {
          if (!snapshot.hasData) return Container();
          var items = snapshot.data;
          return Container(
              child: Padding(
                  padding: EdgeInsets.all(10.0),
                  child: SingleChildScrollView(
                      child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      // SizedBox.expand(
                      // child:
                      Stack(
                        alignment: Alignment.center,
                        children: <Widget>[
                          ClipRRect(
                            borderRadius: BorderRadius.circular(10.0),
                            child: ColorFiltered(
                              colorFilter: ColorFilter.mode(
                                  Colors.grey, BlendMode.modulate),
                              child: Image(
                                image: AssetImage("images/shoes_pixabay_2.jpg"),
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.all(10.0),
                            child: Column(
                              children: <Widget>[
                                Align(
                                    alignment: Alignment.centerLeft,
                                    child: Text(
                                      "Super Flash Sale\n50% Off",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 25.0,
                                          height: 1.5,
                                          fontWeight: FontWeight.bold),
                                    )),
                                Row(
                                  children: <Widget>[
                                    Container(
                                      margin: EdgeInsets.all(4.0),
                                      padding: EdgeInsets.all(15.0),
                                      decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius:
                                              BorderRadius.circular(7.0)),
                                      child: Text(
                                        "03",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                    Text(
                                      ":",
                                      style: TextStyle(color: Colors.white),
                                    ),
                                    Container(
                                      margin: EdgeInsets.all(4.0),
                                      padding: EdgeInsets.all(15.0),
                                      decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius:
                                              BorderRadius.circular(7.0)),
                                      child: Text("37",
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold)),
                                    ),
                                    Text(
                                      ":",
                                      style: TextStyle(color: Colors.white),
                                    ),
                                    Container(
                                      margin: EdgeInsets.all(4.0),
                                      padding: EdgeInsets.all(15.0),
                                      decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius:
                                              BorderRadius.circular(7.0)),
                                      child: Text("20",
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold)),
                                    )
                                  ],
                                ),
                              ],
                            ),
                          )
                        ],
                        // ),
                      ),
                      PageViewIndicator(
                        size: 5,
                        index: 2,
                      ),
                      Row(children: <Widget>[
                        Expanded(
                          child: Text(
                            "Category",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 14.0),
                            textAlign: TextAlign.start,
                          ),
                        ),
                        Expanded(
                          child: Text(
                            "More Categories",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 14.0,
                                color: Colors.lightBlue),
                            textAlign: TextAlign.end,
                          ),
                        ),
                      ]),
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Flex(
                          direction: Axis.horizontal,
                          children: <Widget>[
                            ShoppingCategory(
                              category: itemBloc.categories.firstWhere(
                                  (cat) => cat.constant == CATEGORY_MEN_SHIRT),
                            ),
                            ShoppingCategory(
                              category: itemBloc.categories.firstWhere(
                                  (cat) => cat.constant == CATEGORY_DRESS),
                            ),
                            ShoppingCategory(
                              category: itemBloc.categories.firstWhere((cat) =>
                                  cat.constant == CATEGORY_WORK_EQUIPMENT),
                            ),
                            ShoppingCategory(
                              category: itemBloc.categories.firstWhere(
                                  (cat) => cat.constant == CATEGORY_HANDBAG),
                            ),
                            ShoppingCategory(
                              category: itemBloc.categories.firstWhere(
                                  (cat) => cat.constant == CATEGORY_SHOES_MEN),
                            ),
                            ShoppingCategory(
                              category: itemBloc.categories.firstWhere(
                                  (cat) => cat.constant == CATEGORY_SKIRT),
                            )
                          ],
                        ),
                      ),
                      Row(children: <Widget>[
                        Expanded(
                          child: Text(
                            "Flash Sale",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 14.0),
                            textAlign: TextAlign.start,
                          ),
                        ),
                        Expanded(
                          child: Text(
                            "See More",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 14.0,
                                color: Colors.lightBlue),
                            textAlign: TextAlign.end,
                          ),
                        ),
                      ]),
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Flex(
                            direction: Axis.horizontal,
                            children: [0, 1, 2]
                                .map<ItemView>(
                                  (item) => ItemView(
                                      item: items[
                                          Random().nextInt(items.length)]),
                                )
                                .toList()),
                      ),
                      Row(children: <Widget>[
                        Expanded(
                          child: Text(
                            "Mega Sale",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 14.0),
                            textAlign: TextAlign.start,
                          ),
                        ),
                        Expanded(
                          child: Text(
                            "See More",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 14.0,
                                color: Colors.lightBlue),
                            textAlign: TextAlign.end,
                          ),
                        ),
                      ]),
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Flex(
                            direction: Axis.horizontal,
                            children: [0, 1, 2]
                                .map<ItemView>(
                                  (item) => ItemView(
                                      item: items[
                                          Random().nextInt(items.length)]),
                                )
                                .toList()),
                      ),
                      Stack(
                        alignment: Alignment.center,
                        children: <Widget>[
                          ClipRRect(
                              borderRadius: BorderRadius.circular(10.0),
                              child: Image(
                                image: AssetImage(
                                    "images/fashion_shoes_pixabay.jpg"),
                                width: MediaQuery.of(context).size.width,
                              )),
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Column(
                              children: <Widget>[
                                Text("Recommended Product",
                                    style: TextStyle(
                                        fontSize: 30.0,
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold)),
                                SizedBox(
                                  height: 20,
                                ),
                                Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    "We recommend only the best for you",
                                    textAlign: TextAlign.start,
                                    style: TextStyle(color: Colors.white),
                                  ),
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                      Wrap(
                          alignment: WrapAlignment.spaceBetween,
                          children: [0, 1, 2, 3]
                              .map<ItemView>(
                                (item) => ItemView(
                                    item:
                                        items[Random().nextInt(items.length)]),
                              )
                              .toList()),
                    ],
                  ))));
        });
  }
}
