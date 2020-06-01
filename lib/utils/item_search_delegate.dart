import 'package:flutter/material.dart';
import '../models/Item.dart';
import '../bloc/SearchBloc.dart';
import '../templates/ItemView.dart';
import '../screens/search_filter_screen.dart';
import '../screens/search_sort_screen.dart';
import '../screens/search_category_screen.dart';

class ItemSearchDelegate extends SearchDelegate<Item> {
  var searchBloc = SearchBloc();

  @override
  ThemeData appBarTheme(BuildContext context) {
    assert(context != null);
    final data = Theme.of(context);
    assert(data != null);
    return data;
  }

  @override
  List<Widget> buildActions(BuildContext context) {
    return <Widget>[
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: () {
          query = "";
        },
      ),
      IconButton(
        icon: Icon(Icons.sort),
        onPressed: () {
          Navigator.of(context).push(MaterialPageRoute(builder: (context) {
            return SearchSortScreen(
              bloc: searchBloc,
            );
          }));
        },
      ),
      IconButton(
        icon: Icon(Icons.filter_list),
        onPressed: () {
          Navigator.of(context).push(MaterialPageRoute(builder: (context) {
            return SearchFilterScreen(
              bloc: searchBloc,
            );
          }));
        },
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.arrow_back),
      onPressed: () {
        close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return StreamBuilder<List<Item>>(
        stream: searchBloc.resultStream,
        builder: (context, snapshot) {
          var results = (query != '' && snapshot.hasData)
              ? snapshot.data.where((item) =>
                  item.name.toLowerCase().contains(query.toLowerCase()))
              : <Item>[];
          Widget body;
          if (snapshot.connectionState == ConnectionState.waiting) {
            body = Center(
              child: CircularProgressIndicator(),
            );
          }
          if (results.isEmpty) {
            body = Center(child: Text("No Results empty"));
          }

          body = ListView(
            children: <Widget>[
              Center(
                child: Wrap(
                    // spacing: 10.0,
                    alignment: WrapAlignment.start,
                    children: results
                        .map<Widget>((item) => GestureDetector(
                              child: ItemView(item: item),
                              onTap: () {
                                close(context, item);
                              },
                            ))
                        .toList()),
              ),
            ],
          );
          return Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text("${results.length} results")),
                    ),
                    Align(
                        alignment: Alignment.centerRight,
                        child: GestureDetector(
                          child: Row(
                            children: <Widget>[
                              Text(searchBloc.categories
                                  .firstWhere((cat) =>
                                      cat.constant == searchBloc.category)
                                  .title),
                              Icon(
                                Icons.keyboard_arrow_down,
                                size: 16,
                              )
                            ],
                          ),
                          onTap: () {
                            Navigator.of(context)
                                .push(MaterialPageRoute(builder: (context) {
                              return SearchCategoryScreen(bloc: searchBloc);
                            }));
                          },
                        )),
                  ],
                ),
              ),
              Expanded(
                child: body,
              ),
            ],
          );
        });
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return StreamBuilder<List<Item>>(
        stream: searchBloc.itemsStream,
        builder: (context, snapshot) {
          var results = (query != '')
              ? snapshot.data
                  .where((item) => item.name.toLowerCase().contains(query))
                  .toList()
              : <Item>[];
          return ListView.builder(
            itemCount: results.length,
            itemBuilder: (context, i) {
              return ListTile(
                title: Text(results[i].name),
                onTap: () {
                  query = results[i].name;
                },
              );
            },
          );
        });
  }
}
