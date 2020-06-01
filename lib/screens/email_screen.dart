import 'package:flutter/material.dart';

var formKey = GlobalKey<FormState>();

class EmailScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _EmailScreenState();
}

class _EmailScreenState extends State<EmailScreen> {
  var controller = TextEditingController(text: "johndoe@example.com");

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Scaffold(
        appBar: AppBar(
          title: Text("Email"),
        ),
        body: Container(
          padding: EdgeInsets.all(10.0),
          child: Column(
            children: <Widget>[
              Expanded(
                child: ListView(
                  children: <Widget>[
                    TextFormField(
                      controller: controller,
                      decoration: InputDecoration(
                          prefixIcon: Icon(Icons.email),
                          labelText: "Change Email",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          )),
                      validator: (email) {
                        if (email.isEmpty) return "Email is Empty";
                        //TODO Other email validations
                      },
                    )
                  ],
                ),
              ),
              Row(
                children: <Widget>[
                  Expanded(
                    child: Builder(builder: (context) {
                      return RaisedButton(
                        child: Text("Change Email"),
                        color: Colors.lightBlue,
                        onPressed: () {
                          if (formKey.currentState.validate()) {
                            Scaffold.of(context).showSnackBar(SnackBar(
                              content: Text("Email Changed Successfully"),
                            ));
                            Navigator.of(context).pop();
                          }
                        },
                      );
                    }),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
