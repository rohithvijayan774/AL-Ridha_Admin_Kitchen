import 'package:admin/Dashboard/home.dart';
import 'package:admin/Edit%20item/edit%20alert.dart';
import 'package:admin/controller/admin_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AddItems extends StatelessWidget {
  final String category;
  const AddItems({
    super.key,
    required this.category,
  });

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
                Consumer<AdminController>(
                    builder: (context, addProductController, _) {
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        height: Height * 0.9,
                        width: Width * 0.8,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(Width * 0.015),
                            border: Border.all(),
                            color: Colors.white.withOpacity(0.4)),
                        child: Column(children: [
                          SizedBox(
                            height: Height * 0.03,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              SizedBox(
                                width: Width * 0.02,
                              ),
                              Text(
                                'title?',
                                style: TextStyle(
                                    fontSize: Height * 0.04,
                                    fontWeight: FontWeight.bold),
                              ),
                              const Spacer(),
                              SizedBox(
                                height: Height * 0.05,
                                width: Width * 0.07,
                                child: ElevatedButton(
                                  onPressed: () {
                                    addProductController
                                        .storeProducts(
                                            addProductController
                                                .productTitlecontroller.text,
                                            addProductController
                                                .pickProductPic!.path,
                                            addProductController
                                                .productDescriptioncontroller
                                                .text,
                                            int.parse(addProductController
                                                .productPricecontroller.text),
                                            int.parse(addProductController
                                                .productOffercontroller.text),
                                            category,
                                            context)
                                        .then(
                                          (value) => addProductController
                                              .uploadProductpic(
                                            addProductController
                                                .productTitlecontroller.text,
                                            category,
                                          ),
                                        )
                                        .then(
                                          (value) => addProductController
                                              .clearFields(),
                                        )
                                        .then((value) => Navigator.of(context)
                                            .pushAndRemoveUntil(
                                                MaterialPageRoute(
                                                  builder: (context) =>
                                                      const Home(),
                                                ),
                                                (route) => false));
                                  },
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: const Color(0xff3C8A3C),
                                    foregroundColor: Colors.white, // Text color
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(Height *
                                          0.01), // Adjust the border radius as needed
                                    ),
                                  ),
                                  child: Text(
                                    'Create',
                                    style: TextStyle(
                                      fontSize: Height * 0.018,
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: Width * 0.02,
                              ),
                            ],
                          ),
                          SizedBox(
                            height: Height * 0.02,
                          ),
                          Container(
                            margin: EdgeInsets.symmetric(
                              horizontal: Width * 0.01,
                            ),
                            height: Height * 0.78,
                            width: Width * 0.8,
                            child: Container(
                              decoration: BoxDecoration(
                                border: Border.all(),
                                borderRadius:
                                    BorderRadius.circular(Width * 0.01),
                                // color: Colors.greenAccent
                              ),
                              child: Column(
                                children: [
                                  SizedBox(
                                    height: Height * 0.02,
                                  ),
                                  Row(
                                    children: [
                                      SizedBox(
                                        width: Width * 0.015,
                                      ),
                                      Container(
                                        height: Height * 0.35,
                                        width: Width * 0.3,
                                        decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(
                                                Width * 0.01),
                                            color: Colors.grey.shade200),
                                        child: addProductController
                                                    .pickProductPic ==
                                                null
                                            ? Icon(
                                                Icons.photo,
                                                size: Width * 0.1,
                                              )
                                            : Image.network(addProductController
                                                .pickProductPic!.path),
                                      ),
                                      SizedBox(
                                        width: Width * 0.05,
                                      ),
                                      Column(
                                        children: [
                                          SizedBox(
                                            height: Height * 0.06,
                                            width: Width * 0.35,
                                            child: ElevatedButton(
                                                onPressed: () {
                                                  _showAlertDialog(
                                                      context,
                                                      addProductController
                                                          .productTitlecontroller,
                                                      'Title');
                                                },
                                                style: ElevatedButton.styleFrom(
                                                  padding: const EdgeInsets
                                                      .symmetric(
                                                      vertical: 15,
                                                      horizontal: 30),
                                                  backgroundColor:
                                                      Colors.grey.shade100,
                                                  foregroundColor: const Color(
                                                      0xff911f2a), // Button text color
                                                  side: BorderSide(
                                                      color: Colors.black,
                                                      width: Width *
                                                          0.001), // Border color
                                                  shape: RoundedRectangleBorder(
                                                    borderRadius: BorderRadius
                                                        .circular(Width *
                                                            0.01), // Border radius for rounded corners
                                                  ),
                                                ),
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Text(
                                                      'Add Title',
                                                      style: TextStyle(
                                                          fontSize:
                                                              Width * 0.015),
                                                    ),
                                                    Image.asset(
                                                      'asset/icons/edit-text.png',
                                                      width: Width * 0.05,
                                                      height: Height * 0.05,
                                                    ),
                                                  ],
                                                )),
                                          ),
                                          SizedBox(
                                            height: Height * 0.01,
                                          ),
                                          SizedBox(
                                            height: Height * 0.06,
                                            width: Width * 0.35,
                                            child: ElevatedButton(
                                                onPressed: () {
                                                  // Add your button click logic here
                                                  addProductController
                                                      .selectProductPic();
                                                },
                                                style: ElevatedButton.styleFrom(
                                                  padding: const EdgeInsets
                                                      .symmetric(
                                                      vertical: 15,
                                                      horizontal: 30),
                                                  backgroundColor:
                                                      Colors.grey.shade100,
                                                  foregroundColor: const Color(
                                                      0xff911f2a), // Button text color
                                                  side: BorderSide(
                                                      color: Colors.black,
                                                      width: Width *
                                                          0.001), // Border color
                                                  shape: RoundedRectangleBorder(
                                                    borderRadius: BorderRadius
                                                        .circular(Width *
                                                            0.01), // Border radius for rounded corners
                                                  ),
                                                ),
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Text(
                                                      'Add Image',
                                                      style: TextStyle(
                                                          fontSize:
                                                              Width * 0.015),
                                                    ),
                                                    Image.asset(
                                                      'asset/icons/image-editing.png',
                                                      width: Width * 0.05,
                                                      height: Height * 0.05,
                                                    ),
                                                  ],
                                                )),
                                          ),
                                          SizedBox(
                                            height: Height * 0.01,
                                          ),
                                          SizedBox(
                                            height: Height * 0.06,
                                            width: Width * 0.35,
                                            child: ElevatedButton(
                                                onPressed: () {
                                                  // Add your button click logic here
                                                  _showAlertDialog(
                                                      context,
                                                      addProductController
                                                          .productDescriptioncontroller,
                                                      'description');
                                                },
                                                style: ElevatedButton.styleFrom(
                                                  padding: const EdgeInsets
                                                      .symmetric(
                                                      vertical: 15,
                                                      horizontal: 30),
                                                  backgroundColor:
                                                      Colors.grey.shade100,
                                                  foregroundColor: const Color(
                                                      0xff911f2a), // Button text color
                                                  side: BorderSide(
                                                      color: Colors.black,
                                                      width: Width *
                                                          0.001), // Border color
                                                  shape: RoundedRectangleBorder(
                                                    borderRadius: BorderRadius
                                                        .circular(Width *
                                                            0.01), // Border radius for rounded corners
                                                  ),
                                                ),
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Text(
                                                      'Add Discription',
                                                      style: TextStyle(
                                                          fontSize:
                                                              Width * 0.015),
                                                    ),
                                                    Image.asset(
                                                      'asset/icons/edit-text.png',
                                                      width: Width * 0.05,
                                                      height: Height * 0.05,
                                                    ),
                                                  ],
                                                )),
                                          ),
                                          SizedBox(
                                            height: Height * 0.01,
                                          ),
                                          SizedBox(
                                            height: Height * 0.06,
                                            width: Width * 0.35,
                                            child: ElevatedButton(
                                                onPressed: () {
                                                  // Add your button click logic here
                                                  _showAlertDialog(
                                                      context,
                                                      addProductController
                                                          .productPricecontroller,
                                                      'price');
                                                },
                                                style: ElevatedButton.styleFrom(
                                                  padding: const EdgeInsets
                                                      .symmetric(
                                                      vertical: 15,
                                                      horizontal: 30),
                                                  backgroundColor:
                                                      Colors.grey.shade100,
                                                  foregroundColor: const Color(
                                                      0xff911f2a), // Button text color
                                                  side: BorderSide(
                                                      color: Colors.black,
                                                      width: Width *
                                                          0.001), // Border color
                                                  shape: RoundedRectangleBorder(
                                                    borderRadius: BorderRadius
                                                        .circular(Width *
                                                            0.01), // Border radius for rounded corners
                                                  ),
                                                ),
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Text(
                                                      'Add Price',
                                                      style: TextStyle(
                                                          fontSize:
                                                              Width * 0.015),
                                                    ),
                                                    Image.asset(
                                                      'asset/icons/rupee.png',
                                                      width: Width * 0.05,
                                                      height: Height * 0.05,
                                                    ),
                                                  ],
                                                )),
                                          ),
                                          SizedBox(
                                            height: Height * 0.01,
                                          ),
                                          SizedBox(
                                            height: Height * 0.06,
                                            width: Width * 0.35,
                                            child: ElevatedButton(
                                                onPressed: () async {
                                                  // Add your button click logic here
                                                  _showAlertDialog(
                                                          context,
                                                          addProductController
                                                              .productOffercontroller,
                                                          'offer')
                                                      .then((value) =>
                                                          addProductController.changeData(
                                                              addProductController
                                                                  .productOffer,
                                                              addProductController
                                                                  .productOffercontroller));
                                                },
                                                style: ElevatedButton.styleFrom(
                                                  padding: const EdgeInsets
                                                      .symmetric(
                                                      vertical: 15,
                                                      horizontal: 30),
                                                  backgroundColor:
                                                      Colors.grey.shade100,
                                                  foregroundColor: const Color(
                                                      0xff911f2a), // Button text color
                                                  side: BorderSide(
                                                      color: Colors.black,
                                                      width: Width *
                                                          0.001), // Border color
                                                  shape: RoundedRectangleBorder(
                                                    borderRadius: BorderRadius
                                                        .circular(Width *
                                                            0.01), // Border radius for rounded corners
                                                  ),
                                                ),
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Text(
                                                      'Add Offer',
                                                      style: TextStyle(
                                                          fontSize:
                                                              Width * 0.015),
                                                    ),
                                                    Image.asset(
                                                      'asset/icons/discount.png',
                                                      width: Width * 0.05,
                                                      height: Height * 0.05,
                                                    ),
                                                  ],
                                                )),
                                          ),
                                          SizedBox(
                                            height: Height * 0.01,
                                          ),
                                          //buttons
                                        ],
                                      )
                                    ],
                                  ),
                                  SizedBox(
                                    height: Height * 0.02,
                                  ),
                                  Row(
                                    children: [
                                      SizedBox(
                                        width: Width * 0.02,
                                      ),
                                      Text(
                                        'discription?',
                                        style:
                                            TextStyle(fontSize: Width * 0.015),
                                      ),
                                      SizedBox(
                                        width: Width * 0.02,
                                      ),
                                    ],
                                  ),
                                  const Spacer(),
                                  Row(
                                    children: [
                                      SizedBox(
                                        width: Width * 0.01,
                                      ),
                                      //offer
                                      Container(
                                        height: Height * 0.07,
                                        width: Width * 0.15,
                                        decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(
                                                Width * 0.01),
                                            color: Colors.white,
                                            border: Border.all(
                                                color: const Color(0xff911f2a),
                                                width: Width * 0.001)),
                                        child: Row(
                                          children: [
                                            SizedBox(
                                              width: Width * 0.01,
                                            ),
                                            Text(
                                                'offer?     ${addProductController.productOffer}',
                                                style: TextStyle(
                                                    fontSize: Height * 0.02,
                                                    fontWeight: FontWeight.bold,
                                                    color: Colors.black)),
                                            const Spacer(),
                                            Image.asset(
                                              'asset/icons/discount.png',
                                              width: Width * 0.05,
                                              height: Height * 0.04,
                                            ),
                                            SizedBox(
                                              width: Width * 0.005,
                                            ),
                                          ],
                                        ),
                                      ),
                                      const Spacer(),
                                      Container(
                                        height: Height * 0.07,
                                        width: Width * 0.15,
                                        decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(
                                                Width * 0.01),
                                            color: Colors.white,
                                            border: Border.all(
                                                color: const Color(0xff911f2a),
                                                width: Width * 0.001)),
                                        child: Row(
                                          children: [
                                            SizedBox(
                                              width: Width * 0.01,
                                            ),
                                            Text(
                                              'price?',
                                              style: TextStyle(
                                                  fontSize: Height * 0.02,
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.black),
                                            ),
                                            const Spacer(),
                                            Image.asset(
                                              'asset/icons/rupee.png',
                                              width: Width * 0.05,
                                              height: Height * 0.04,
                                            ),
                                            SizedBox(
                                              width: Width * 0.005,
                                            ),
                                          ],
                                        ),
                                      ),
                                      SizedBox(
                                        width: Width * 0.01,
                                      )
                                    ],
                                  ),
                                  SizedBox(
                                    height: Height * 0.01,
                                  )
                                ],
                              ),
                            ),
                          ),
                        ]),
                      ),
                      SizedBox(
                        height: Height * 0.01,
                      )
                    ],
                  );
                }),
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
}

