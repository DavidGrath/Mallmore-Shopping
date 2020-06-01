import 'package:flutter/material.dart';

class PageViewIndicator extends StatefulWidget {
  int size;
  int index;
  PageViewIndicator({this.size, this.index});
  _PageViewIndicatorState state;
  set currentIndex(int index) {
    state.currentIndex = index;
  }

  @override
  State<StatefulWidget> createState() {
    state = _PageViewIndicatorState(size: size, index: index);
    return state;
  }
}

class _PageViewIndicatorState extends State<PageViewIndicator> {
  int size, index;
  List<int> indices;
  int currIndex;
  _PageViewIndicatorState({this.size, this.index}) {
    indices = List.generate(size, (i) => i);
    currIndex = index;
  }

  set currentIndex(int index) {
    assert(index >= indices.length);
    setState(() {
      currIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 4, bottom: 4, left: 10.0, right: 10.0),
      child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: indices.map<Widget>((i) {
            return GestureDetector(
              child: Container(
                margin: EdgeInsets.all(7.0),
                child: Material(
                  type: MaterialType.circle,
                  color: (i == currIndex)
                      ? Colors.lightBlue
                      : Colors.lightBlue[100],
                  child: Padding(
                    padding: EdgeInsets.all(5.5),
                  ),
                ),
              ),
              onTap: () {
                setState(() {
                  currIndex = i;
                });
              },
            );
          }).toList()),
    );
  }
}
