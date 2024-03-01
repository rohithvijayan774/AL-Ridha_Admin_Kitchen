import 'package:flutter/material.dart';

class AssignContainer extends StatefulWidget {
  @override
  _AssignContainerState createState() => _AssignContainerState();
}

class _AssignContainerState extends State<AssignContainer> {
  late String selectedDeliveryBoy;
  late double Height;
  late double Width;

  @override
  void initState() {
    super.initState();
    // Initialize variables in initState
    // Height = MediaQuery.of(context).size.height;
    // Width = MediaQuery.of(context).size.width;
    selectedDeliveryBoy = ''; // Initialize with an empty string
  }

  @override
  Widget build(BuildContext context) {
    Height = MediaQuery.of(context).size.height;
    Width = MediaQuery.of(context).size.width;
    return InkWell(
      onTap: () {
        _showDropdown(context);
      },
      child: SizedBox(
        height: Height * 0.04,
        width: Width * 0.12,
        child: ElevatedButton(
          onPressed: () {
            _showDropdown(context);
          },
          style: ElevatedButton.styleFrom(
            backgroundColor:Colors.blueAccent,
                 // Background color of the button
            foregroundColor: Colors.white, // Text color
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(
                  Height * 0.01), // Adjust the border radius as needed
            ),
          ),
          child: Text(
            'Assign',
            style: TextStyle(
              fontSize: Height * 0.02,
            ),
          ),
        ),
      ),
    );
  }

  void _showDropdown(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(

          title: Text('Select Delivery Boy'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              RadioListTile(
                activeColor: Colors.blueAccent,
                title: Text('Delivery Boy 1'),
                value: 'Delivery Boy 1',
                groupValue: selectedDeliveryBoy,
                onChanged: (String? value) {
                  if (value != null) {
                    setState(() {
                      selectedDeliveryBoy = value;
                    });
                  }
                  Navigator.of(context).pop();
                },
              ),
              RadioListTile(
                activeColor: Colors.blueAccent,
                title: Text('Delivery Boy 2'),
                value: 'Delivery Boy 2',
                groupValue: selectedDeliveryBoy,
                onChanged: (String? value) {
                  if (value != null) {
                    setState(() {
                      selectedDeliveryBoy = value;
                    });
                  }
                  Navigator.of(context).pop();
                },
              ),
            ],
          ),
        );
      },
    );
  }
}

class RejectAlert extends StatelessWidget {
  const RejectAlert({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
