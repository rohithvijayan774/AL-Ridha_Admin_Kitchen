import 'package:flutter/material.dart';

class MyShop extends StatefulWidget {
  @override
  _MyShopState createState() => _MyShopState();
}

class _MyShopState extends State<MyShop> {
  // Sample data, you can replace this with your actual data source
  List<Map<String, dynamic>> _data = [
    {'Number': '001', 'Name': 'Grilled Chicken', 'Image': Image.asset('asset/images/sp6.png'), 'Price': 119.0, 'Availability': '100'},
    {'Number': '002', 'Name': 'Shawaya', 'Image': Image.asset('asset/images/menu/sp2.png'), 'Price': 119.0, 'Availability': '120'},
    // ... add more rows as needed
  ];

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
            image: AssetImage('asset/images/background.png'),
            fit: BoxFit.cover,
          ),
        ),
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
                        border: Border.all(color: Colors.black), // Add border to the whole DataTable
                        color: Colors.white.withOpacity(0.25),
                      ),
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
                                'My Shop',
                                style: TextStyle(
                                  fontSize: Height * 0.04,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Spacer(),
                              InkWell(
                                onTap: () {},
                                child: SizedBox(
                                    height: Height * 0.07,
                                    width: Width * 0.06,
                                    child: Container(
                                      decoration: BoxDecoration(
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
                                    // Save the entered text in each row field
                                    for (int index = 0; index < _data.length; index++) {
                                      print('Row ${index + 1}: ${_data[index]}');
                                      // You can add your logic to save the data to your database or perform other actions.
                                    }
                                  },
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.blueAccent.shade400,
                                    foregroundColor: Colors.white,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(Height * 0.01),
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
                            margin: EdgeInsets.all(Width*0.01),
                            color: Colors.grey.shade200,
                            child: SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: SingleChildScrollView(
                                child: DataTable(
                                  decoration: BoxDecoration(
                                    border: Border.all(color: Colors.black),
                                    borderRadius: BorderRadius.circular(Width*0.01)
                                  ),
                                  columns: [
                                    DataColumn(
                                      label: Container(
                                        width: Width * 0.07,
                                        height: Height * 0.06,
                                        alignment: Alignment.center,
                                        child: Center(child: Text('Item No' ,style: TextStyle(fontSize: Height*0.025,fontWeight: FontWeight.bold),)),
                                      ),
                                    ),
                                    DataColumn(
                                      label: Container(
                                        width: Width * 0.09,
                                        height: Height * 0.06,
                                        alignment: Alignment.center,
                                        child: Center(child: Text('Item Name',style: TextStyle(fontSize: Height*0.025,fontWeight: FontWeight.bold),)),
                                      ),
                                    ),
                                    DataColumn(
                                      label: Container(
                                        width: Width * 0.07,
                                        height: Height * 0.06,
                                        alignment: Alignment.center,
                                        child: Center(child: Text('Image',style: TextStyle(fontSize: Height*0.025,fontWeight: FontWeight.bold),)),
                                      ),
                                    ),
                                    DataColumn(
                                      label: Container(
                                        width: Width * 0.07,
                                        height: Height * 0.06,
                                        alignment: Alignment.center,
                                        child:Center(child: Text('Price',style: TextStyle(fontSize: Height*0.025,fontWeight: FontWeight.bold),)),
                                      ),
                                    ),
                                    DataColumn(
                                      label: Container(
                                        width: Width * 0.08,
                                        height: Height * 0.06,
                                        alignment: Alignment.center,
                                        child: Center(child: Text('Availability',style: TextStyle(fontSize: Height*0.025,fontWeight: FontWeight.bold),)),
                                      ),
                                    ),
                                    DataColumn(
                                      label: Container(
                                        width: Width * 0.05,
                                        height: Height * 0.06,
                                        alignment: Alignment.center,
                                        child: Center(child: Text('')),
                                      ),
                                    ),
                                  ],
                                  rows: List<DataRow>.generate(
                                    _data.length,
                                        (index) => DataRow(
                                      cells: [
                                        DataCell(
                                          Container(
                                            width: Width * 0.1,
                                            height: Height * 0.06,
                                            alignment: Alignment.center,
                                            child: TextFormField(
                                              initialValue: _data[index]['Number'],
                                              onChanged: (value) {
                                                setState(() {
                                                  _data[index]['Number'] = value;
                                                });
                                              },
                                            ),
                                          ),
                                        ),
                                        DataCell(
                                          Container(
                                            width: Width * 0.1,
                                            height: Height * 0.06,
                                            alignment: Alignment.center,
                                            child: TextFormField(
                                              initialValue: _data[index]['Name'],
                                              onChanged: (value) {
                                                setState(() {
                                                  _data[index]['Name'] = value;
                                                });
                                              },
                                            ),
                                          ),
                                        ),
                                        DataCell(
                                          Container(
                                            width: Width * 0.1,
                                            height: Height * 0.06,
                                            alignment: Alignment.center,
                                            child: _data[index]['Image'],
                                          ),
                                        ),
                                        DataCell(
                                          Container(
                                            width: Width * 0.1,
                                            height: Height * 0.06,
                                            alignment: Alignment.center,
                                            child: TextFormField(
                                              initialValue: _data[index]['Price'].toString(),
                                              onChanged: (value) {
                                                setState(() {
                                                  try {
                                                    _data[index]['Price'] = double.parse(value);
                                                  } catch (e) {}
                                                });
                                              },
                                            ),
                                          ),
                                        ),
                                        DataCell(
                                          Container(
                                            width: Width * 0.1,
                                            height: Height * 0.06,
                                            alignment: Alignment.center,
                                            child: TextFormField(
                                              initialValue: _data[index]['Availability'],
                                              onChanged: (value) {
                                                setState(() {
                                                  _data[index]['Availability'] = value;
                                                });
                                              },
                                            ),
                                          ),
                                        ),
                                        DataCell(
                                          IconButton(
                                          onPressed: (){},
                                            icon:Icon(Icons.delete_outline_outlined),
                                            color:  Color(0xff911f2a),
                                            iconSize: Height*0.04,
                                          )
                                        )],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: Height * 0.01,
                    ),
                  ],
                ),
                SizedBox(
                  width: Width * 0.005,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
