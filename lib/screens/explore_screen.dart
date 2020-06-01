import 'package:flutter/material.dart';
import '../templates/shopping_category.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../models/Category.dart';
import '../bloc/ItemBloc.dart';
import '../bloc/BlocProvider.dart';
import '../utils/Constants.dart';

class ExploreScreen extends StatelessWidget {
  var sectionOneCats = <ShoppingCategory>[];
  var sectionTwoCats = <ShoppingCategory>[];

  @override
  Widget build(BuildContext context) {
    var bloc = BlocProvider.of<ItemBloc>(context);
    bloc.categories.forEach((cat) {
      if (cat.group == GROUP_MEN_FASHION) {
        sectionOneCats.add(ShoppingCategory(
          category: cat,
        ));
      }
      if (cat.group == GROUP_WOMEN_FASHION) {
        sectionTwoCats.add(ShoppingCategory(
          category: cat,
        ));
      }
    });
    return Container(
      padding: EdgeInsets.all(10.0),
      child: ListView(
        children: <Widget>[
          Section(
            title: "Man Fashion",
            categories: sectionOneCats,
          ),
          Section(
            title: "Woman Fashion",
            categories: sectionTwoCats,
          ),
        ],
      ),
    );
  }
}

class Section extends StatelessWidget {
  String title;
  List<ShoppingCategory> categories;
  Section({this.title, this.categories});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Align(
          alignment: Alignment.centerLeft,
          child: Text(
            title,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0),
          ),
        ),
        Wrap(
          alignment: WrapAlignment.start,
          children: categories,
        ),
      ],
    );
  }
}
