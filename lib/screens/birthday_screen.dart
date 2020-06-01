import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class BirthdayScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _BirthdayScreenState();
}

class _BirthdayScreenState extends State<BirthdayScreen> {
  DateTime dateTime = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Birthday"),
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            Expanded(
              child: ListView(
                children: <Widget>[
                  Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0)),
                    padding: EdgeInsets.all(10.0),
                    child: ListTile(
                      title: Text(DateFormat.yMMMd().format(dateTime)),
                      trailing: IconButton(
                        icon: Icon(Icons.calendar_today),
                        onPressed: () async {
                          var newDate = await showDatePicker(
                              firstDate: DateTime(DateTime.now().year - 20),
                              lastDate: DateTime(DateTime.now().year + 20),
                              context: context,
                              initialDate: dateTime);
                          setState(() {
                            if (newDate != null) {
                              dateTime = newDate;
                            }
                          });
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Row(
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                Expanded(
                  child: Builder(builder: (context) {
                    return RaisedButton(
                      child: Text("Save"),
                      onPressed: () {
                        Scaffold.of(context).showSnackBar(SnackBar(
                          content: Text("Birthday Changed Successfully"),
                        ));
                        Navigator.of(context).pop();
                      },
                    );
                  }),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
