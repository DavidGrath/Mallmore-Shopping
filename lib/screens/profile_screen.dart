import 'package:flutter/material.dart';
import './gender_screen.dart';
import './birthday_screen.dart';
import './phonenum_screen.dart';
import './email_screen.dart';
import './password_screen.dart';
import './fullname_screen.dart';

class ProfileScreen extends StatelessWidget {
  var valueStyle = TextStyle(
    color: Colors.grey,
  );
  var itemStyle = TextStyle(fontWeight: FontWeight.bold);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Profile"),
      ),
      body: Container(
        padding: EdgeInsets.all(10.0),
        child: ListView(
          children: <Widget>[
            ListTile(
              contentPadding: EdgeInsets.only(top: 20.0, bottom: 20.0),
              leading: CircleAvatar(
                radius: 36,
                backgroundColor: Colors.red,
                child: Icon(Icons.person_outline),
              ),
              title: Text(
                "John Doe",
                style: itemStyle,
              ),
              subtitle: Text(
                "@johndoe",
                style: valueStyle,
              ),
              onTap: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) {
                  return FullNameScreen();
                }));
              },
            ),
            ListTile(
              leading: Icon(Icons.search),
              title: Row(children: <Widget>[
                Expanded(
                    child: Text(
                  "Gender",
                  textAlign: TextAlign.start,
                  style: itemStyle,
                )),
                Expanded(
                    child: Text(
                  "Male",
                  textAlign: TextAlign.end,
                  style: valueStyle,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ))
              ]),
              trailing: IconButton(
                icon: Icon(Icons.keyboard_arrow_right),
                onPressed: () {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (context) {
                    return GenderScreen();
                  }));
                },
              ),
            ),
            ListTile(
              leading: Icon(Icons.calendar_today),
              title: Row(children: <Widget>[
                Expanded(
                    child: Text(
                  "Birthday",
                  textAlign: TextAlign.start,
                  style: itemStyle,
                )),
                Expanded(
                    child: Text(
                  "12/01/1980",
                  textAlign: TextAlign.end,
                  style: valueStyle,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ))
              ]),
              trailing: IconButton(
                icon: Icon(Icons.keyboard_arrow_right),
                onPressed: () {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (context) {
                    return BirthdayScreen();
                  }));
                },
              ),
            ),
            ListTile(
              leading: Icon(Icons.email),
              title: Row(children: <Widget>[
                Expanded(
                    child: Text(
                  "Email",
                  textAlign: TextAlign.start,
                  style: itemStyle,
                )),
                Expanded(
                    child: Text(
                  "johndoe@example.com",
                  textAlign: TextAlign.end,
                  style: valueStyle,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ))
              ]),
              trailing: IconButton(
                icon: Icon(Icons.keyboard_arrow_right),
                onPressed: () {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (context) {
                    return EmailScreen();
                  }));
                },
              ),
            ),
            ListTile(
              leading: Icon(Icons.phone),
              title: Row(children: <Widget>[
                Expanded(
                    child: Text(
                  "Phone Number",
                  textAlign: TextAlign.start,
                  style: itemStyle,
                )),
                Expanded(
                    child: Text(
                  "+234 70 1234 5678",
                  textAlign: TextAlign.end,
                  style: valueStyle,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ))
              ]),
              trailing: IconButton(
                icon: Icon(Icons.keyboard_arrow_right),
                onPressed: () {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (context) {
                    return PhoneNumScreen();
                  }));
                },
              ),
            ),
            ListTile(
              leading: Icon(Icons.lock),
              title: Row(children: <Widget>[
                Expanded(
                    child: Text(
                  "Change Password",
                  textAlign: TextAlign.start,
                  style: itemStyle,
                )),
                Expanded(
                    child: Text(
                  "",
                  textAlign: TextAlign.end,
                ))
              ]),
              trailing: IconButton(
                icon: Icon(Icons.keyboard_arrow_right),
                onPressed: () {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (context) {
                    return PasswordScreen();
                  }));
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
