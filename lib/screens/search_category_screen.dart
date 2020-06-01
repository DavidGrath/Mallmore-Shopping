import 'package:flutter/material.dart';
import '../utils/Constants.dart';
import '../bloc/SearchBloc.dart';
import '../bloc/BlocProvider.dart';

class SearchCategoryScreen extends StatefulWidget {
  SearchBloc bloc;
  SearchCategoryScreen({this.bloc});
  @override
  State<StatefulWidget> createState() => _SearchCategoryState(bloc: bloc);
}

class _SearchCategoryState extends State<SearchCategoryScreen> {
  int category;
  SearchBloc bloc;
  _SearchCategoryState({this.bloc}) {
    category = bloc.category;
  }
  @override
  Widget build(BuildContext context) {
    var categories = bloc.categories;
    return Scaffold(
      appBar: AppBar(
        title: Text("Category"),
      ),
      body: Container(
        padding: EdgeInsets.all(10.0),
        child: ListView.builder(
          itemCount: categories.length,
          itemBuilder: (context, i) {
            return ListTile(
              leading: ColorFiltered(
                colorFilter: ColorFilter.mode(Colors.lightBlue, BlendMode.dst),
                child: (categories[i].image != null)
                    ? Image(
                        image: AssetImage(categories[i].image),
                        height: 24,
                        color: Colors.lightBlue,
                      )
                    : null,
              ),
              title: Text(
                categories[i].title,
                style: TextStyle(
                    color: (categories[i].constant == category)
                        ? Colors.lightBlue
                        : Colors.black),
              ),
              onTap: () {
                setState(() {
                  category = categories[i].constant;
                  bloc.category = categories[i].constant;
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
