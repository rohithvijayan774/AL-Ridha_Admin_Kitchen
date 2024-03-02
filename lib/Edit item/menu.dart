import 'package:admin/Edit%20item/Item%20details.dart';
import 'package:admin/Edit%20item/MenuItemAdd.dart';
import 'package:admin/Edit%20item/Sp%20add%20item.dart';
import 'package:admin/controller/admin_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FriedChicken extends StatelessWidget {
  const FriedChicken({super.key});
  @override
  Widget build(BuildContext context) {
    final Height = MediaQuery.of(context).size.height;
    final Width = MediaQuery.of(context).size.width;
    // List<Map<String, dynamic>> items = [
    //   {
    //     'title': '1 Pcs',
    //     'image': 'asset/images/menu/menu.png',
    //     'page': const ItemDetails(
    //       title: '1 Pcs',
    //       image: 'asset/images/menu/menu.png',
    //       price: '69',
    //       discription: '1 Pcs',
    //     )
    //   },
    //   {
    //     'title': '2 Pcs',
    //     'image': 'asset/images/menu/menu.png',
    //     'page': const ItemDetails(
    //       title: '2 Pcs',
    //       image: 'asset/images/menu/menu.png',
    //       price: '129',
    //       discription: '2 Pcs',
    //     )
    //   },
    //   {
    //     'title': '4 Pcs',
    //     'image': 'asset/images/menu/menu.png',
    //     'page': const ItemDetails(
    //       title: '4 Pcs',
    //       image: 'asset/images/menu/menu.png',
    //       price: '269',
    //       discription: '4 Pcs',
    //     )
    //   },
    //   {
    //     'title': '6 Pcs',
    //     'image': 'asset/images/menu/menu.png',
    //     'page': const ItemDetails(
    //       title: '6 Pcs',
    //       image: 'asset/images/menu/menu.png',
    //       price: '409',
    //       discription: '6 Pcs',
    //     )
    //   },
    //   {
    //     'title': '8 Pcs',
    //     'image': 'asset/images/menu/menu.png',
    //     'page': const ItemDetails(
    //       title: '8 Pcs',
    //       image: 'asset/images/menu/menu.png',
    //       price: '589',
    //       discription: '8 Pcs',
    //     )
    //   },
    //   {
    //     'title': '10 Pcs',
    //     'image': 'asset/images/menu/menu.png',
    //     'page': const ItemDetails(
    //       title: '10 Pcs',
    //       image: 'asset/images/menu/menu.png',
    //       price: '649',
    //       discription: '10 Pcs',
    //     )
    //   },
    //   {
    //     'title': '16 Pcs',
    //     'image': 'asset/images/menu/menu.png',
    //     'page': const ItemDetails(
    //       title: '16 Pcs',
    //       image: 'asset/images/menu/menu.png',
    //       price: '1019',
    //       discription: '16 Pcs',
    //     )
    //   },
    //   {
    //     'title': '24 Pcs',
    //     'image': 'asset/images/menu/menu.png',
    //     'page': const ItemDetails(
    //       title: '24 Pcs',
    //       image: 'asset/images/menu/menu.png',
    //       price: '1519',
    //       discription: '24 Pcs',
    //     )
    //   },
    // ];
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
                                'Menu',
                                style: TextStyle(
                                    fontSize: Height * 0.04,
                                    fontWeight: FontWeight.bold),
                              ),
                              const Spacer(),
                              InkWell(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            const AddItems(category: 'Menu'),
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
                                  builder: (context, menuController, _) {
                                return FutureBuilder(
                                    future:
                                        menuController.fetchProducts('Menu'),
                                    builder: (context, snapshot) {
                                      return snapshot.connectionState ==
                                              ConnectionState.waiting
                                          ? const Center(
                                              child: CircularProgressIndicator(
                                                color: Colors.black,
                                              ),
                                            )
                                          : menuController.productsList.isEmpty
                                              ? const Center(
                                                  child:
                                                      Text('No Products Found'),
                                                )
                                              : GridView.builder(
                                                  gridDelegate:
                                                      const SliverGridDelegateWithFixedCrossAxisCount(
                                                    crossAxisCount: 3,
                                                    crossAxisSpacing: 60,
                                                    mainAxisSpacing: 60,
                                                    childAspectRatio: 5 / 3,
                                                  ),
                                                  itemCount: menuController
                                                      .productsList.length,
                                                  itemBuilder:
                                                      (context, index) {
                                                    return GestureDetector(
                                                      onTap: () {
                                                        Navigator.push(
                                                            context,
                                                            MaterialPageRoute(
                                                              builder:
                                                                  (context) =>
                                                                      ItemDetails(
                                                                title: menuController
                                                                    .productsList[
                                                                        index]
                                                                    .productTitle,
                                                                discription: menuController
                                                                    .productsList[
                                                                        index]
                                                                    .productDescription,
                                                                price: menuController
                                                                    .productsList[
                                                                        index]
                                                                    .productPrice
                                                                    .toString(),
                                                                image: menuController
                                                                    .productsList[
                                                                        index]
                                                                    .productImage,
                                                              ),
                                                            ));
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
                                                                  menuController
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
                                                            menuController
                                                                .productsList[
                                                                    index]
                                                                .productDescription,
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
