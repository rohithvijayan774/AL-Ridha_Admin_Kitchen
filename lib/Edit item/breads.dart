import 'package:admin/Edit%20item/Item%20details.dart';
import 'package:admin/Edit%20item/Sp%20Item%20details.dart';
import 'package:admin/Edit%20item/Sp%20add%20item.dart';
import 'package:admin/controller/admin_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Breads extends StatelessWidget {
  const Breads({super.key});
  @override
  Widget build(BuildContext context) {
    final Height = MediaQuery.of(context).size.height;
    final Width = MediaQuery.of(context).size.width;
    List<Map<String, dynamic>> items = [
      {
        'title': 'Bun',
        'image': 'asset/images/menu/bun.jpg',
        'page': const ItemDetails(
          title: 'Bun',
          image: 'asset/images/menu/bun.jpg',
          price: '9',
          discription: 'Bun',
        )
      },
      {
        'title': 'Kuboose',
        'image': 'asset/images/menu/kuboose.jpg',
        'page': const ItemDetails(
          title: 'Kuboose',
          image: 'asset/images/menu/kuboose.jpg',
          price: '9',
          discription: 'Kuboose',
        )
      },
      {
        'title': 'Butter Bread',
        'image': 'asset/images/menu/buttur-rotti-min.jpg',
        'page': const ItemDetails(
          title: 'Butter Bread',
          image: 'asset/images/menu/buttur-rotti-min.jpg',
          price: '19',
          discription: 'Butter Bread',
        )
      },
      {
        'title': 'Garlic Bread',
        'image': 'asset/images/menu/garlic-bread-min.jpg',
        'page': const ItemDetails(
          title: 'Garlic Bread',
          image: 'asset/images/menu/garlic-bread-min.jpg',
          price: '19',
          discription: 'Garlic Bread',
        )
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
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              SizedBox(
                                width: Width * 0.02,
                              ),
                              Text(
                                'Breads',
                                style: TextStyle(
                                    fontSize: Height * 0.04,
                                    fontWeight: FontWeight.bold),
                              ),
                              const Spacer(),
                              InkWell(
                                onTap: () {
                                  Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) =>
                                        const AddItems(category: 'Breads'),
                                  ));
                                },
                                child: SizedBox(
                                    height: Height * 0.07,
                                    width: Width * 0.06,
                                    child: Container(
                                      decoration: const BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: Color(0xff3C8A3C),
                                      ),
                                      child: Icon(
                                        Icons.add,
                                        size: Height * 0.05,
                                        color: Colors.white,
                                      ),
                                    )),
                              ),
                              SizedBox(
                                height: Height * 0.05,
                                width: Width * 0.07,
                                child: ElevatedButton(
                                  onPressed: () {
                                    // Add your button click logic here
                                  },
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.blueAccent
                                        .shade400, // Background color of the button
                                    foregroundColor: Colors.white, // Text color
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(Height *
                                          0.01), // Adjust the border radius as needed
                                    ),
                                  ),
                                  child: Text(
                                    'Update',
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
                              child: Consumer<AdminController>(
                                  builder: (context, breadsController, _) {
                                return FutureBuilder(
                                    future: breadsController
                                        .fetchProducts('Breads'),
                                    builder: (context, snapshot) {
                                      return GridView.builder(
                                        gridDelegate:
                                            const SliverGridDelegateWithFixedCrossAxisCount(
                                          crossAxisCount: 3,
                                          crossAxisSpacing: 60,
                                          mainAxisSpacing: 60,
                                          childAspectRatio: 5 / 3,
                                        ),
                                        itemCount: breadsController
                                            .productsList.length,
                                        itemBuilder: (context, index) {
                                          return snapshot.connectionState ==
                                                  ConnectionState.waiting
                                              ? const Center(
                                                  child:
                                                      CircularProgressIndicator(
                                                    color: Colors.black,
                                                  ),
                                                )
                                              : breadsController
                                                      .productsList.isEmpty
                                                  ? const Center(
                                                      child: Text(
                                                          'No Products Found'),
                                                    )
                                                  : GestureDetector(
                                                      onTap: () {
                                                        Navigator.push(
                                                            context,
                                                            MaterialPageRoute(
                                                                builder:
                                                                    (context) =>
                                                                        ItemDetails(
                                                                          title: breadsController
                                                                              .productsList[index]
                                                                              .productTitle,
                                                                          discription: breadsController
                                                                              .productsList[index]
                                                                              .productDescription,
                                                                          price: breadsController
                                                                              .productsList[index]
                                                                              .productPrice
                                                                              .toString(),
                                                                          image: breadsController
                                                                              .productsList[index]
                                                                              .productImage,
                                                                        )));
                                                      },
                                                      child: Container(
                                                        decoration:
                                                            BoxDecoration(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(10),
                                                          color: Colors.white,
                                                          border: Border.all(),
                                                          image: DecorationImage(
                                                              image: NetworkImage(
                                                                  breadsController
                                                                      .productsList[
                                                                          index]
                                                                      .productImage),
                                                              fit:
                                                                  BoxFit.cover),
                                                        ),
                                                        child: Align(
                                                          alignment: Alignment
                                                              .bottomCenter,
                                                          child: Text(
                                                            breadsController
                                                                .productsList[
                                                                    index]
                                                                .productTitle,
                                                            style: TextStyle(
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                                fontSize:
                                                                    Width *
                                                                        0.015,
                                                                color: Colors
                                                                    .white),
                                                          ),
                                                        ),
                                                      ),
                                                    );
                                        },
                                      );
                                    });
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
