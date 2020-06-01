import 'package:flutter/material.dart';
import './screens/home_screen.dart';
import './bloc/BlocProvider.dart';
import './bloc/ItemBloc.dart';
import './bloc/CartBloc.dart';

void main() => runApp(MallmoreApp());

class MallmoreApp extends StatelessWidget {
  Widget build(BuildContext context) {
    return BlocProvider<CartBloc>(
        bloc: CartBloc(),
        child: BlocProvider(
            bloc: ItemBloc(),
            child: MaterialApp(
              debugShowCheckedModeBanner: false,
              title: "Mallmore Shopping",
              theme: ThemeData(fontFamily: "VarelaRound"),
              home: HomeScreen(),
            )));
  }
}
