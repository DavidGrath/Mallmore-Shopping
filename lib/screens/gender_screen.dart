import 'package:flutter/material.dart';

class GenderScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _GenderScreenState();
}

class _GenderScreenState extends State<GenderScreen> {
  var genders = ["Male", "Female"];
  var currGender = "";
  @override
  void initState() {
    currGender = genders[0];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Gender"),
      ),
      body: Container(
        padding: EdgeInsets.all(10.0),
        child: ListView(
          children: <Widget>[
            Row(
              children: <Widget>[Text("Choose Gender")],
            ),
            DropdownButton<String>(
              value: currGender,
              isExpanded: true,
              items: genders
                  .map<DropdownMenuItem<String>>((gen) => DropdownMenuItem(
                        value: gen,
                        child: Text(gen),
                      ))
                  .toList(),
              onChanged: (value) {
                setState(() {
                  currGender = value;
                });
              },
            )
          ],
        ),
      ),
    );
  }
}
