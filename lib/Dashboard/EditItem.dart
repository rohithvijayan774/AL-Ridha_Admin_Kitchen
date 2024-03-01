import 'package:admin/Edit%20item/MenuItemAdd.dart';
import 'package:admin/Edit%20item/breads.dart';
import 'package:admin/Edit%20item/dip.dart';
import 'package:admin/Edit%20item/drinks.dart';
import 'package:admin/Edit%20item/menu.dart';
import 'package:admin/Edit%20item/sp%20offer.dart';
import 'package:flutter/material.dart';

class EditItem extends StatelessWidget {
  const EditItem({super.key});

  @override
  Widget build(BuildContext context) {
    final Height = MediaQuery.of(context).size.height;
    final Width = MediaQuery.of(context).size.width;
    List<Map<String, dynamic>> items = [
      {
        'title': 'Special Offer',
        'image': 'asset/icons/special-offer.png',
        'page': SpOffer()
      },
      {
        'title': 'Menu',
        'image': 'asset/icons/menu.png',
        'page': FriedChicken()

      },
      {
        'title': 'Breads',
        'image': 'asset/icons/Breads.png',
        'page': Breads()
      },
      {
        'title': 'Dip',
        'image': 'asset/icons/dip.png',
        'page': Dip()
      },
      {
        'title': 'Drinks',
        'image': 'asset/icons/drinks.png',
        'page': Drinks()
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
                                'Item Catagory',
                                style: TextStyle(
                                    fontSize: Height * 0.04,
                                    fontWeight: FontWeight.bold),
                              ),
                              Spacer(),
                              // InkWell(
                              //   onTap: (){},
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
                              //           size: Height*0.05,
                              //           color: Colors.white,
                              //         ),
                              //       )),
                              // ),
                              // SizedBox(
                              //   height: Height * 0.05,
                              //   width: Width * 0.07,
                              //   child: ElevatedButton(
                              //     onPressed: () {
                              //       // Add your button click logic here
                              //     },
                              //     style: ElevatedButton.styleFrom(
                              //       backgroundColor: Colors.blueAccent
                              //           .shade400, // Background color of the button
                              //       foregroundColor: Colors.white, // Text color
                              //       shape: RoundedRectangleBorder(
                              //         borderRadius: BorderRadius.circular(Height *
                              //             0.01), // Adjust the border radius as needed
                              //       ),
                              //     ),
                              //     child: Text(
                              //       'Update',
                              //       style: TextStyle(
                              //         fontSize: Height * 0.018,
                              //       ),
                              //     ),
                              //   ),
                              // ),
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
                              child: GridView.builder(
                                gridDelegate:
                                    SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 3,
                                  crossAxisSpacing: 60,
                                  mainAxisSpacing: 60,
                                  childAspectRatio: 8 / 5,
                                ),
                                itemCount: items.length,
                                itemBuilder: (context, index) {
                                  return GestureDetector(
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                items[index]['page'],
                                          ));
                                    },
                                    child:
                                        Container(
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            color: Colors.white,
                                            border: Border.all(),
                                            image: DecorationImage(
                                                image: AssetImage(
                                                  items[index]['image']
                                                ),

                                                fit: BoxFit.none),
                                          ),
                                          child:  Align(
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
                              ))
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
