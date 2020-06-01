import 'package:flutter/material.dart';
import '../models/Item.dart';
import '../models/Review.dart';
import '../bloc/ItemBloc.dart';
import '../bloc/BlocProvider.dart';

class ReviewScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var bloc = BlocProvider.of<ItemBloc>(context);
    return StreamBuilder<Item>(
        stream: bloc.singleItem,
        builder: (context, snapshot) {
          var item = snapshot.data;
          return Scaffold(
            appBar: AppBar(
              title: Text("${item.reviews.length} + Reviews"),
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
                          ),
                        )
                      ],
                    ),
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    children: <Widget>[
                      RaisedButton(
                        child: Text("Write Review"),
                        color: Colors.lightBlue,
                        onPressed: () {},
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
