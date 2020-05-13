import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:helloworld/avatar_form.dart';
import 'package:helloworld/avatar_result.dart';
import './constants.dart' as Constants;

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  MyAppState createState() {
    return MyAppState();
  }
}

class MyAppState extends State<MyApp> {
  String _nickname;
  Constants.Gender _gender;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pixel Art Avatar Generator',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Pixel Art Avatar Generator'),
        ),
        body: SingleChildScrollView(
                  child: Center(
            child: Container(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  SizedBox(height: 40),
                  AvatarForm((String nickname,Constants.Gender gender) {
                    setState(() {
                      _nickname = nickname;
                      _gender = gender;
                      print('janderrrr ---->' + nickname);
                    });
                  }),
                  SizedBox(height: 10),
                  _nickname != null
                      ? AvatarResult(_nickname, _gender)
                      : Container()
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
