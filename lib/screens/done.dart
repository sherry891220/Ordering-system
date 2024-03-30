import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:hw4/models/cart.dart';
import 'package:hw4/screens/catalog.dart';
import 'package:hw4/screens/catalog1.dart';
import 'package:hw4/screens/catalog2.dart';
import 'package:hw4/screens/catalog3.dart';

class MyDone extends StatelessWidget{
  const MyDone({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Flexible(
            flex: 5,
            child: Center(
              child: Icon(Icons.check_circle, size: 250, color: Colors.green),
            )
          ),
          Flexible(
            flex: 1,
            child: Text("已完成訂單！",
              style: TextStyle(
                fontSize: 30,
              ),
            ),
          ),
          Expanded(
            flex: 3,
            child: IconButton(
              icon: Icon(Icons.home, color: Colors.black45),
              iconSize: 50,
              //onPressed: () => {Navigator.pushNamed(context, '/')},
              onPressed: () {
                var cart = context.read<CartModel>();
                cart.reset();
                numberList = [0, 0, 0, 0, 0, 0];
                numberList1 = [0, 0, 0, 0, 0];
                numberList2 = [0, 0, 0, 0, 0];
                numberList3 = [0, 0, 0, 0, 0];
                Navigator.pushNamedAndRemoveUntil(context, '/', (route) => false);},
            ),
          ),
        ],
      ),
    );
    //throw UnimplementedError();
  }

}