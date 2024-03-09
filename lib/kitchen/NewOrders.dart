// import 'package:admin/Edit%20item/ongoing%20alert.dart';
// import 'package:admin/controller/kitchen_controller.dart';
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';

// class NewOrders extends StatelessWidget {
//   const NewOrders({super.key});

//   @override
//   Widget build(BuildContext context) {
//     final Height = MediaQuery.of(context).size.height;
//     final Width = MediaQuery.of(context).size.width;
//     return Scaffold(
//       body: Container(
//         height: Height,
//         width: Width,
//         decoration: const BoxDecoration(
//             image: DecorationImage(
//                 image: AssetImage(
//                   'asset/images/background.png',
//                 ),
//                 fit: BoxFit.cover)),
//         child: Column(
//           children: [
//             SizedBox(
//               height: Height * 0.05,
//             ),
//             Row(
//               children: [
//                 Column(
//                   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                   children: [
//                     Container(
//                       height: Height * 0.08,
//                       width: Width * 0.08,
//                       decoration: const BoxDecoration(
//                         shape: BoxShape.circle,
//                         color: Color(0xffF6AF40),
//                       ),
//                       child: Center(
//                         child: IconButton(
//                           icon: ImageIcon(
//                             const AssetImage('asset/icons/left.png'),
//                             size: Height * 0.06,
//                             color: Colors.black,
//                           ),
//                           onPressed: () {
//                             Navigator.pop(context);
//                           },
//                         ),
//                       ),
//                     ),
//                     SizedBox(
//                       height: Height * 0.8,
//                     )
//                   ],
//                 ),
//                 SizedBox(
//                   width: Width * 0.08,
//                 ),
//                 Column(
//                   mainAxisAlignment: MainAxisAlignment.start,
//                   children: [
//                     Container(
//                       height: Height * 0.9,
//                       width: Width * 0.8,
//                       decoration: BoxDecoration(
//                           borderRadius: BorderRadius.circular(Width * 0.015),
//                           border: Border.all(),
//                           color: Colors.white.withOpacity(0.25)),
//                       child: Column(
//                         children: [
//                           SizedBox(
//                             height: Height * 0.03,
//                           ),
//                           Row(
//                             children: [
//                               SizedBox(
//                                 width: Width * 0.02,
//                               ),
//                               Text(
//                                 'New Orders',
//                                 style: TextStyle(
//                                     fontSize: Height * 0.04,
//                                     fontWeight: FontWeight.bold),
//                               ),
//                             ],
//                           ),
//                           SizedBox(
//                               height: Height * 0.8,
//                               width: Width * 0.75,
//                               child: Consumer<KitchenController>(
//                                   builder: (context, newOrderController, _) {
//                                 return FutureBuilder(
//                                     future: newOrderController.fetchOrders(),
//                                     builder: (context, snapshot) {
//                                       return ListView.builder(
//                                           padding: EdgeInsets.symmetric(
//                                               vertical: Height * 0.05),
//                                           scrollDirection: Axis.vertical,
//                                           itemCount: newOrderController
//                                               .ordersList.length,
//                                           itemBuilder: (context, index) {
//                                             return Container(
//                                               margin: EdgeInsets.symmetric(
//                                                   horizontal: Width * 0.02,
//                                                   vertical: Width * 0.01),
//                                               height: Height * 0.3,
//                                               width: Width * 0.1,
//                                               decoration: BoxDecoration(
//                                                 color: Colors.white,
//                                                 borderRadius:
//                                                     BorderRadius.circular(
//                                                         Width * 0.01),
//                                                 border: Border.all(),
//                                               ),
//                                               child: Column(
//                                                 children: [
//                                                   SizedBox(
//                                                     height: Height * 0.01,
//                                                   ),
//                                                   Row(children: [
//                                                     SizedBox(
//                                                       width: Width * 0.01,
//                                                     ),
//                                                     Text(
//                                                       'Order No: ${index + 1}',
//                                                       style: TextStyle(
//                                                           fontSize:
//                                                               Height * 0.025,
//                                                           fontWeight:
//                                                               FontWeight.bold),
//                                                     ),
//                                                     const Spacer(),
//                                                     Text('5 min',
//                                                         style: TextStyle(
//                                                             fontSize:
//                                                                 Height * 0.015,
//                                                             color: const Color(
//                                                                 0xff911f2a),
//                                                             fontWeight:
//                                                                 FontWeight
//                                                                     .bold)),
//                                                     SizedBox(
//                                                       width: Width * 0.01,
//                                                     ),
//                                                   ]),
//                                                   Divider(
//                                                     height: Height * 0.01,
//                                                     color: Colors.black,
//                                                   ),
//                                                   Padding(
//                                                     padding: const EdgeInsets
//                                                         .symmetric(
//                                                         horizontal: 10),
//                                                     child: Row(
//                                                       mainAxisAlignment:
//                                                           MainAxisAlignment
//                                                               .spaceBetween,
//                                                       children: [
//                                                         Text(
//                                                           'No',
//                                                           style: TextStyle(
//                                                             fontWeight:
//                                                                 FontWeight.bold,
//                                                             fontSize:
//                                                                 Height * 0.02,
//                                                           ),
//                                                         ),
//                                                         Text(
//                                                           'Item code',
//                                                           style: TextStyle(
//                                                             fontWeight:
//                                                                 FontWeight.bold,
//                                                             fontSize:
//                                                                 Height * 0.02,
//                                                           ),
//                                                         ),
//                                                         Text(
//                                                           'Item Name',
//                                                           style: TextStyle(
//                                                             fontWeight:
//                                                                 FontWeight.bold,
//                                                             fontSize:
//                                                                 Height * 0.02,
//                                                           ),
//                                                         ),
//                                                         Text(
//                                                           'Quantity',
//                                                           style: TextStyle(
//                                                             fontWeight:
//                                                                 FontWeight.bold,
//                                                             fontSize:
//                                                                 Height * 0.02,
//                                                           ),
//                                                         ),
//                                                         Expanded(
//                                                           child:
//                                                               ListView.builder(
//                                                             itemBuilder:
//                                                                 (context,
//                                                                     index2) {
//                                                               return Row();
//                                                             },
//                                                           ),
//                                                         )
//                                                       ],
//                                                     ),
//                                                   )
//                                                   // Row(
//                                                   //   children: [
//                                                   //     SizedBox(
//                                                   //       width: Width * 0.01,
//                                                   //     ),
//                                                   //     Column(
//                                                   //       mainAxisAlignment:
//                                                   //           MainAxisAlignment
//                                                   //               .start,
//                                                   //       children: [
//                                                   //         Text(
//                                                   //           'No',
//                                                   //           style: TextStyle(
//                                                   //             fontWeight:
//                                                   //                 FontWeight
//                                                   //                     .bold,
//                                                   //             fontSize:
//                                                   //                 Height * 0.02,
//                                                   //           ),
//                                                   //         ),
//                                                   //         const Text('1'),
//                                                   //         const Text('2')
//                                                   //       ],
//                                                   //     ), //number
//                                                   //     const Spacer(),
//                                                   //     Column(
//                                                   //       children: [
//                                                   //         Text(
//                                                   //           'Item code',
//                                                   //           style: TextStyle(
//                                                   //             fontWeight:
//                                                   //                 FontWeight
//                                                   //                     .bold,
//                                                   //             fontSize:
//                                                   //                 Height * 0.02,
//                                                   //           ),
//                                                   //         ),
//                                                   //         const Text('#001'),
//                                                   //         const Text('#002')
//                                                   //       ],
//                                                   //     ), //item code
//                                                   //     const Spacer(),
//                                                   //     Column(
//                                                   //       children: [
//                                                   //         Text(
//                                                   //           'Item Name',
//                                                   //           style: TextStyle(
//                                                   //             fontWeight:
//                                                   //                 FontWeight
//                                                   //                     .bold,
//                                                   //             fontSize:
//                                                   //                 Height * 0.02,
//                                                   //           ),
//                                                   //         ),
//                                                   //         const Text('Shawaya'),
//                                                   //         const Text('1 Pcs')
//                                                   //       ],
//                                                   //     ), //item name
//                                                   //     const Spacer(),
//                                                   //     Column(
//                                                   //       children: [
//                                                   //         Text(
//                                                   //           'Quantity',
//                                                   //           style: TextStyle(
//                                                   //             fontWeight:
//                                                   //                 FontWeight
//                                                   //                     .bold,
//                                                   //             fontSize:
//                                                   //                 Height * 0.02,
//                                                   //           ),
//                                                   //         ),
//                                                   //         const Text('1'),
//                                                   //         const Text('1')
//                                                   //       ],
//                                                   //     ), //Quantity
//                                                   //     SizedBox(
//                                                   //       width: Width * 0.1,
//                                                   //     ),
//                                                   //   ],
//                                                   // )
//                                                 ],
//                                               ),
//                                             );
//                                           });
//                                     });
//                               })),
//                         ],
//                       ),
//                     ),
//                     SizedBox(
//                       height: Height * 0.01,
//                     )
//                   ],
//                 ),
//                 SizedBox(
//                   width: Width * 0.005,
//                 )
//               ],
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   void _showSignOutDialog(BuildContext context) {
//     final Height = MediaQuery.of(context).size.height;
//     final Width = MediaQuery.of(context).size.width;
//     showDialog(
//       context: context,
//       builder: (BuildContext context) {
//         return AlertDialog(
//           title: const Text('Sign Out'),
//           content: const Text('Are you sure you want to sign out?'),
//           actions: [
//             TextButton(
//               onPressed: () {
//                 Navigator.of(context).pop(); // Close the dialog
//               },
//               child: Text(
//                 'Cancel',
//                 style: TextStyle(color: Colors.grey.shade700),
//               ),
//             ),
//             TextButton(
//               onPressed: () {
//                 // Perform sign out logic here
//                 Navigator.of(context).pop(); // Close the dialog
//               },
//               child: Container(
//                   height: Height * 0.04,
//                   width: Width * 0.04,
//                   decoration: BoxDecoration(
//                     borderRadius: BorderRadius.circular(Width * 0.01),
//                     color: const Color(0xff911f2a),
//                   ),
//                   child: const Center(
//                     child: Text(
//                       'Reject',
//                       style: TextStyle(color: Colors.white),
//                     ),
//                   )),
//             ),
//           ],
//         );
//       },
//     );
//   }
// }
