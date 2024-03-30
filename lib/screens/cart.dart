// Copyright 2019 The Flutter team. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:hw4/models/cart.dart';

class MyCart extends StatelessWidget {
  const MyCart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('訂單確認', style: TextStyle(color: Colors.black)),
        backgroundColor: Colors.white,
      ),
      body: Container(
        color: Colors.lightGreen,
        child: Column(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(32),
                child: _CartList(),
              ),
            ),
            const Divider(height: 4, color: Colors.black),
            _CartTotal()
          ],
        ),
      ),
    );
  }
}

class _CartList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var itemNameStyle = Theme.of(context).textTheme.headline6;
    // This gets the current state of CartModel and also tells Flutter
    // to rebuild this widget when CartModel notifies listeners (in other words,
    // when it changes).
    var cart = context.watch<CartModel>();

    return ListView.builder(
      itemCount: cart.name.length,
      itemBuilder: (context, index) => ListTile(
        leading: const Icon(Icons.done),
        /*
        trailing: IconButton(
          icon: const Icon(Icons.remove_circle_outline),
          onPressed: () {
            cart.remove(cart.items[index]);
            print("remove:");
            print(index);
            //cart.remove1(cart.items1[index]);
          },
        ),
        */
        trailing: Text(
          '\$'+cart.price[index].toString(),
          style: itemNameStyle,
        ),
        title: Text(
          cart.name[index],
          style: itemNameStyle,
        ),
      ),
    );
  }
}

class _CartTotal extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var hugeStyle =
        Theme.of(context).textTheme.headline1!.copyWith(fontSize: 45);

    return SizedBox(
      height: 160,
      child: Column(
        children: [
          const SizedBox(height: 15),
          Flexible(
            flex: 2,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Flexible(
                  flex: 2,
                  child: Icon(Icons.place),
                ),
                Flexible(
                  flex: 2,
                  child: Text("地址: ", style: TextStyle(fontSize: 30),),
                ),
                Flexible(
                  flex: 5,
                  child: TextField(
                    decoration: InputDecoration(
                      fillColor: Colors.white,
                      filled: true,
                      enabledBorder: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        borderSide: BorderSide(
                          color: Colors.black87,
                          width: 2,
                        )
                      )
                    ),
                  ),
                ),
              ]
            )
          ),
          const SizedBox(height: 5),
          Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // Another way to listen to a model's change is to include
                // the Consumer widget. This widget will automatically listen
                // to CartModel and rerun its builder on every change.
                //
                // The important thing is that it will not rebuild
                // the rest of the widgets in this build method.
                Consumer<CartModel>(
                    builder: (context, cart, child) =>
                        Text('總金額: \$${sum}', style: hugeStyle)),
                const SizedBox(width: 24),
                OutlinedButton(
                  /*
                  onPressed: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Buying not supported yet.')));
                  },
                  */
                  onPressed: () => Navigator.pushNamed(context, '/done'),
                  style: OutlinedButton.styleFrom(
                    primary: Colors.white,
                    textStyle: TextStyle(
                      fontSize: 35,
                    ),
                    side: BorderSide(color: Colors.white70, width: 3),
                    shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(10))),
                  ),
                  child: const Text('下單'),
                ),
              ],
            ),
          ),
        ]
      )
    );
  }
}
