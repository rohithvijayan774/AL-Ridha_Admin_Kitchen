import 'package:admin/Dashboard/CompletedList.dart';
import 'package:admin/Dashboard/EditItem.dart';
import 'package:admin/Dashboard/MyShop.dart';
import 'package:admin/Dashboard/Notifications.dart';
import 'package:admin/Dashboard/OnGoingOrders.dart';
import 'package:admin/Dashboard/UserList.dart';
import 'package:admin/Dashboard/deliveryboy.dart';
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
        'page': OnGoingOrders()
      },
      {
        'title': 'Edit Item',
        'image': 'asset/images/edit item.jpg',
        'page': EditItem()
      },
      {
        'title': 'Users List',
        'image': 'asset/images/userlist.jpg',
        'page': UserList()
      },
      {
        'title': 'Completed List',
        'image': 'asset/images/cmpled food orders.jpg',
        'page': Completed()
      },
      {
        'title': 'My Shop',
        'image': 'asset/images/myshop.jpg',
        'page': MyShop()
      },
      {
        'title': 'Delivery Boy',
        'image': 'asset/images/delivery boy.jpg',
        'page': DelievryBoy()
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
            child: Container(
                margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: Column(children: [
                  Row(
                    children: [
                      Text(
                        'Dashboard',
                        style: TextStyle(
                            fontSize: 30, fontWeight: FontWeight.bold),
                      ),
                      Spacer(),
                      Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30),
                              color: Color(0xffF6AF40)),
                          child: IconButton(
                              onPressed: () {
                                Navigator.push(context,  MaterialPageRoute(builder: (context) => AdminNotification()));
                              },
                              icon: ImageIcon(
                                AssetImage(
                                  'asset/icons/bell.png',

                                ),
                                color: Colors.black,
                              ))),
                      SizedBox(width: Width*0.02,),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Divider(
                    height: 2,
                    thickness: 1,
                    color: Colors.black,
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  Container(
                    height: Height * 0.75,
                    width: Width * 0.95,
                    // color: Colors.greenAccent.shade100,
                    child: Container(
                        child: GridView.builder(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,
                        crossAxisSpacing: 30 ,
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
                    )

                        ),
                  )
                ]))));
  }
}
