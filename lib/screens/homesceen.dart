import 'dart:convert';
import 'package:coupon/screens/display_count.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  void _submit(a, b) async {
    var url = Uri.parse(
        'https://coupons-b6b60-default-rtdb.firebaseio.com/coupons.json');
    await http.post(url, body: json.encode({'couponCount': numberOfCoupons}));
    Navigator.popAndPushNamed(context, Screen2.routeName);
  }

  int percnetageDiscount = 0;
  int numberOfCoupons = 0;
  final discountController = TextEditingController();
  final numberOfCouponsController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Hello'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Center(
            child: Container(
              height: 100,
              width: 300,
              child: const Image(
                image: AssetImage('assets/logo.png'),
              ),
            ),
          ),
          Container(
              height: 200,
              width: 300,
              child: Column(
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      Container(
                        child: Text('Enter a Discount %'),
                        width: 100,
                      ),
                      Container(
                        child: Text('Enter Number of Coupons'),
                        width: 100,
                      )
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      Expanded(
                        //Discount Percentage Input
                        child: TextField(
                          expands: false,
                          keyboardType: TextInputType.number,
                          onChanged: (a) => percnetageDiscount = int.parse(a),
                          inputFormatters: [
                            FilteringTextInputFormatter.digitsOnly
                          ],
                          decoration: const InputDecoration(
                              contentPadding: EdgeInsets.all(22),
                              border: InputBorder.none,
                              hintMaxLines: 2,
                              hintText: 'Enter discount %',
                              hintStyle: TextStyle(fontSize: 12)),
                        ),
                      ),
                      Expanded(
                        //Number of coupons Input
                        child: TextField(
                          // controller: numberOfCouponsController,
                          expands: false,
                          keyboardType: TextInputType.number,
                          inputFormatters: [
                            FilteringTextInputFormatter.digitsOnly
                          ],

                          onChanged: (b) => numberOfCoupons = int.parse(b),
                          decoration: const InputDecoration(
                              contentPadding: EdgeInsets.all(30),
                              border: InputBorder.none,
                              hintText: 'Number of Coupons',
                              hintMaxLines: 2,
                              hintStyle: TextStyle(fontSize: 12)),
                        ),
                      ),
                    ],
                  )
                ],
              )),
          Center(
              child: ElevatedButton(
                  onPressed: () => _submit(percnetageDiscount, numberOfCoupons),
                  child: Text('Submit')))
        ],
      ),
    );
  }
}
