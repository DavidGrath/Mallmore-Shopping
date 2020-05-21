import 'package:flutter/material.dart';
import './shopping_screen.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _HomeScreenState();
  }
}

class _HomeScreenState extends State<HomeScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Mallmore Shopping"),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.shopping_cart),
            onPressed: (){
              debugPrint("Go To Shopping Screen");
            },
          )
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

  var categoryStyle = TextStyle(
    fontSize: 16
  );

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
                    Expanded(
                      child : GestureDetector(
                      child : Card(
                        child : Padding(
                          padding: EdgeInsets.only(top: 15.0, bottom: 15.0),        
                        child : Column(
                          children: <Widget>[
                            Text("Electronics",
                              style: categoryStyle,
                            ),
                            Icon(Icons.computer, size: 60,),
                          ],
                        ),
                      ),
                      ),
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder : (context){
                          return ShoppingScreen(1);
                        }));
                      },
                    ),
                    ),
                    Expanded(
                      child : Card(
                        child : Padding(
                          padding: EdgeInsets.only(top: 15.0, bottom: 15.0),
                        child : Column(
                          children: <Widget>[
                            Text("Food & Drink",
                              style: categoryStyle,
                              ),
                            Icon(Icons.fastfood, size: 60,),
                          ],
                        ),
                      ),
                      )
                    )
                  ],
                ),
                Row(
                  children: <Widget>[
                    Expanded(
                      child : Card(
                        child : Padding(
                          padding: EdgeInsets.only(top: 15.0, bottom: 15.0),        
                        child : Column(
                          children: <Widget>[
                            Text("Home and Office",
                              style: categoryStyle,
                            ),
                            Icon(Icons.home, size: 60,),
                          ],
                        ),
                      ),
                      ),
                    ),
                    Expanded(
                      child : Card(
                        child : Padding(
                          padding: EdgeInsets.only(top: 15.0, bottom: 15.0),
                        child : Column(
                          children: <Widget>[
                            Text("Video Games",
                              style: categoryStyle,
                            ),
                            Icon(Icons.gamepad, size: 60,),
                          ],
                        ),
                      ),
                      )
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