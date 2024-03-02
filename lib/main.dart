import 'package:admin/Dashboard/EditItem.dart';
import 'package:admin/Dashboard/OnGoingOrders.dart';
import 'package:admin/Dashboard/home.dart';
import 'package:admin/Edit%20item/Sp%20Item%20details.dart';
import 'package:admin/Edit%20item/sp%20offer.dart';
import 'package:admin/auth/signin.dart';
import 'package:admin/controller/admin_controller.dart';
import 'package:admin/controller/kitchen_controller.dart';
import 'package:admin/firebase_options.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<AdminController>(
          create: (context) => AdminController(),
        ),
        ChangeNotifierProvider<KitchenController>(
          create: (context) => KitchenController(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          fontFamily: 'poppins',
        ),
        home: StreamBuilder(
            stream: FirebaseAuth.instance.authStateChanges(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                if (FirebaseAuth.instance.currentUser!.uid ==
                    'YEVbJHbAYMSI0D6m52Kc1u5Xagl1') {
                  return const Home();
                } else {
                  return const SignIn();
                }
              } else {
                return const SignIn();
              }
            }),
      ),
    );
  }
}
