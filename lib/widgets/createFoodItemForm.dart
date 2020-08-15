import 'package:flutter/material.dart';

class CreateFoodItemForm extends StatefulWidget {
  CreateFoodItemForm({Key key}) : super(key: key);

  @override
  _CreateFoodItemFormState createState() => _CreateFoodItemFormState();
}

class _CreateFoodItemFormState extends State<CreateFoodItemForm> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Text(
          'Create a Food Item',
          style: TextStyle(color: Colors.black, fontSize: 30.0),
        ),
        RaisedButton(
          onPressed: () => Navigator.pop(context),
          child: Text('Cancel'),
        ),
      ],
    );
  }
}
