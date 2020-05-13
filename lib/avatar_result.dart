import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class AvatarResult extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(children: <Widget>[
      Expanded(
        child: Container(
          color: Colors.amber,
          height: 300,
          padding: const EdgeInsets.only(top:20, bottom:20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              SvgPicture.network(
                'https://avatars.dicebear.com/v2/female/indira.svg',
                width: 150,
                semanticsLabel: 'A shark?!',
                placeholderBuilder: (BuildContext context) => Container(
                    padding: const EdgeInsets.all(10.0),
                    child: const CircularProgressIndicator()),
              ),
              RaisedButton(
                onPressed: () {
                  Scaffold.of(context)
                      .showSnackBar(SnackBar(content: Text('Sharing')));
                },
                child: Text('Share'),
              )
            ],
          ),
        ),
      ),
    ]);
  }
}
