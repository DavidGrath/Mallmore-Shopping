import 'package:flutter/material.dart';

class PhoneNumScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _PhoneNumScreenState();
}

class _PhoneNumScreenState extends State<PhoneNumScreen> {
  var phoneNum = "+234 70 1234 5678";
  var controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    controller.text = phoneNum;

    return Scaffold(
      appBar: AppBar(
        title: Text("Phone Number"),
      ),
      body: Container(
        padding: EdgeInsets.all(10.0),
        child: Column(
          children: <Widget>[
            Expanded(
              child: ListView(
                children: <Widget>[
                  TextField(
                    decoration: InputDecoration(
                        prefixIcon: Icon(Icons.phone),
                        labelText: "Phone Number",
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0))),
                    controller: controller,
                  )
                ],
              ),
            ),
            Row(
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                Expanded(
                  child: RaisedButton(
                    color: Colors.lightBlue,
                    child: Text("Save"),
                    onPressed: () {},
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
