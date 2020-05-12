import 'package:flutter/material.dart';

enum Gender { male, female }

// Define a custom Form widget.
class AvatarForm extends StatefulWidget {
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

  Gender _genderSelected = Gender.male;

  @override
  Widget build(BuildContext context) {
    // Build a Form widget using the _formKey created above.
    return Form(
      key: _formKey,
      child: Column(children: <Widget>[
        ListTile(
          title: const Text('Male'),
          leading: Radio(
            value: Gender.male,
            groupValue: _genderSelected,
            onChanged: (Gender value) {
              setState(() {
                _genderSelected = value;
              });
            },
          ),
        ),
        ListTile(
          title: const Text('Female'),
          leading: Radio(
            value: Gender.female,
            groupValue: _genderSelected,
            onChanged: (Gender value) {
              setState(() {
                _genderSelected = value;
              });
            },
          ),
        ),
        TextFormField(
          // The validator receives the text that the user has entered.
          validator: (value) {
            if (value.isEmpty) {
              return 'Please enter your nickname';
            }
            return null;
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
            }
          },
          child: Text('Generate'),
        )
      ]),
    );
  }
}
