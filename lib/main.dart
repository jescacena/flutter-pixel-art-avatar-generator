import 'package:flutter/material.dart';
import 'package:helloworld/avatar_form.dart';

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
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Text('Select your gender and type your nickname'),
              AvatarForm()
            ],
          ),
        ),
      ),
    );
  }
}