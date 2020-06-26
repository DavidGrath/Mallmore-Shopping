import 'package:flutter/material.dart';
import '../models/Item.dart';
import '../models/Review.dart';
import '../bloc/ItemBloc.dart';
import '../bloc/BlocProvider.dart';
import '../templates/review_view.dart';
import './write_review_screen.dart';

const int REVIEWS_ALL = 0;
const int REVIEWS_ONE = 1;
const int REVIEWS_TWO = 2;
const int REVIEWS_THREE = 3;
const int REVIEWS_FOUR = 4;
const int REVIEWS_FIVE = 5;

class ReviewScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _ReviewScreenState();
}

class _ReviewScreenState extends State<ReviewScreen> {
  var filterStars = REVIEWS_ALL;
  @override
  Widget build(BuildContext context) {
    var bloc = BlocProvider.of<ItemBloc>(context);
    return StreamBuilder<Item>(
        stream: bloc.singleItem,
        builder: (context, snapshot) {
          if (!snapshot.hasData) return Container();
          var item = snapshot.data;
          var reviews = item.reviews;
          return Scaffold(
            appBar: AppBar(
              title: Text("${item.reviews.length} Reviews"),
            ),
            body: Container(
              padding: EdgeInsets.all(10.0),
              child: Column(
                children: <Widget>[
                  Expanded(
                    child: ListView(
                      children: <Widget>[
                        SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Flex(
                            direction: Axis.horizontal,
                            children: <Widget>[
                              FlatButton(
                                color: filterStars == REVIEWS_ALL
                                    ? Colors.lightBlue[100]
                                    : Colors.white,
                                textColor: Colors.lightBlue,
                                child: Text("All"),
                                onPressed: () {
                                  setState(() {
                                    filterStars = REVIEWS_ALL;
                                  });
                                },
                              ),
                              FlatButton(
                                color: filterStars == REVIEWS_ONE
                                    ? Colors.lightBlue[100]
                                    : Colors.white,
                                textColor: Colors.lightBlue,
                                child: Row(children: <Widget>[
                                  Icon(Icons.star),
                                  Text("1")
                                ]),
                                onPressed: () {
                                  setState(() {
                                    filterStars = REVIEWS_ONE;
                                  });
                                },
                              ),
                              FlatButton(
                                color: filterStars == REVIEWS_TWO
                                    ? Colors.lightBlue[100]
                                    : Colors.white,
                                textColor: Colors.lightBlue,
                                child: Row(children: <Widget>[
                                  Icon(Icons.star),
                                  Text("2")
                                ]),
                                onPressed: () {
                                  setState(() {
                                    filterStars = REVIEWS_TWO;
                                  });
                                },
                              ),
                              FlatButton(
                                color: filterStars == REVIEWS_THREE
                                    ? Colors.lightBlue[100]
                                    : Colors.white,
                                textColor: Colors.lightBlue,
                                child: Row(children: <Widget>[
                                  Icon(Icons.star),
                                  Text("3")
                                ]),
                                onPressed: () {
                                  setState(() {
                                    filterStars = REVIEWS_THREE;
                                  });
                                },
                              ),
                              FlatButton(
                                color: filterStars == REVIEWS_FOUR
                                    ? Colors.lightBlue[100]
                                    : Colors.white,
                                textColor: Colors.lightBlue,
                                child: Row(children: <Widget>[
                                  Icon(Icons.star),
                                  Text("4")
                                ]),
                                onPressed: () {
                                  setState(() {
                                    filterStars = REVIEWS_FOUR;
                                  });
                                },
                              ),
                              FlatButton(
                                color: filterStars == REVIEWS_FIVE
                                    ? Colors.lightBlue[100]
                                    : Colors.white,
                                textColor: Colors.lightBlue,
                                child: Row(children: <Widget>[
                                  Icon(Icons.star),
                                  Text("5")
                                ]),
                                onPressed: () {
                                  setState(() {
                                    filterStars = REVIEWS_FIVE;
                                  });
                                },
                              )
                            ],
                          ),
                        ),
                        Column(
                          children: reviews
                              .where((r) => (filterStars == REVIEWS_ALL)
                                  ? true
                                  : (r.rating == filterStars))
                              .map<ReviewView>((r) => ReviewView(r))
                              .toList(),
                        )
                      ],
                    ),
                  ),
                  Row(
                    children: <Widget>[
                      Expanded(
                        child: RaisedButton(
                          child: Text("Write Review"),
                          color: Colors.lightBlue,
                          onPressed: () {
                            Navigator.of(context)
                                .push(MaterialPageRoute(builder: (context) {
                              return WriteReviewScreen();
                            }));
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
