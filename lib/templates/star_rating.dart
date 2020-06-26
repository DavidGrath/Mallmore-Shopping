import 'package:flutter/material.dart';

class StarRating extends StatelessWidget {
  double averageRating;
  StarRating({Key key, @required this.averageRating}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double roundedRating = double.parse(averageRating.toStringAsFixed(2));
    return Row(children: _starIcons(roundedRating));
  }

  List<Widget> _starIcons(double rating) {
    double temp = rating;
    List<Widget> children = [];
    for (int i = 1; i <= 5; i++) {
      IconData data;
      if (temp >= 1) {
        data = Icons.star;
      } else if (temp >= 0.5) {
        data = Icons.star_half;
      } else {
        data = Icons.star_border;
      }
      temp = (temp - 1 >= 0) ? temp - 1 : 0.0;
      children.add(Padding(
        padding:
            EdgeInsets.only(top: 10.0, bottom: 10.0, left: 5.0, right: 5.0),
        child: Icon(data),
      ));
    }
    return children;
  }
}
