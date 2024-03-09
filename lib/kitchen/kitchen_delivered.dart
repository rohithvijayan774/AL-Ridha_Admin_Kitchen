import 'package:admin/Edit%20item/ongoing%20alert.dart';
import 'package:admin/controller/admin_controller.dart';
import 'package:admin/controller/kitchen_controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class KitchenDelivered extends StatelessWidget {
  const KitchenDelivered({super.key});

  @override
  Widget build(BuildContext context) {
    final Height = MediaQuery.of(context).size.height;
    final Width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Container(
        height: Height,
        width: Width,
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage(
                  'asset/images/background.png',
                ),
                fit: BoxFit.cover)),
        child: Column(
          children: [
            SizedBox(
              height: Height * 0.05,
            ),
            Row(
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      height: Height * 0.08,
                      width: Width * 0.08,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Color(0xffF6AF40),
                      ),
                      child: Center(
                        child: IconButton(
                          icon: ImageIcon(
                            const AssetImage('asset/icons/left.png'),
                            size: Height * 0.06,
                            color: Colors.black,
                          ),
                          onPressed: () {
                            Navigator.pop(context);
                          },
                        ),
                      ),
                    ),
                    SizedBox(
                      height: Height * 0.8,
                    )
                  ],
                ),
                SizedBox(
                  width: Width * 0.08,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      height: Height * 0.9,
                      width: Width * 0.8,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(Width * 0.015),
                          border: Border.all(),
                          color: Colors.white.withOpacity(0.25)),
                      child: Column(
                        children: [
                          SizedBox(
                            height: Height * 0.03,
                          ),
                          Row(
                            children: [
                              SizedBox(
                                width: Width * 0.02,
                              ),
                              Text(
                                'Delivered',
                                style: TextStyle(
                                    fontSize: Height * 0.04,
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: Height * 0.8,
                            width: Width * 0.75,
                            child: Consumer<KitchenController>(
                              builder: (context, orderController, _) {
                                return FutureBuilder(
                                  future:
                                      orderController.fetchOrders('coocked'),
                                  builder: (context, snapshot) {
                                    return snapshot.connectionState ==
                                            ConnectionState.waiting
                                        ? const Center(
                                            child: CircularProgressIndicator(),
                                          )
                                        : orderController.ordersList.isEmpty
                                            ? const Center(
                                                child: Text('No Items'),
                                              )
                                            : ListView.builder(
                                                padding: EdgeInsets.symmetric(
                                                    vertical: Height * 0.05),
                                                scrollDirection: Axis.vertical,
                                                itemCount: orderController
                                                    .ordersList.length,
                                                itemBuilder: (context, index) {
                                                  return Container(
                                                    margin: EdgeInsets.all(
                                                        Width * 0.02),
                                                    // height: Height * 0.3,
                                                    width: Width * 0.1,
                                                    decoration: BoxDecoration(
                                                      color: Colors.white,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              Width * 0.01),
                                                      border: Border.all(),
                                                    ),
                                                    child: Column(
                                                      children: [
                                                        SizedBox(
                                                          height: Height * 0.01,
                                                        ),
                                                        Row(
                                                          children: [
                                                            SizedBox(
                                                              width:
                                                                  Width * 0.01,
                                                            ),
                                                            Text(
                                                              '5 min ago',
                                                              style: TextStyle(
                                                                fontSize:
                                                                    Height *
                                                                        0.015,
                                                                color: const Color(
                                                                    0xff911f2a),
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                        Row(children: [
                                                          SizedBox(
                                                            width: Width * 0.01,
                                                          ),
                                                          Text(
                                                            'Order No: ${index + 1}',
                                                            style: TextStyle(
                                                                fontSize:
                                                                    Height *
                                                                        0.02),
                                                          ),
                                                          SizedBox(
                                                            width: Width * 0.25,
                                                          ),
                                                          Text('Count',
                                                              style: TextStyle(
                                                                  fontSize:
                                                                      Height *
                                                                          0.02)),
                                                          SizedBox(
                                                            width: Width * 0.25,
                                                          ),
                                                          Text('Item No.',
                                                              style: TextStyle(
                                                                  fontSize:
                                                                      Height *
                                                                          0.02)),
                                                          SizedBox(
                                                            width: Width * 0.01,
                                                          ),
                                                        ]),
                                                        Divider(
                                                          height: Height * 0.01,
                                                          color: Colors.black,
                                                        ),
                                                        Container(
                                                          height: Height * 0.16,
                                                          decoration:
                                                              const BoxDecoration(
                                                                  // color: Colors.blueAccent,
                                                                  ),
                                                          child: ListView
                                                              .separated(
                                                                  separatorBuilder:
                                                                      (context,
                                                                              index) =>
                                                                          const SizedBox(
                                                                            height:
                                                                                10,
                                                                          ),
                                                                  itemCount: orderController
                                                                      .ordersList[
                                                                          index]
                                                                      .orderedItems
                                                                      .length,
                                                                  itemBuilder:
                                                                      (context,
                                                                          index2) {
                                                                    return Column(
                                                                      crossAxisAlignment:
                                                                          CrossAxisAlignment
                                                                              .start,
                                                                      mainAxisAlignment:
                                                                          MainAxisAlignment
                                                                              .start,
                                                                      children: [
                                                                        Row(
                                                                          mainAxisAlignment:
                                                                              MainAxisAlignment.start,
                                                                          crossAxisAlignment:
                                                                              CrossAxisAlignment.start,
                                                                          children: [
                                                                            SizedBox(
                                                                              width: Width * 0.01,
                                                                            ),
                                                                            Column(
                                                                              children: [
                                                                                Text(
                                                                                  'No',
                                                                                  style: TextStyle(
                                                                                    fontSize: Height * 0.02,
                                                                                  ),
                                                                                ),
                                                                                Text(
                                                                                  '${index2 + 1}',
                                                                                  style: TextStyle(
                                                                                    fontSize: Height * 0.02,
                                                                                  ),
                                                                                ),
                                                                              ],
                                                                            ),
                                                                            SizedBox(
                                                                              width: Width * 0.025,
                                                                            ),
                                                                            SizedBox(
                                                                              width: 100,
                                                                              child: Column(
                                                                                mainAxisAlignment: MainAxisAlignment.start,
                                                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                                                children: [
                                                                                  Text(
                                                                                    'Item',
                                                                                    style: TextStyle(
                                                                                      fontSize: Height * 0.02,
                                                                                    ),
                                                                                  ),
                                                                                  Text(
                                                                                    orderController.ordersList[index].orderedItems[index2]['productname'],
                                                                                    style: TextStyle(
                                                                                      fontSize: Height * 0.02,
                                                                                    ),
                                                                                  ),
                                                                                ],
                                                                              ),
                                                                            ),
                                                                            SizedBox(
                                                                              width: Width * 0.21,
                                                                            ),
                                                                            Column(
                                                                              children: [
                                                                                SizedBox(
                                                                                  width: 100,
                                                                                  child: Text(
                                                                                    orderController.ordersList[index].orderedItems[index2]['count'].toString(),
                                                                                    style: TextStyle(
                                                                                      fontSize: Height * 0.02,
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                              ],
                                                                            ),
                                                                            SizedBox(
                                                                              width: Width * 0.21,
                                                                            ),
                                                                            Column(
                                                                              children: [
                                                                                SizedBox(
                                                                                  width: 100,
                                                                                  child: Text(
                                                                                    orderController.ordersList[index].orderedItems[index2]['productid'],
                                                                                    style: TextStyle(
                                                                                      fontSize: Height * 0.02,
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                              ],
                                                                            )
                                                                          ],
                                                                        ),
                                                                      ],
                                                                    );
                                                                  }),
                                                        ),
                                                        Divider(
                                                          height: Height * 0.02,
                                                          color: Colors.black,
                                                        ),
                                                      ],
                                                    ),
                                                  );
                                                },
                                              );
                                  },
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: Height * 0.01,
                    )
                  ],
                ),
                SizedBox(
                  width: Width * 0.005,
                )
              ],
            ),
          ],
        ),
      ),
    );
  }

  void _showSignOutDialog(BuildContext context) {
    final Height = MediaQuery.of(context).size.height;
    final Width = MediaQuery.of(context).size.width;
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Sign Out'),
          content: const Text('Are you sure you want to sign out?'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
              },
              child: Text(
                'Cancel',
                style: TextStyle(color: Colors.grey.shade700),
              ),
            ),
            TextButton(
              onPressed: () {
                // Perform sign out logic here
                Navigator.of(context).pop(); // Close the dialog
              },
              child: Container(
                  height: Height * 0.04,
                  width: Width * 0.04,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(Width * 0.01),
                    color: const Color(0xff911f2a),
                  ),
                  child: const Center(
                    child: Text(
                      'Reject',
                      style: TextStyle(color: Colors.white),
                    ),
                  )),
            ),
          ],
        );
      },
    );
  }
}
