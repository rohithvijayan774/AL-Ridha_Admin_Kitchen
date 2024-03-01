import 'package:flutter/material.dart';

class ItemAlert extends StatefulWidget {
  @override
  State<ItemAlert> createState() => _ItemAlertState();
}

class _ItemAlertState extends State<ItemAlert> {
  @override
  Widget build(BuildContext context) {
    final String title;

    return Scaffold(
      // body: Center(
      //   child: ElevatedButton(
      //     onPressed: () {
      //       _showAlertDialog(context);
      //     },
      //     child: Text('Click me'),
      //   ),
      // ),
    );
  }

  void _showAlertDialog(BuildContext context) {
    final String title;
    TextEditingController textFieldController = TextEditingController();

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Enter title here'),
          content: TextField(
            controller: textFieldController,
            decoration: InputDecoration(hintText: 'Type something...'),
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close the alert dialog
              },
              child: Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                // Access the entered text using textFieldController.text
                print('Entered text: ${textFieldController.text}');
                Navigator.of(context).pop(); // Close the alert dialog
              },
              child: Text('OK'),
            ),
          ],
        );
      },
    );
  }
}
