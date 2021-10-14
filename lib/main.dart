import 'package:coupon/screens/display_count.dart';
import 'package:coupon/screens/homesceen.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {Screen2.routeName: (context) => Screen2()},
      title: 'Coupon Application',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primaryColor: Colors.orange, accentColor: Colors.amber),
      home: HomeScreen(),
    );
  }
}
