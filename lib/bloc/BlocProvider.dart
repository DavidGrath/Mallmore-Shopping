import 'package:flutter/material.dart';
import './Bloc.dart';

class BlocProvider<T extends Bloc> extends StatefulWidget {

  final Widget child;
  final T bloc;

  const BlocProvider({Key key, @required this.bloc, @required this.child})
    : super(key : key);

  static T of<T extends Bloc>(BuildContext buildContext) {
    final BlocProvider<T> blocProvider = buildContext.findAncestorWidgetOfExactType();
    return blocProvider.bloc;
  }

  @override
  State<StatefulWidget> createState() => _BlocProviderState();

}

class _BlocProviderState extends State<BlocProvider> {
  @override
  Widget build(BuildContext context) => widget.child;
  @override
  void dispose() {
    widget.bloc.dispose();
    super.dispose();
  }
}