import 'package:admin/Dashboard/home.dart';
import 'package:admin/controller/admin_controller.dart';
import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AddDelievryBoy extends StatelessWidget {
  const AddDelievryBoy({super.key});
  @override
  Widget build(BuildContext context) {
    final Height = MediaQuery.of(context).size.height;
    final Width = MediaQuery.of(context).size.width;

    final addDelvBoyController = Provider.of<AdminController>(context);

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
                              const Spacer(),
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
                                child: Consumer<AdminController>(builder:
                                    (context, addDelvBoyController, _) {
                                  return ElevatedButton(
                                    onPressed: () {
                                      if (addDelvBoyController
                                          .addDelvBoyKey.currentState!
                                          .validate()) {
                                        addDelvBoyController.saveDeliveryboy(
                                            addDelvBoyController
                                                .namecontroller.text,
                                            addDelvBoyController
                                                .userEmailcontroller.text,
                                            addDelvBoyController
                                                .passwordcontroller.text,
                                            addDelvBoyController
                                                .licensenumbercontroller.text,
                                            addDelvBoyController
                                                .phonenumbercontroller.text,
                                            addDelvBoyController
                                                .vehiclenumbercontroller.text,
                                            context);
                                      }
                                      // Add your button click logic here
                                    },
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: const Color(0xff3C8A3C),
                                      foregroundColor:
                                          Colors.white, // Text color
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
                                  );
                                }),
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
                            child: const MyNameFieldWidget(),
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

class MyNameFieldWidget extends StatelessWidget {
  const MyNameFieldWidget({super.key});

  // Create TextEditingController for each text field
  @override
  Widget build(BuildContext context) {
    final Height = MediaQuery.of(context).size.height;
    final Width = MediaQuery.of(context).size.width;
    final addDelvBoyController = Provider.of<AdminController>(context);
    return Form(
      key: addDelvBoyController.addDelvBoyKey,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: Height * 0.03,
              ),
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
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "* required field";
                    } else {
                      return null;
                    }
                  },
                  controller: addDelvBoyController.namecontroller,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderSide: const BorderSide(width: 2),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide:
                          const BorderSide(width: 2, color: Colors.black),
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
                    'User Email',
                    style: TextStyle(
                        fontSize: Height * 0.03, fontWeight: FontWeight.bold),
                  )
                ],
              ),
              SizedBox(
                height: Height * 0.1, // Adjust the height as needed
                width: Width * 0.3, // Adjust the width as needed
                child: TextFormField(
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "* required field";
                    } else {
                      return null;
                    }
                  },
                  controller: addDelvBoyController.userEmailcontroller,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderSide: const BorderSide(width: 2),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide:
                          const BorderSide(width: 2, color: Colors.black),
                    ),
                    focusColor: Colors.greenAccent,
                    hintText: 'Enter User Email',
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
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "* required field";
                    } else {
                      return null;
                    }
                  },
                  controller: addDelvBoyController.passwordcontroller,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderSide: const BorderSide(width: 2),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide:
                          const BorderSide(width: 2, color: Colors.black),
                    ),
                    focusColor: Colors.greenAccent,
                    hintText: 'Enter Password',
                  ),
                ),
              ),
              const SizedBox(
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
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "* required field";
                    } else if (value !=
                        addDelvBoyController.passwordcontroller.text) {
                      return "* password didnot match";
                    } else {
                      return null;
                    }
                  },
                  controller: addDelvBoyController.confirmpasswordcontroller,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderSide: const BorderSide(width: 2),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide:
                          const BorderSide(width: 2, color: Colors.black),
                    ),
                    focusColor: Colors.greenAccent,
                    hintText: 'Confirm password',
                  ),
                ),
              )
            ],
          ),

          SizedBox(
            width: Width * 0.1,
          ),

          // Column with 2 text fields
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(
                    '(optional)',
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: Height * 0.02,
                    ),
                  ),
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
                  controller: addDelvBoyController.vehiclenumbercontroller,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderSide: const BorderSide(width: 2),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide:
                          const BorderSide(width: 2, color: Colors.black),
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
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "* required field";
                    } else {
                      return null;
                    }
                  },
                  controller: addDelvBoyController.licensenumbercontroller,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderSide: const BorderSide(width: 2),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide:
                          const BorderSide(width: 2, color: Colors.black),
                    ),
                    focusColor: Colors.greenAccent,
                    hintText: 'Enter License Number',
                  ),
                ),
              ),
              SizedBox(
                height: Height * 0.02,
              ),
              Row(
                children: [
                  Text(
                    'Mobile Number',
                    style: TextStyle(
                        fontSize: Height * 0.03, fontWeight: FontWeight.bold),
                  )
                ],
              ),
              SizedBox(
                height: Height * 0.1, // Adjust the height as needed
                width: Width * 0.3, // Adjust the width as needed
                child: TextFormField(
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "* required field";
                    } else {
                      return null;
                    }
                  },
                  controller: addDelvBoyController.phonenumbercontroller,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderSide: const BorderSide(width: 2),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide:
                          const BorderSide(width: 2, color: Colors.black),
                    ),
                    focusColor: Colors.greenAccent,
                    hintText: 'Enter Mobile Number',
                  ),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
