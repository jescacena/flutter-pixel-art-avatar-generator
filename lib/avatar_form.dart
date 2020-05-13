import 'package:flutter/material.dart';

import './constants.dart' as Constants;

// Define a custom Form widget.
class AvatarForm extends StatefulWidget {
  final Function onSubmit;

  AvatarForm(this.onSubmit);

  @override
  AvatarFormState createState() {
    return AvatarFormState();
  }
}

// Define a corresponding State class.
// This class holds data related to the form.
class AvatarFormState extends State<AvatarForm> {
  // Create a global key that uniquely identifies the Form widget
  // and allows validation of the form.
  //
  // Note: This is a `GlobalKey<FormState>`,
  // not a GlobalKey<AvatarFormState>.
  final _formKey = GlobalKey<FormState>();

  Constants.Gender _genderSelected = Constants.Gender.female;
  String _nickname = 'Paradigma';

  @override
  Widget build(BuildContext context) {
    // Build a Form widget using the _formKey created above.
    return Form(
      key: _formKey,
      child: Container(
        decoration: new BoxDecoration(
            color: Colors.lightBlue,
            // backgroundBlendMode: BlendMode.overlay,
            borderRadius: new BorderRadius.circular(10.0),
            border: new Border.all(
                color: Colors.black, width: 1.0, style: BorderStyle.solid)),
        padding: const EdgeInsets.all(10.0),
        child: Column(children: <Widget>[
          Text('Fill in this form and click to get your avatar',
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.w400)),
          ListTile(
            title: const Text('Male'),
            leading: Radio(
              value: Constants.Gender.male,
              groupValue: _genderSelected,
              onChanged: (Constants.Gender value) {
                setState(() {
                  _genderSelected = value;
                });
              },
            ),
          ),
          ListTile(
            title: const Text('Female'),
            leading: Radio(
              value: Constants.Gender.female,
              groupValue: _genderSelected,
              onChanged: (Constants.Gender value) {
                setState(() {
                  _genderSelected = value;
                });
              },
            ),
          ),
          TextFormField(
            initialValue: _nickname,
            decoration: InputDecoration(labelText: 'Enter your nickname'),
            // The validator receives the text that the user has entered.
            validator: (value) {
              if (value.isEmpty) {
                return 'Please enter your nickname';
              }
              return null;
            },
            onChanged: (text) {
              print("First text field: $text");
              _nickname = text;
            },
          ),
          RaisedButton(
            onPressed: () {
              // Validate returns true if the form is valid, otherwise false.
              if (_formKey.currentState.validate()) {
                // If the form is valid, display a snackbar. In the real world,
                // you'd often call a server or save the information in a database.

                Scaffold.of(context)
                    .showSnackBar(SnackBar(content: Text('Processing Data')));

                FocusScope.of(context).requestFocus(FocusNode());
                widget.onSubmit(_nickname, _genderSelected);
              }
            },
            child: Text('Generate'),
          ),
        ]),
      ),
    );
  }
}
