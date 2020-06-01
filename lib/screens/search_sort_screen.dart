import 'package:flutter/material.dart';
import '../bloc/SearchBloc.dart';
import '../utils/Constants.dart';

class SearchSortScreen extends StatefulWidget {
  SearchBloc bloc;
  SearchSortScreen({this.bloc});
  @override
  State<StatefulWidget> createState() => _SearchSortState(bloc: bloc);
}

class _SearchSortState extends State<SearchSortScreen> {
  SearchBloc bloc;
  int sort;
  List<int> sortList = [SORT_NONE, SORT_PRICE, SORT_NAME];
  List<String> titles = ["Best Match", "Price", "Name"];
  _SearchSortState({this.bloc}) {
    sort = bloc.sort;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Sort By"),
      ),
      body: Container(
        padding: EdgeInsets.all(10.0),
        child: ListView.builder(
          itemCount: sortList.length,
          itemBuilder: (context, i) {
            return ListTile(
              title: Text(
                titles[i],
                style: TextStyle(
                    color: (sort == sortList[i])
                        ? Colors.lightBlue
                        : Colors.black),
              ),
              onTap: () {
                setState(() {
                  sort = sortList[i];
                  bloc.sort = sort;
                  Navigator.of(context).pop();
                });
              },
            );
          },
        ),
      ),
    );
  }
}
