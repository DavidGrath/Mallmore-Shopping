import 'package:flutter/material.dart';

class AddAddressScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _AddAddressState();
}

class _AddAddressState extends State<AddAddressScreen> {
  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add Address"),
      ),
      body: Container(
        padding: EdgeInsets.all(10.0),
      ),
    );
  }
}
