import 'package:admin/Edit%20item/deliveryboy%20add.dart';
import 'package:admin/controller/admin_controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DelievryBoy extends StatelessWidget {
  const DelievryBoy({super.key});
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
                                'Delivery Boy',
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
                                          const AddDelievryBoy(),
                                    ),
                                  );
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
                                  builder: (context, delivryBoyController, _) {
                                return FutureBuilder(
                                    future: delivryBoyController
                                        .fetchDeliveryBoys(),
                                    builder: (context, snapshot) {
                                      return snapshot.connectionState ==
                                              ConnectionState.waiting
                                          ? const Center(
                                              child:
                                                  CircularProgressIndicator(),
                                            )
                                          : delivryBoyController
                                                  .deliveryBoysList.isEmpty
                                              ? const Center(
                                                  child: Text(
                                                      'No Delivery Boys Found'),
                                                )
                                              : ListView.builder(
                                                  // padding: EdgeInsets.symmetric(
                                                  //     vertical: Height * 0.05),
                                                  scrollDirection:
                                                      Axis.vertical,
                                                  itemCount:
                                                      delivryBoyController
                                                          .deliveryBoysList
                                                          .length,
                                                  itemBuilder:
                                                      (context, index) {
                                                    return Container(
                                                        margin: EdgeInsets.all(
                                                            Width * 0.01),
                                                        height: Height * 0.1,
                                                        decoration:
                                                            BoxDecoration(
                                                          color: Colors.white,
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      Width *
                                                                          0.01),
                                                          border: Border.all(),
                                                        ),
                                                        child: Row(
                                                          children: [
                                                            SizedBox(
                                                              width:
                                                                  Width * 0.05,
                                                            ),
                                                            Text(
                                                              delivryBoyController
                                                                  .deliveryBoysList[
                                                                      index]
                                                                  .delvryBoyName,
                                                              style: TextStyle(
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold,
                                                                  fontSize:
                                                                      Height *
                                                                          0.03),
                                                            ),
                                                            const Spacer(),
                                                            IconButton(
                                                              iconSize:
                                                                  Height * 0.05,
                                                              onPressed: () {},
                                                              icon: const Icon(Icons
                                                                  .delete_outline_outlined),
                                                              color: const Color(
                                                                  0xff911f2a),
                                                            ),
                                                            SizedBox(
                                                              width:
                                                                  Width * 0.05,
                                                            ),
                                                          ],
                                                        ));
                                                  });
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
