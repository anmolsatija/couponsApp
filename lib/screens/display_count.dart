import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Screen2 extends StatefulWidget {
  // const Screen2({Key? key}) : super(key: key);

  static const routeName = '/screen2';

  @override
  State<Screen2> createState() => _Screen2State();
}

class _Screen2State extends State<Screen2> {
  int a = 5;
  var url = Uri.parse(
      'https://coupons-b6b60-default-rtdb.firebaseio.com/coupons.json');
  @override
  void initState() {
    _fetchProducts();
    super.initState();
  }

  Future<void> _fetchProducts() async {
    try {
      final response = await http.get(url);
      final extractedData = json.decode(response.body) as Map<String, dynamic>;
      extractedData.forEach((coupon, count) {
        setState(() {
          a = count['couponCount'];
        });

        print(a);
      });
    } catch (error) {
      print(error);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Text('Coupon Count=' + a.toString()),
    ));
  }
}
