import 'package:flutter/material.dart';

class CreateFoodItemForm extends StatefulWidget {
  CreateFoodItemForm({Key key}) : super(key: key);

  @override
  _CreateFoodItemFormState createState() => _CreateFoodItemFormState();
}

class _CreateFoodItemFormState extends State<CreateFoodItemForm> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    // TODO: Space out the fields in this form with flex instead of applying padding to each element
    return Form(
      key: _formKey,
      child: Container(
        padding: EdgeInsets.all(
          20.0,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Text(
              'Create a Food Item',
              style: TextStyle(
                color: Colors.black,
                fontSize: 45.0,
                fontWeight: FontWeight.w700,
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 30.0,
                vertical: 30.0,
              ),
              child: TextFormField(
                cursorColor: Colors.black,
                style: TextStyle(
                  fontSize: 20,
                ),
                decoration: const InputDecoration(
                  labelText: 'Name',
                  hintText: 'e.g: Bananas',
                  labelStyle: TextStyle(
                    fontSize: 26.0,
                    color: Colors.black,
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black),
                  ),
                  errorBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.red),
                  ),
                  focusedErrorBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.red),
                  ),
                ),
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Please enter some text';
                  }
                  return null;
                },
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                left: 30.0,
                right: 30.0,
                bottom: 30.0,
              ),
              child: TextFormField(
                cursorColor: Colors.black,
                style: TextStyle(
                  fontSize: 20,
                ),
                decoration: const InputDecoration(
                  labelText: 'Food Category',
                  hintText: 'e.g: Fruit',
                  labelStyle: TextStyle(
                    fontSize: 26.0,
                    color: Colors.black,
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black),
                  ),
                  errorBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.red),
                  ),
                  focusedErrorBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.red),
                  ),
                ),
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Please enter some text';
                  }
                  return null;
                },
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                ButtonTheme(
                  minWidth: 120.0,
                  height: 60.0,
                  child: RaisedButton(
                    onPressed: () {
                      if (_formKey.currentState.validate()) {
                        // Process data
                      }
                    },
                    child: Text(
                      'Create',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 26.0,
                      ),
                    ),
                    color: Colors.green,
                  ),
                ),
                ButtonTheme(
                  minWidth: 120.0,
                  height: 60.0,
                  child: RaisedButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text(
                      'Cancel',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 26.0,
                      ),
                    ),
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
