import 'package:admin/controller/admin_controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AssignContainer extends StatelessWidget {
  final int index;
  final String docid;
  const AssignContainer({
    required this.index,
    required this.docid,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final Height = MediaQuery.of(context).size.height;
    final Width = MediaQuery.of(context).size.width;
    return Consumer<AdminController>(builder: (context, dlvryCOntroller, _) {
      return InkWell(
        onTap: () {
          _showDropdown(context, docid);
        },
        child: SizedBox(
          height: Height * 0.04,
          width: Width * 0.12,
          child: ElevatedButton(
            onPressed: () {
              dlvryCOntroller.ordersList[index].status == 'coocked'
                  ? _showDropdown(context, docid)
                  : null;
            },
            style: ElevatedButton.styleFrom(
              backgroundColor:
                  dlvryCOntroller.ordersList[index].status == 'coocked'
                      ? Colors.blueAccent
                      : Colors.grey,
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
    });
  }

  void _showDropdown(BuildContext context, String docid) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Consumer<AdminController>(
            builder: (context, dlvryBoyController, _) {
          return FutureBuilder(
              future: dlvryBoyController.fetchDeliveryBoys(),
              builder: (context, snapshot) {
                print(dlvryBoyController.selectedDeliveryBoy);
                return AlertDialog(
                  title: const Text('Select Delivery Boy'),
                  content: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: List.generate(
                      dlvryBoyController.deliveryBoysList.length,
                      (index) => RadioListTile(
                        activeColor: Colors.blueAccent,
                        title: Text(dlvryBoyController
                            .deliveryBoysList[index].delvryBoyName),
                        value: dlvryBoyController
                            .deliveryBoysList[index].delvryBoyName,
                        groupValue: dlvryBoyController.selectedDeliveryBoy,
                        onChanged: (String? value) {
                          if (value != null) {
                            value = dlvryBoyController
                                .deliveryBoysList[index].delvryBoyID;

                            dlvryBoyController.setDeliveryBoy(value, docid);
                          }
                          Navigator.of(context).pop();
                        },
                      ),
                    ),
                  ),
                );
              });
        });
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
