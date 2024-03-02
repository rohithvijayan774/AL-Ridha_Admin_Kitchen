import 'package:admin/Dashboard/CompletedList.dart';
import 'package:admin/Dashboard/EditItem.dart';
import 'package:admin/Dashboard/MyShop.dart';
import 'package:admin/Dashboard/Notifications.dart';
import 'package:admin/Dashboard/OnGoingOrders.dart';
import 'package:admin/Dashboard/UserList.dart';
import 'package:admin/Dashboard/deliveryboy.dart';
import 'package:admin/auth/signin.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    final Height = MediaQuery.of(context).size.height;
    final Width = MediaQuery.of(context).size.width;
    List<Map<String, dynamic>> items = [
      {
        'title': 'On Going Orders',
        'image': 'asset/images/on going.jpg',
        'page': const OnGoingOrders()
      },
      {
        'title': 'Edit Item',
        'image': 'asset/images/edit item.jpg',
        'page': const EditItem()
      },
      {
        'title': 'Users List',
        'image': 'asset/images/userlist.jpg',
        'page': const UserList()
      },
      {
        'title': 'Completed List',
        'image': 'asset/images/cmpled food orders.jpg',
        'page': const Completed()
      },
      {
        'title': 'My Shop',
        'image': 'asset/images/myshop.jpg',
        'page': const MyShop()
      },
      {
        'title': 'Delivery Boy',
        'image': 'asset/images/delivery boy.jpg',
        'page': const DelievryBoy()
      },
    ];
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
            child: Container(
                margin:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: Column(children: [
                  Row(
                    children: [
                      const Text(
                        'Dashboard',
                        style: TextStyle(
                            fontSize: 30, fontWeight: FontWeight.bold),
                      ),
                      const Spacer(),
                      Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30),
                              color: Colors.black),
                          child: TextButton(
                              onPressed: () {
                                FirebaseAuth.instance.signOut().then((value) =>
                                    Navigator.of(context).pushAndRemoveUntil(
                                        MaterialPageRoute(
                                          builder: (context) => const SignIn(),
                                        ),
                                        (route) => false));
                              },
                              child: const Text(
                                'SignOut',
                                style: TextStyle(color: Color(0xffF6AF40)),
                              ))),
                      const SizedBox(
                        width: 50,
                      ),
                      Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30),
                              color: const Color(0xffF6AF40)),
                          child: IconButton(
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const AdminNotification()));
                              },
                              icon: const ImageIcon(
                                AssetImage(
                                  'asset/icons/bell.png',
                                ),
                                color: Colors.black,
                              ))),
                      SizedBox(
                        width: Width * 0.02,
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Divider(
                    height: 2,
                    thickness: 1,
                    color: Colors.black,
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  Container(
                    height: Height * 0.75,
                    width: Width * 0.95,
                    // color: Colors.greenAccent.shade100,
                    child: Container(
                        child: GridView.builder(
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,
                        crossAxisSpacing: 30,
                        mainAxisSpacing: 30,
                        childAspectRatio: 6 / 3.3,
                      ),
                      itemCount: items.length,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => items[index]['page'],
                                ));
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.white,
                              border: Border.all(),
                              image: DecorationImage(
                                  image: AssetImage(
                                    items[index]['image'],
                                  ),
                                  fit: BoxFit.cover),
                            ),
                            child: Align(
                              alignment: Alignment.bottomCenter,
                              child: Text(
                                items[index]['title'],
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: Width * 0.015,
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    )),
                  )
                ]))));
  }
}
