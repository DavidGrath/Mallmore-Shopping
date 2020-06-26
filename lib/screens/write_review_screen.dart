import 'package:flutter/material.dart';

class WriteReviewScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _WriteReviewState();
}

class _WriteReviewState extends State<WriteReviewScreen> {
  int rating = 0;
  var reviewController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    var starRow = [1, 2, 3, 4, 5].map<Widget>((i) {
      return IconButton(
        icon: Icon((rating >= i) ? Icons.star : Icons.star_border),
        onPressed: () {
          setState(() {
            rating = i;
          });
        },
      );
    }).toList();
    starRow.addAll(<Widget>[Text("$rating/5")]);

    return Scaffold(
      appBar: AppBar(
        title: Text("Write Review"),
      ),
      body: Container(
        padding: EdgeInsets.all(10.0),
        child: Column(
          children: <Widget>[
            Expanded(
              child: ListView(
                children: <Widget>[
                  Text(
                      "Please write your overall level of satisfaction with your shipping/delivery service"),
                  Row(children: starRow),
                  Text("Write your review"),
                  TextField(
                    minLines: 5,
                    maxLines: 5,
                    decoration: InputDecoration(
                        hintText: "Write your review Here",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        )),
                  ),
                  Row(
                    children: <Widget>[
                      Container(
                        width: 50,
                        height: 50,
                        padding: EdgeInsets.all(10.0),
                        decoration: BoxDecoration(
                          border: Border.all(
                            width: 1.0,
                          ),
                          borderRadius: BorderRadius.circular(4.0),
                        ),
                        child: Icon(Icons.add),
                      ),
                    ],
                  )
                ],
              ),
            ),
            Row(
              children: <Widget>[
                Expanded(
                  child: RaisedButton(
                    color: Colors.lightBlue,
                    child: Text("Post"),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
