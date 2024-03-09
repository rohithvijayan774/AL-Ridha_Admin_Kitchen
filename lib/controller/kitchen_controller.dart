import 'package:admin/models/order_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';

class KitchenController extends ChangeNotifier {
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
  FirebaseStorage firebaseStorage = FirebaseStorage.instance;

  List<OrderModel> ordersList = [];
  OrderModel? orders;

  Future fetchOrders(String status) async {
    try {
      ordersList.clear();
      final orderRef = firebaseFirestore
          .collection('orders')
          .where('status', isEqualTo: status);
      final orderSnapshot = await orderRef.get();

      for (var doc in orderSnapshot.docs) {
        String orderid = doc['orderid'];
        String userid = doc['userid'];
        int orderPrice = doc['orderPrice'];
        String userName = doc['userName'];
        String userAddress = doc['userAddress'];
        String status = doc['status'];
        int userNumber = doc['userNumber'];
        List orderedItems = doc['orderedItems'];

        orders = OrderModel(
            orderid: orderid,
            userid: userid,
            orderPrice: orderPrice,
            userName: userName,
            userAddress: userAddress,
            userNumber: userNumber,
            orderedItems: orderedItems,
            status: status);

        print(orders);

        ordersList.add(orders!);
      }
    } catch (e) {
      print(e);
    }
  }

  Future updateStatus(String docid) async {
    try {
      await firebaseFirestore
          .collection('orders')
          .doc(docid)
          .update({"status": 'coocked'});
      notifyListeners();
      print('Status Updated');
    } catch (e) {
      print(e);
    }
  }
}