// void _showAlertDialog(BuildContext context) {
//   final String title;
//   final String Price;
//   TextEditingController textFieldController = TextEditingController();
//
//   showDialog(
//     context: context,
//     builder: (BuildContext context) {
//       return AlertDialog(
//         title: Text('Enter Text'),
//         content: TextField(
//           controller: textFieldController,
//           decoration: InputDecoration(hintText: 'Type something...'),
//         ),
//         actions: <Widget>[
//           TextButton(
//             onPressed: () {
//               Navigator.of(context).pop(); // Close the alert dialog
//             },
//             child: Text('Cancel'),
//           ),
//           TextButton(
//             onPressed: () {
//               // Access the entered text using textFieldController.text
//               print('Entered text: ${textFieldController.text}');
//               Navigator.of(context).pop(); // Close the alert dialog
//             },
//             child: Text('OK'),
//           ),
//         ],
//       );
//     },
//   );
// }
Future _showAlertDialog(
  BuildContext context,
  TextEditingController textFieldController,
  String title,
) async {
  // TextEditingController textFieldController = TextEditingController();
  final Height = MediaQuery.of(context).size.height;
  final Width = MediaQuery.of(context).size.width;

  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text('Enter $title here'),
        content: TextField(
          controller: textFieldController,
          decoration: const InputDecoration(hintText: 'Type something...'),
        ),
        actions: <Widget>[
          TextButton(
            onPressed: () {
              Navigator.of(context).pop(); // Close the alert dialog
            },
            child: const Text(
              'Cancel',
              style: TextStyle(
                color: Color(0xff911f2a),
              ),
            ),
          ),
          TextButton(
            onPressed: () {
              // Access the entered text using textFieldController.text
              print('Entered text: ${textFieldController.text}');
              Navigator.of(context).pop(); // Close the alert dialog
            },
            child: Container(
              height: Height * 0.04,
              width: Width * 0.04,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(Width * 0.01),
                color: const Color(0xff3C8A3C),
              ),
              child: const Center(
                child: Text(
                  'OK',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
        ],
      );
    },
  );
}
