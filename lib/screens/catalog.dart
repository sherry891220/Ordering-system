// Copyright 2019 The Flutter team. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:hw4/models/cart.dart';
import 'package:hw4/models/catalog.dart';
import 'package:hw4/flutter_tts.dart';

List<int> numberList = [0, 0, 0, 0, 0, 0];

class MyCatalog extends StatelessWidget {
  const MyCatalog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
          children: <Widget>[
            Flexible(
              flex: 10,
              child: Container(
                child:CustomScrollView(
                  slivers: [
                    _MyAppBar(),
                    const SliverToBoxAdapter(child: SizedBox(height: 12)),
                    SliverList(
                      delegate: SliverChildBuilderDelegate(
                          (context, index) => _MyListItem(index),
                          childCount: 6),
                    ),
                  ]
                ),
              ),
            ),
            Flexible(
              flex: 1,
              child: Container(
                alignment: Alignment.center,
                child: Row(
                  children: [
                    Flexible(
                      flex: 1,
                      child: MaterialButton(
                        color: Colors.white54,
                        child: Text("返回"),
                        onPressed: () => Navigator.pushNamed(context, '/'),
                        minWidth: double.infinity,
                        height: double.infinity,
                      ),
                    ),
                    Flexible(
                      flex: 1,
                      child: MaterialButton(
                        color: Colors.lightGreen,
                        child: Text("送出訂單"),
                        onPressed: () => Navigator.pushNamed(context, '/cart'),
                        minWidth: double.infinity,
                        height: double.infinity,
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
      ),
    );
  }
}

class _AddButton extends StatelessWidget {
  final Item item;

  const _AddButton({required this.item, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // The context.select() method will let you listen to changes to
    // a *part* of a model. You define a function that "selects" (i.e. returns)
    // the part you're interested in, and the provider package will not rebuild
    // this widget unless that particular part of the model changes.
    //
    // This can lead to significant performance improvements.
    var isInCart = context.select<CartModel, bool>(
      // Here, we are only interested whether [item] is inside the cart.
      (cart) => cart.items.contains(item),
    );

    return TextButton(
      onPressed: isInCart
          ? null
          : () async {
              // If the item is not in cart, we let the user add it.
              // We are using context.read() here because the callback
              // is executed whenever the user taps the button. In other
              // words, it is executed outside the build method.
              var cart = context.read<CartModel>();
              cart.add(item);
              print("add:");
              print(item.id);
              String strings = item.name;
              if (strings.isEmpty) return;
              print(strings);
              await Text2SpeechFlutter().speak(strings);
            },
      style: ButtonStyle(
        overlayColor: MaterialStateProperty.resolveWith<Color?>((states) {
          if (states.contains(MaterialState.pressed)) {
            return Theme.of(context).primaryColor;
          }
          return null; // Defer to the widget's default.
        }),
      ),
      child: isInCart
          ? const Icon(Icons.add_circle, color: Colors.grey)
          : const Icon(Icons.add_circle, color: Colors.green),
    );
  }
}

class _MyAppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      backgroundColor: Colors.lightGreen,
      title: Text('易消化美食', style: TextStyle(color: Colors.black)),
      floating: true,
    );
  }
}
//Theme.of(context).textTheme.headline1

class _MyListItem extends StatefulWidget {
  final int index;
  _MyListItem(this.index, {Key? key}) : super(key: key);

  @override
  State<_MyListItem> createState() => _MyListItemState();
}

class _MyListItemState extends State<_MyListItem> {
  void _increment(Item item){
    setState((){
      numberList[item.id] += 1;
      print(numberList[item.id]);
    });
  }
  void _decrement(Item item){
    setState((){
      numberList[item.id] -= 1;
      print(numberList[item.id]);
    });
  }

  @override
  Widget build(BuildContext context) {
    var item = context.select<CatalogModel, Item>(
      // Here, we are only interested in the item at [index]. We don't care
      // about any other change.
      (catalog) => catalog.getByPosition(widget.index),
    );
    var textTheme = Theme.of(context).textTheme.headline6;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: LimitedBox(
        maxHeight: 170,
        child: Row(
          children: [
            Flexible(
              child: Image.asset(item.image),
            ),
            const SizedBox(width: 15),
            Flexible(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      child: Row(
                        children: [
                          Flexible(
                            flex: 5,
                            child: Text(item.name, style: textTheme),
                          ),
                          Flexible(
                            flex: 1,
                            child: IconButton(
                              icon: Icon(Icons.volume_up),
                              iconSize: 20,
                              onPressed: () async {
                                String strings = item.name;
                                if (strings.isEmpty) return;
                                print(strings);
                                await Text2SpeechFlutter().speak(strings);
                              },
                            )
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      child: Text('\$'+item.price.toString(), style: textTheme),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8),
                        child: Row(
                          children: [
                            Flexible(
                              child: IconButton(
                                icon: Icon(Icons.remove),
                                onPressed: () {
                                  if(numberList[item.id] > 0) {
                                    var cart = context.read<CartModel>();
                                    cart.remove(item);
                                    _decrement(item);
                                  }
                                },
                              ),
                            ),
                            Flexible(
                              child: Text(numberList[item.id].toString()),
                            ),
                            Flexible(
                              child: IconButton(
                                icon: Icon(Icons.add),
                                onPressed: () {
                                  var cart = context.read<CartModel>();
                                  cart.add(item);
                                  _increment(item);
                                },
                              ),
                            )
                          ],
                        )
                    )
                  ],
                )
            ),
          ],
        ),
      ),

    );
  }
}
