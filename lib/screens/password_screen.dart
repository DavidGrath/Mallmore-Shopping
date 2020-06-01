import 'package:flutter/material.dart';

var formKey = GlobalKey<FormState>();

class PasswordScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _PasswordScreenState();
}

class _PasswordScreenState extends State<PasswordScreen> {
  @override
  Widget build(BuildContext context) {
    var oldPwController = TextEditingController(text: "12345678");
    var newPwController = TextEditingController();
    var confirmController = TextEditingController();

    return Form(
      key: formKey,
      child: Scaffold(
        appBar: AppBar(
          title: Text("Change Password"),
        ),
        body: Container(
          padding: EdgeInsets.all(10.0),
          child: Column(
            children: <Widget>[
              Expanded(
                child: ListView(
                  children: <Widget>[
                    TextFormField(
                      readOnly: true,
                      obscureText: true,
                      controller: oldPwController,
                      decoration: InputDecoration(
                          labelText: "Old Password",
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0))),
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    TextFormField(
                      controller: newPwController,
                      obscureText: true,
                      decoration: InputDecoration(
                          labelText: "New Password",
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0))),
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    TextFormField(
                      obscureText: true,
                      decoration: InputDecoration(
                          labelText: "Confirm Password",
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0))),
                      controller: confirmController,
                      validator: (confirm) {
                        if (confirm.isEmpty) return "Password can't be empty";
                        if (confirm != newPwController.text) {
                          return "Passwords don't match";
                        }
                      },
                    )
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
                            content: Text("Password Changed Successfully"),
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
