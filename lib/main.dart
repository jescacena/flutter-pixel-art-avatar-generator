import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:helloworld/avatar_form.dart';
import 'package:helloworld/avatar_result.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pixel Art Avatar Generator',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Pixel Art Avatar Generator'),
        ),
        body: Center(
          child: Container(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                SizedBox(height: 40),
                AvatarForm(),
                SizedBox(height: 50),
                AvatarResult()
              ],
            ),
          ),
        ),
      ),
    );
  }
}
