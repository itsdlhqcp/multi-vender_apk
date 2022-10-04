import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:multivender_app/view/auth/customer_login_screen.dart';
import 'package:multivender_app/view/auth/customer_login_screen1.dart';
import 'package:multivender_app/view/auth/landing_customer_screen.dart';
import 'package:multivender_app/view/customer_home_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp().then((value) {});
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(statusBarColor: Colors.tealAccent));
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        // fontFamily: "Brand-IBMPlexSans"
      ),
      initialRoute: LandingCustomerScreeen.routeName,
      routes: {
        CustomerHomeScreen.routeName: (context) => CustomerHomeScreen(),
        LandingCustomerScreeen.routeName: (context) => LandingCustomerScreeen(),
      },
    );
  }
}
