import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AddDelievryBoy extends StatelessWidget {
  const AddDelievryBoy({super.key});
  @override
  Widget build(BuildContext context) {
    final Height = MediaQuery.of(context).size.height;
    final Width = MediaQuery.of(context).size.width;
    List<Map<String, dynamic>> items = [
      {
        'title': 'Deliveryboy 1',
      },
      {
        'title': 'Deliveryboy 2',
      },
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
                          color: Colors.white.withOpacity(0.5)),
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
                                'Add Delivery Boy',
                                style: TextStyle(
                                    fontSize: Height * 0.04,
                                    fontWeight: FontWeight.bold),
                              ),
                              Spacer(),
                              // InkWell(
                              //   onTap: () {},
                              //   child: SizedBox(
                              //       height: Height * 0.07,
                              //       width: Width * 0.06,
                              //       child: Container(
                              //         decoration: BoxDecoration(
                              //           shape: BoxShape.circle,
                              //           color: Color(0xff3C8A3C),
                              //         ),
                              //         child: Icon(
                              //           Icons.add,
                              //           size: Height * 0.05,
                              //           color: Colors.white,
                              //         ),
                              //       )),
                              // ),
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
                          Container(
                            margin: EdgeInsets.symmetric(
                                vertical: Width * 0.02,
                                horizontal: Width * 0.03),
                            height: Height * 0.7,
                            width: Width * 0.8,
                            // color: Colors.greenAccent,
                            child: MyNameFieldWidget(),
                          )
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

class MyNameFieldWidget extends StatefulWidget {
  @override
  _MyNameFieldWidgetState createState() => _MyNameFieldWidgetState();
}

class _MyNameFieldWidgetState extends State<MyNameFieldWidget> {
  // Create TextEditingController for each text field
  TextEditingController _namecontroller = TextEditingController();
  TextEditingController _useridcontroller = TextEditingController();
  TextEditingController _passwordcontroller = TextEditingController();
  TextEditingController _confirmpasswordcontroller = TextEditingController();
  TextEditingController _vehiclenumbercontroller = TextEditingController();
  TextEditingController _licensenumbercontroller = TextEditingController();

  // @override
  // void dispose() {
  //   // Dispose controllers when the widget is disposed
  //   _controller1.dispose();
  //   _controller2.dispose();
  //   _controller3.dispose();
  //   _controller4.dispose();
  //   _controller5.dispose();
  //   _controller6.dispose();
  //   super.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    final Height = MediaQuery.of(context).size.height;
    final Width = MediaQuery.of(context).size.width;
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: Height*0.03,),
            Row(
              children: [
                Text(
                  'Name',
                  style: TextStyle(
                      fontSize: Height * 0.03, fontWeight: FontWeight.bold),
                )
              ],
            ),
            SizedBox(
              height: Height * 0.1, // Adjust the height as needed
              width: Width * 0.3, // Adjust the width as needed
              child: TextFormField(
                controller: _namecontroller,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderSide: BorderSide(width: 2),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: BorderSide(width: 2, color: Colors.black),
                  ),
                  focusColor: Colors.greenAccent,
                  hintText: 'Enter your Name',
                ),
              ),
            ),
            SizedBox(
              height: Height * 0.02,
            ),
            Row(
              children: [
                Text(
                  'User Id',
                  style: TextStyle(
                      fontSize: Height * 0.03, fontWeight: FontWeight.bold),
                )
              ],
            ),
            SizedBox(
              height: Height * 0.1, // Adjust the height as needed
              width: Width * 0.3, // Adjust the width as needed
              child: TextFormField(
                controller: _useridcontroller,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderSide: BorderSide(width: 2),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: BorderSide(width: 2, color: Colors.black),
                  ),
                  focusColor: Colors.greenAccent,
                  hintText: 'Enter User Id',
                ),
              ),
            ),
            SizedBox(
              height: Height * 0.02,
            ),
            Row(
              children: [
                Text(
                  'Password',
                  style: TextStyle(
                      fontSize: Height * 0.03, fontWeight: FontWeight.bold),
                )
              ],
            ),
            SizedBox(
              height: Height * 0.1, // Adjust the height as needed
              width: Width * 0.3, // Adjust the width as needed
              child: TextFormField(
                controller: _passwordcontroller,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderSide: BorderSide(width: 2),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: BorderSide(width: 2, color: Colors.black),
                  ),
                  focusColor: Colors.greenAccent,
                  hintText: 'Enter Password',
                ),
              ),
            ),
            SizedBox(
              height: 0.02,
            ),
            SizedBox(
              height: Height * 0.02,
            ),
            Row(
              children: [
                Text(
                  'Confirm password',
                  style: TextStyle(
                      fontSize: Height * 0.03, fontWeight: FontWeight.bold),
                )
              ],
            ),
            SizedBox(
              height: Height * 0.1, // Adjust the height as needed
              width: Width * 0.3, // Adjust the width as needed
              child: TextFormField(
                controller: _confirmpasswordcontroller,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderSide: BorderSide(width: 2),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: BorderSide(width: 2, color: Colors.black),
                  ),
                  focusColor: Colors.greenAccent,
                  hintText: 'Confirm password',
                ),
              ),
            )
          ],
        ),

        SizedBox(width: Width*0.1,),

        // Column with 2 text fields
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text('(optional)',style: TextStyle(
                  color: Colors.grey,
                  fontSize: Height*0.02,
                ),),
              ],
            ),
            Row(
              children: [
                Text(
                  'Vehicle Number',
                  style: TextStyle(
                      fontSize: Height * 0.03, fontWeight: FontWeight.bold),
                )
              ],
            ),
            SizedBox(
              height: Height * 0.1, // Adjust the height as needed
              width: Width * 0.3, // Adjust the width as needed
              child: TextFormField(
                controller:_vehiclenumbercontroller,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderSide: BorderSide(width: 2),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: BorderSide(width: 2, color: Colors.black),
                  ),
                  focusColor: Colors.greenAccent,
                  hintText: 'Enter vehicle Number',
                ),
              ),
            ),
            SizedBox(
              height: Height * 0.02,
            ),
            Row(
              children: [
                Text(
                  'License Number',
                  style: TextStyle(
                      fontSize: Height * 0.03, fontWeight: FontWeight.bold),
                )
              ],
            ),
            SizedBox(
              height: Height * 0.1, // Adjust the height as needed
              width: Width * 0.3, // Adjust the width as needed
              child: TextFormField(
                controller: _licensenumbercontroller,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderSide: BorderSide(width: 2),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: BorderSide(width: 2, color: Colors.black),
                  ),
                  focusColor: Colors.greenAccent,
                  hintText: 'Enter License Number',
                ),
              ),
            )
          ],
        ),
      ],
    );
  }
}
