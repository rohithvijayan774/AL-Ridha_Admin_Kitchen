import 'package:admin/Edit%20item/edit%20alert.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

//
class SpItemAdd extends StatefulWidget {
//   final String title;
//   final String discription;
//   final String price;
//   final String image;

  // const SpItemAdd({
  //   super.key,
  //   required this.title,
  //   required this.discription,
  //   required this.price,
  //   required this.image,
  // });

  @override
  State<SpItemAdd> createState() => _SpItemAddState();
}

class _SpItemAddState extends State<SpItemAdd> {
  @override
  Widget build(BuildContext context) {
    final Height = MediaQuery.of(context).size.height;
    final Width = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Container(
        height: Height,
        width: Width,
        decoration: BoxDecoration(
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
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Color(0xffF6AF40),
                      ),
                      child: Center(
                        child: IconButton(
                          icon: ImageIcon(
                            AssetImage('asset/icons/left.png'),
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
                            Spacer(),
                            SizedBox(
                              height: Height * 0.05,
                              width: Width * 0.07,
                              child: ElevatedButton(
                                onPressed: () {
                                  // Add your button click logic here
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Color(0xff3C8A3C),
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
                              borderRadius: BorderRadius.circular(Width * 0.01),
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
                                      child: Icon(
                                        Icons.photo,
                                        size: Width * 0.1,
                                      ),
                                    ),
                                    SizedBox(
                                      width: Width * 0.05,
                                    ),
                                    Column(
                                      children: [
                                        Container(
                                          height: Height * 0.06,
                                          width: Width * 0.35,
                                          child: ElevatedButton(
                                              onPressed: () {
                                                _showAlertDialog(context);
                                              },
                                              style: ElevatedButton.styleFrom(
                                                padding: EdgeInsets.symmetric(
                                                    vertical: 15,
                                                    horizontal: 30),
                                                backgroundColor:
                                                    Colors.grey.shade100,
                                                foregroundColor: Color(
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
                                                    'Change Title',
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
                                        Container(
                                          height: Height * 0.06,
                                          width: Width * 0.35,
                                          child: ElevatedButton(
                                              onPressed: () {
                                                // Add your button click logic here
                                              },
                                              style: ElevatedButton.styleFrom(
                                                padding: EdgeInsets.symmetric(
                                                    vertical: 15,
                                                    horizontal: 30),
                                                backgroundColor:
                                                    Colors.grey.shade100,
                                                foregroundColor: Color(
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
                                                    'Change Image',
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
                                        Container(
                                          height: Height * 0.06,
                                          width: Width * 0.35,
                                          child: ElevatedButton(
                                              onPressed: () {
                                                // Add your button click logic here
                                              },
                                              style: ElevatedButton.styleFrom(
                                                padding: EdgeInsets.symmetric(
                                                    vertical: 15,
                                                    horizontal: 30),
                                                backgroundColor:
                                                    Colors.grey.shade100,
                                                foregroundColor: Color(
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
                                                    'Change Discription',
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
                                        Container(
                                          height: Height * 0.06,
                                          width: Width * 0.35,
                                          child: ElevatedButton(
                                              onPressed: () {
                                                // Add your button click logic here
                                              },
                                              style: ElevatedButton.styleFrom(
                                                padding: EdgeInsets.symmetric(
                                                    vertical: 15,
                                                    horizontal: 30),
                                                backgroundColor:
                                                    Colors.grey.shade100,
                                                foregroundColor: Color(
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
                                                    'Change Price',
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
                                        Container(
                                          height: Height * 0.06,
                                          width: Width * 0.35,
                                          child: ElevatedButton(
                                              onPressed: () {
                                                // Add your button click logic here
                                              },
                                              style: ElevatedButton.styleFrom(
                                                padding: EdgeInsets.symmetric(
                                                    vertical: 15,
                                                    horizontal: 30),
                                                backgroundColor:
                                                    Colors.grey.shade100,
                                                foregroundColor: Color(
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
                                                    'Change Offer',
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
                                      style: TextStyle(fontSize: Width * 0.015),
                                    ),
                                    SizedBox(
                                      width: Width * 0.02,
                                    ),
                                  ],
                                ),
                                Spacer(),
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
                                              color: Color(0xff911f2a),
                                              width: Width * 0.001)),
                                      child: Row(
                                        children: [
                                          SizedBox(
                                            width: Width * 0.01,
                                          ),
                                          Text('offer?',
                                              style: TextStyle(
                                                  fontSize: Height * 0.02,
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.black)),
                                          Spacer(),
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
                                    Spacer(),
                                    Container(
                                      height: Height * 0.07,
                                      width: Width * 0.15,
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(
                                              Width * 0.01),
                                          color: Colors.white,
                                          border: Border.all(
                                              color: Color(0xff911f2a),
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
                                          Spacer(),
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
void _showAlertDialog(BuildContext context) {
  TextEditingController textFieldController = TextEditingController();
  final Height = MediaQuery.of(context).size.height;
  final Width = MediaQuery.of(context).size.width;

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
            child: Text(
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
                color: Color(0xff3C8A3C),
              ),
              child: Center(
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
