import 'package:flutter/material.dart';
import '../bloc/SearchBloc.dart';

class SearchFilterScreen extends StatefulWidget {
  SearchBloc bloc;
  RangeValues values;
  SearchFilterScreen({this.bloc}) {
    values = bloc.priceRange;
  }
  @override
  State<StatefulWidget> createState() =>
      _SearchFilterState(bloc: bloc, values: values);
}

class _SearchFilterState extends State<SearchFilterScreen> {
  SearchBloc bloc;
  RangeValues values;
  _SearchFilterState({this.bloc, this.values});
  @override
  Widget build(BuildContext context) {
    var minController =
        TextEditingController(text: values.start.toStringAsFixed(3));
    var maxController =
        TextEditingController(text: values.end.toStringAsFixed(3));
    return Scaffold(
      appBar: AppBar(
        title: Text("Filter Search"),
      ),
      body: Container(
          padding: EdgeInsets.all(10.0),
          child: Column(
            children: <Widget>[
              Expanded(
                child: ListView(
                  children: <Widget>[
                    Text("Price Range"),
                    Row(
                      children: <Widget>[
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: TextField(
                              controller: minController,
                              readOnly: true,
                              decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                      borderRadius:
                                          BorderRadius.circular(10.0))),
                            ),
                          ),
                        ),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: TextField(
                              controller: maxController,
                              readOnly: true,
                              decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                      borderRadius:
                                          BorderRadius.circular(10.0))),
                            ),
                          ),
                        )
                      ],
                    ),
                    RangeSlider(
                      min: 0,
                      max: 1000,
                      values: values,
                      onChanged: (range) {
                        setState(() {
                          values = range;
                          minController.text = range.start.toStringAsFixed(3);
                          maxController.text = range.end.toStringAsFixed(3);
                        });
                      },
                    )
                  ],
                ),
              ),
              Row(
                children: <Widget>[
                  Expanded(
                    child: RaisedButton(
                      color: Colors.lightBlue,
                      child: Text("Apply"),
                      onPressed: () {
                        bloc.priceRange = values;
                        Navigator.of(context).pop();
                      },
                    ),
                  )
                ],
              )
            ],
          )),
    );
  }
}
