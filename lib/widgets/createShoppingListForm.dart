import 'package:flutter/material.dart';

class CreateShoppingListForm extends StatefulWidget {
  CreateShoppingListForm({Key key}) : super(key: key);

  @override
  _CreateShoppingListFormState createState() => _CreateShoppingListFormState();
}

class _CreateShoppingListFormState extends State<CreateShoppingListForm> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Text(
          'Create a Shopping List',
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
