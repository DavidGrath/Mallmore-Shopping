import 'package:flutter/material.dart';

var formKey = GlobalKey<FormState>();

class FullNameScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _FullNameScreenState();
}

class _FullNameScreenState extends State<FullNameScreen> {
  @override
  Widget build(BuildContext context) {
    var fNameController = TextEditingController(text: "John");
    var lNameController = TextEditingController(text: "Doe");

    return Form(
      key: formKey,
      child: Scaffold(
        appBar: AppBar(
          title: Text("Name"),
        ),
        body: Container(
          padding: EdgeInsets.all(10.0),
          child: Column(
            children: <Widget>[
              Expanded(
                child: ListView(
                  children: <Widget>[
                    TextFormField(
                      controller: fNameController,
                      decoration: InputDecoration(
                          labelText: "First Name",
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0))),
                      validator: (fName) {
                        if (fName.isEmpty) return "Field must not be empty";
                      },
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    TextFormField(
                        controller: lNameController,
                        decoration: InputDecoration(
                            labelText: "Last Name",
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.0))),
                        validator: (lName) {
                          if (lName.isEmpty) return "Field must not be empty";
                        }),
                  ],
                ),
              ),
              Row(
                mainAxisSize: MainAxisSize.max,
                children: <Widget>[
                  Expanded(child: Builder(builder: (context) {
                    return RaisedButton(
                      child: Text("Save"),
                      color: Colors.lightBlue,
                      onPressed: () {
                        if (formKey.currentState.validate()) {
                          Scaffold.of(context).showSnackBar(SnackBar(
                            content: Text("Full Name changed Successfully"),
                          ));
                          Navigator.of(context).pop();
                        }
                      },
                    );
                  }))
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
