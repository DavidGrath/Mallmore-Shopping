import 'package:flutter/material.dart';
import '../screens/shopping_screen.dart';
import '../models/Category.dart';

class ShoppingCategory extends StatelessWidget {
  Category category;

  ShoppingCategory({Key key, this.category}) : super(key: key);

  var categoryStyle = TextStyle(
    fontSize: 11,
  );

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        margin: const EdgeInsets.all(5.0),
        width: 70,
        child: Padding(
          padding: EdgeInsets.all(4.0),
          child: Column(
            children: <Widget>[
              Container(
                padding: EdgeInsets.all(17.0),
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      width: 0.5,
                      color: Colors.lightBlue,
                    )),
                child: ColorFiltered(
                  colorFilter:
                      ColorFilter.mode(Colors.lightBlue, BlendMode.dst),
                  child: (category.image != null)? Image(
                    image: AssetImage(category.image),
                    height: 24,
                    color: Colors.lightBlue,
                  ) : null,
                ),
              ),
              SizedBox(
                height: 10.0,
              ),
              Text(
                category.title,
                style: categoryStyle,
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return ShoppingScreen(category);
        }));
      },
    );
  }
}
