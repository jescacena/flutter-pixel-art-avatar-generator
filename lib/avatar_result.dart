import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:share/share.dart';
import './constants.dart' as Constants;

class AvatarResult extends StatelessWidget {
  final String nickname;
  final Constants.Gender gender;

  AvatarResult(this.nickname, this.gender);

  @override
  Widget build(BuildContext context) {
    String genderString = gender == Constants.Gender.female ? 'female' : 'male';
    String avatarUrl = 'https://avatars.dicebear.com/v2/${genderString}/${nickname}.svg';
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
                avatarUrl,
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
                      Share.share('check out my pixel art avatar for ${nickname} (${genderString}): ${avatarUrl}', subject: 'Look your pixel art avatar!');
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
