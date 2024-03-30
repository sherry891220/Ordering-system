// Copyright 2019 The Flutter team. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:hw4/common/theme.dart';
import 'package:hw4/models/cart.dart';
import 'package:hw4/models/catalog.dart';
import 'package:hw4/screens/cart.dart';
import 'package:hw4/screens/catalog.dart';
import 'package:hw4/screens/login.dart';
import 'package:hw4/screens/catalog1.dart';
import 'package:hw4/screens/catalog2.dart';
import 'package:hw4/screens/catalog3.dart';
import 'package:hw4/screens/done.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Using MultiProvider is convenient when providing multiple objects.
    return MultiProvider(
      providers: [
        // In this sample app, CatalogModel never changes, so a simple Provider
        // is sufficient.
        Provider(create: (context) => CatalogModel()),
        // CartModel is implemented as a ChangeNotifier, which calls for the use
        // of ChangeNotifierProvider. Moreover, CartModel depends
        // on CatalogModel, so a ProxyProvider is needed.
        ChangeNotifierProxyProvider<CatalogModel, CartModel>(
          create: (context) => CartModel(),
          update: (context, catalog, cart) {
            if (cart == null) throw ArgumentError.notNull('cart');
            cart.catalog = catalog;
            return cart;
          },
        ),
      ],
      child: MaterialApp(
        title: 'Provider Demo',
        theme: appTheme,
        initialRoute: '/',
        routes: {
          '/': (context) => const MyLogin(),
          '/catalog': (context) => const MyCatalog(),
          '/catalog1': (context) => const MyCatalog1(),
          '/catalog2': (context) => const MyCatalog2(),
          '/catalog3': (context) => const MyCatalog3(),
          '/cart': (context) => const MyCart(),
          '/done': (context) => const MyDone(),
        },
      ),
    );
  }
}
