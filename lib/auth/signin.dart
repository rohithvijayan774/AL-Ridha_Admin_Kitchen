import 'package:admin/Dashboard/home.dart';
import 'package:admin/controller/admin_controller.dart';
import 'package:admin/kitchen/home.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SignIn extends StatelessWidget {
  const SignIn({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    final signinKey = GlobalKey<FormState>();
    final signinController = Provider.of<AdminController>(context);

    return Scaffold(
      body: Container(
        height: height,
        width: width,
        color: const Color(0xff61042b),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    IconButton(
                      onPressed: () {
                        _showOptionsDialog(context);
                      },
                      icon: const Icon(Icons.supervised_user_circle_outlined),
                      iconSize: height * 0.06,
                      color: const Color(0xffe97427),
                    ),
                    // Spacer(),
                    SizedBox(
                      width: width * 0.4,
                    )
                  ],
                ),
                Image.asset(
                  'asset/images/alridabgn.png',
                  width: width * 0.45,
                ),
              ],
            ),
            SizedBox(
              width: width * 0.1,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  margin: EdgeInsets.symmetric(horizontal: width * 0.015),
                  height: height * .6,
                  width: width * 0.3,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(width * 0.005),
                      // color: Colors.blueAccent,
                      border: Border.all(width: 2)),
                  child: Column(
                    children: [
                      SizedBox(
                        height: height * 0.01,
                      ),
                      const Text(
                        'Sign In',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 30,
                            color: Colors.white),
                      ),
                      SizedBox(
                        height: height * 0.04,
                      ),
                      SizedBox(
                        height: height * 0.45,
                        width: width * 0.25,
                        // color: Colors.redAccent,
                        child: Form(
                          key: signinKey,
                          child: SingleChildScrollView(
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    Text(
                                      'Email',
                                      style: TextStyle(
                                          fontSize: height * 0.025,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white),
                                    ),
                                  ],
                                ),
                                TextFormField(
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return "* required field";
                                    } else {
                                      return null;
                                    }
                                  },
                                  keyboardType: TextInputType.emailAddress,
                                  style: const TextStyle(color: Colors.white),
                                  controller: signinController.emailController,
                                  decoration: InputDecoration(
                                      border: OutlineInputBorder(
                                        borderSide: const BorderSide(width: 2),
                                        borderRadius: BorderRadius.circular(
                                            width * 0.005),
                                      ),
                                      enabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(
                                            width * 0.005),
                                        borderSide: const BorderSide(
                                            width: 4, color: Color(0xffe97427)),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(
                                            width * 0.005),
                                        borderSide: const BorderSide(
                                            width: 4, color: Color(0xffe97427)),
                                      ),
                                      hintText: 'Enter your Email',
                                      hintStyle:
                                          const TextStyle(color: Colors.grey)),
                                ),
                                SizedBox(
                                  height: height * 0.04,
                                ),
                                Row(
                                  children: [
                                    Text(
                                      'Password',
                                      style: TextStyle(
                                          fontSize: height * 0.025,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white),
                                    ),
                                  ],
                                ),
                                TextFormField(
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return "* required field";
                                    } else {
                                      return null;
                                    }
                                  },
                                  obscureText: signinController.obscureText,
                                  style: const TextStyle(color: Colors.white),
                                  controller:
                                      signinController.passwordController,
                                  decoration: InputDecoration(
                                      suffixIcon: IconButton(
                                        icon: Icon(
                                          signinController.obscureText
                                              ? Icons.visibility_off
                                              : Icons.visibility,
                                          color: Colors.grey,
                                        ),
                                        onPressed: () {
                                          signinController.changeObscure();
                                        },
                                      ),
                                      border: OutlineInputBorder(
                                        borderSide: const BorderSide(width: 2),
                                        borderRadius: BorderRadius.circular(
                                            width * 0.005),
                                      ),
                                      enabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(
                                            width * 0.005),
                                        borderSide: const BorderSide(
                                            width: 4, color: Color(0xffe97427)),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(
                                            width * 0.005),
                                        borderSide: const BorderSide(
                                            width: 4, color: Color(0xffe97427)),
                                      ),
                                      hintText: 'Enter your password',
                                      hintStyle:
                                          const TextStyle(color: Colors.grey)),
                                ),
                                SizedBox(height: height * 0.10),
                                SizedBox(
                                  height: height * 0.08,
                                  width: width * 0.3,
                                  child: ElevatedButton(
                                    onPressed: () {
                                      if (signinKey.currentState!.validate()) {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    const Home()));
                                      }

                                      // Add your button onPressed logic here
                                    },
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor:
                                          Colors.black, // Background color
                                      foregroundColor:
                                          Colors.white, // Text color
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(width *
                                            0.005), // Rectangular border radius
                                      ),
                                    ),
                                    child: Text(
                                      'Sign In',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: height * 0.025),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
            SizedBox(
              width: width * 0.1,
            ) //imp
          ],
        ),
      ),
    );
  }

  void _showOptionsDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Select User type'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                title: const Text('Admin'),
                onTap: () {
                  // Handle Customer option click
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: const Text('Kitchen'),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const KitchenHome(),
                      ));
                  // Handle Delivery Boy option click
                  // Navigator.pop(context);
                },
              ),
            ],
          ),
        );
      },
    );
  }
}
