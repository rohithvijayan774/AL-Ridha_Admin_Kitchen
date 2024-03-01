import 'package:flutter/material.dart';

class AdminNotification extends StatelessWidget {
  const AdminNotification({super.key});
  @override
  Widget build(BuildContext context) {
    final Height = MediaQuery.of(context).size.height;
    final Width = MediaQuery.of(context).size.width;
    List<Map<String, dynamic>> items = [
      {'title': 'Delivery Boy 1', 'subtitle': 'is online', 'time': '8:29 PM'},
      {'title': 'Order No:002', 'subtitle': 'delivered', 'time': '8:40 PM'},
    ];

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
                          color: Colors.white.withOpacity(0.25)),
                      child: Column(
                        children: [
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
                                'Notifications',
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
                                    backgroundColor: Color(0xff911f2a),
                                    foregroundColor: Colors.white, // Text color
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(Height *
                                          0.01), // Adjust the border radius as needed
                                    ),
                                  ),
                                  child: Text(
                                    'Clear',
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
                          Container(
                              margin: EdgeInsets.all(
                                Width * 0.02,
                              ),
                              height: Height * 0.7,
                              width: Width * 0.8,
                              // color: Colors.greenAccent,
                              child: ListView.builder(
                                  // padding: EdgeInsets.symmetric(
                                  //     vertical: Height * 0.05),
                                  scrollDirection: Axis.vertical,
                                  itemCount: items.length,
                                  itemBuilder: (context, index) {
                                    return Container(
                                        margin: EdgeInsets.all(Width * 0.01),
                                        height: Height * 0.1,
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius: BorderRadius.circular(
                                              Width * 0.01),
                                          border: Border.all(),
                                        ),
                                        child: Row(
                                          children: [
                                            SizedBox(
                                              width: Width * 0.05,
                                            ),
                                            Text(
                                              items[index]['title'],
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: Height * 0.03),
                                            ),
                                            SizedBox(
                                              width: Width * 0.02,
                                            ),
                                            // Spacer(),
                                            Text(
                                              items[index]['subtitle'],
                                              style: TextStyle(
                                                  // fontWeight: FontWeight.bold,
                                                  fontSize: Height * 0.03,
                                                  color: Color(0xff3C8A3C)),
                                            ),
                                            Spacer(),
                                            Text(
                                              items[index]['time'],
                                              style: TextStyle(
                                                // fontWeight: FontWeight.bold,
                                                fontSize: Height * 0.02,
                                                color: Color(0xff911f2a),
                                              ),
                                            ),
                                            SizedBox(
                                              width: Width * 0.05,
                                            ),
                                          ],
                                        ));
                                  }))
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
}
