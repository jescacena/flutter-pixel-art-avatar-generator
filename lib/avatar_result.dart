import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import './constants.dart' as Constants;

class AvatarResult extends StatelessWidget {
  final String nickname;
  final Constants.Gender gender;

  AvatarResult(this.nickname, this.gender);

  @override
  Widget build(BuildContext context) {
    String genderString = gender == Constants.Gender.female ? 'female' : 'male';
    return Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
      Expanded(
              child: Container(
          color: Colors.amber,
          height: 220,
          padding: const EdgeInsets.only(top: 20, bottom: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(nickname),
              SvgPicture.network(
                'https://avatars.dicebear.com/v2/${genderString}/${nickname}.svg',
                width: 100,
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
