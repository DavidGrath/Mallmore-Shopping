import '../models/User.dart';
import '../models/Review.dart';
import './star_rating.dart';
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';

class ReviewView extends StatelessWidget {
  Review review;
  ReviewView(this.review);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10.0),
      child: Column(
        children: <Widget>[
          ListTile(
            leading: CircleAvatar(
              child: (review.owner.profile != null)
                  ? Image(image: AssetImage(review.owner.profile))
                  : Icon(Icons.person),
              radius: 36,
            ),
            title: Text("${review.owner.fName} ${review.owner.lName}"),
            subtitle: StarRating(
              averageRating: review.rating.toDouble(),
            ),
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: Text(review.content),
          ),
          Visibility(
            visible: ((review.pictures ?? []).length > 0),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Flex(
                direction: Axis.horizontal,
                children: (review.pictures != null)
                    ? review.pictures.map<Widget>((p) {
                        return Container(
                          margin: EdgeInsets.all(4.0),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(7.0),
                            child: p,
                          ),
                        );
                      }).toList()
                    : [],
              ),
            ),
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              DateFormat.yMMMd()
                  .format(DateTime.fromMillisecondsSinceEpoch(review.date)),
            ),
          )
        ],
      ),
    );
  }
}
