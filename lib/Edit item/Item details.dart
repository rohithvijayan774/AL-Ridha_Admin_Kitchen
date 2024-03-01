import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ItemDetails extends StatefulWidget {
  final String title;
  final String discription;
  final String price;
  final String image;

  const ItemDetails({super.key,required this.title,required this.discription,required this.price,required this.image,});

  @override
  State<ItemDetails> createState() => _ItemDetailsState();
}

class _ItemDetailsState extends State<ItemDetails> {
  @override
  Widget build(BuildContext context) {
    final Height = MediaQuery.of(context).size.height;
    final Width = MediaQuery.of(context).size.width;

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
                      child: Column(children: [
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
                              widget.title,
                              style: TextStyle(
                                  fontSize: Height * 0.04,
                                  fontWeight: FontWeight.bold),
                            ),
                            Spacer(),
                            InkWell(
                              onTap: (){},
                              child: SizedBox(
                                  height: Height * 0.06,
                                  width: Width * 0.06,
                                  child: Container(
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Color(0xff911f2a),
                                    ),
                                    child: Icon(
                                      Icons.delete_outline_outlined,
                                      size: Height*0.05,
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
                        SizedBox(
                          height: Height * 0.02,
                        ),
                        Container(
                          margin: EdgeInsets.symmetric(
                            horizontal: Width * 0.01,
                          ),
                          height: Height*0.78,
                          width: Width * 0.8,
                          child: Container(
                            decoration: BoxDecoration(
                              border: Border.all(),
                              borderRadius: BorderRadius.circular(Width * 0.01),
                              // color: Colors.greenAccent
                            ),
                            child: Column(
                              children: [
                                SizedBox(
                                  height: Height * 0.02,
                                ),
                                Row(
                                  children: [
                                    SizedBox(
                                      width: Width * 0.015,
                                    ),
                                    Container(
                                      height: Height * 0.35,
                                      width: Width * 0.3,
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(
                                              Width * 0.01),
                                          image: DecorationImage(
                                            image: AssetImage(
                                                widget.image),
                                            fit: BoxFit.cover,
                                          )),
                                    ),
                                    SizedBox(width: Width*0.05,),
                                    Column(
                                      children: [
                                        Container(
                                          height:Height*0.08,
                                          width: Width*0.35,
                                          child: ElevatedButton(
                                              onPressed: () {
                                                // Add your button click logic here
                                              },
                                              style: ElevatedButton.styleFrom(
                                                padding: EdgeInsets.symmetric(vertical: 15, horizontal: 30),
                                                backgroundColor: Colors.grey.shade100,
                                                foregroundColor:  Color(0xff911f2a), // Button text color
                                                side: BorderSide(color: Colors.black, width: Width*0.001), // Border color
                                                shape: RoundedRectangleBorder(
                                                  borderRadius: BorderRadius.circular(Width*0.01), // Border radius for rounded corners
                                                ),

                                              ),
                                              child:
                                              Row(
                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                children: [
                                                  Text('Change Title',style: TextStyle(fontSize: Width*0.015),),
                                                  Image.asset('asset/icons/edit-text.png',width: Width*0.05,
                                                    height: Height*0.05,),
                                                ],
                                              )),
                                        ),
                                        SizedBox(height: Height*0.01,),
                                        Container(
                                          height:Height*0.08,
                                          width: Width*0.35,
                                          child: ElevatedButton(
                                              onPressed: () {
                                                // Add your button click logic here
                                              },
                                              style: ElevatedButton.styleFrom(
                                                padding: EdgeInsets.symmetric(vertical: 15, horizontal: 30),
                                                backgroundColor: Colors.grey.shade100,
                                                foregroundColor:  Color(0xff911f2a), // Button text color
                                                side: BorderSide(color: Colors.black, width: Width*0.001), // Border color
                                                shape: RoundedRectangleBorder(
                                                  borderRadius: BorderRadius.circular(Width*0.01), // Border radius for rounded corners
                                                ),

                                              ),
                                              child:
                                              Row(
                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                children: [
                                                  Text('Change Image',style: TextStyle(fontSize: Width*0.015),),
                                                  Image.asset('asset/icons/image-editing.png',width: Width*0.05,
                                                    height: Height*0.05,),
                                                ],
                                              )),
                                        ),
                                        SizedBox(height: Height*0.01,),
                                        Container(
                                          height:Height*0.08,
                                          width: Width*0.35,
                                          child: ElevatedButton(
                                              onPressed: () {
                                                // Add your button click logic here
                                              },
                                              style: ElevatedButton.styleFrom(
                                                padding: EdgeInsets.symmetric(vertical: 15, horizontal: 30),
                                                backgroundColor: Colors.grey.shade100,
                                                foregroundColor:  Color(0xff911f2a), // Button text color
                                                side: BorderSide(color: Colors.black, width: Width*0.001), // Border color
                                                shape: RoundedRectangleBorder(
                                                  borderRadius: BorderRadius.circular(Width*0.01), // Border radius for rounded corners
                                                ),

                                              ),
                                              child:
                                              Row(
                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                children: [
                                                  Text('Change Discription',style: TextStyle(fontSize: Width*0.015),),
                                                  Image.asset('asset/icons/edit-text.png',width: Width*0.05,
                                                    height: Height*0.05,),
                                                ],
                                              )),
                                        ),
                                        SizedBox(height: Height*0.01,),
                                        Container(
                                          height:Height*0.08,
                                          width: Width*0.35,
                                          child: ElevatedButton(
                                              onPressed: () {
                                                // Add your button click logic here
                                              },
                                              style: ElevatedButton.styleFrom(
                                                padding: EdgeInsets.symmetric(vertical: 15, horizontal: 30),
                                                backgroundColor: Colors.grey.shade100,
                                                foregroundColor:  Color(0xff911f2a), // Button text color
                                                side: BorderSide(color: Colors.black, width: Width*0.001), // Border color
                                                shape: RoundedRectangleBorder(
                                                  borderRadius: BorderRadius.circular(Width*0.01), // Border radius for rounded corners
                                                ),

                                              ),
                                              child:
                                              Row(
                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                children: [
                                                  Text('Change Price',style: TextStyle(fontSize: Width*0.015),),
                                                  Image.asset('asset/icons/rupee.png',width: Width*0.05,
                                                    height: Height*0.05,),
                                                ],
                                              )),
                                        ),

                                        SizedBox(height: Height*0.01,),
                                        //buttons
                                      ],
                                    )
                                  ],
                                ),
                                SizedBox(height: Height*0.02,),
                                Row(
                                  children: [
                                    SizedBox(width: Width*0.02,),
                                    Text(widget.discription,style: TextStyle(fontSize: Width*0.015),),
                                    SizedBox(width: Width*0.02,),
                                  ],
                                ),
                                Spacer(),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    SizedBox(width: Width*0.01,),
                                    //offer
                                    Container(
                                      height: Height*0.07,
                                      width: Width*0.15,
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(Width*0.01),
                                          color: Colors.white,
                                          border: Border.all(
                                              color: Color(0xff911f2a),
                                              width: Width*0.001
                                          )
                                      ),
                                      child: Row(
                                        children: [
                                          SizedBox(width: Width*0.01,),
                                          Text(widget.price,style: TextStyle(fontSize: Height*0.02,fontWeight: FontWeight.bold,color: Colors.black),),
                                          Spacer(),
                                          Image.asset('asset/icons/rupee.png',width: Width*0.05,
                                            height: Height*0.04,),
                                          SizedBox(width: Width*0.005,),
                                        ],
                                      ),
                                    ),
                                    SizedBox(width: Width*0.01,)
                                  ],
                                ),
                                SizedBox(height: Height*0.01,)
                              ],
                            ),
                          ),
                        ),

                      ]),
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
