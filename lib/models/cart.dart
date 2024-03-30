// Copyright 2019 The Flutter team. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:hw4/models/catalog.dart';

int sum = 0;

class CartModel extends ChangeNotifier {
  /// The private field backing [catalog].
  late CatalogModel _catalog = CatalogModel();

  /// Internal, private state of the cart. Stores the ids of each item.
  final List<int> _itemIds = [];
  List<String> _itemName = [];//
  List<int> _itemPrice = [];

  /// The current catalog. Used to construct items from numeric ids.
  CatalogModel get catalog => _catalog;
  List<String> get name => _itemName;
  List<int> get price => _itemPrice;

  set catalog(CatalogModel newCatalog) {
    _catalog = newCatalog;
    // Notify listeners, in case the new catalog provides information
    // different from the previous one. For example, availability of an item
    // might have changed.
    notifyListeners();
  }

  /// List of items in the cart.
  List<Item> get items => _itemIds.map((id) => _catalog.getById(id)).toList();

  /// The current total price of all items.
  int get totalPrice =>
      items.fold(0, (total, current) => total + current.price);

  /// Adds [item] to cart. This is the only way to modify the cart from outside.
  void add(Item item) {
    _itemIds.add(item.id);
    _itemName.add(item.name);
    _itemPrice.add(item.price);
    // This line tells [Model] that it should rebuild the widgets that
    // depend on it.
    print(_itemName);
    print(_itemIds);
    print(_itemPrice);
    item.number += 1;
    sum += item.price;
    notifyListeners();
  }

  void remove(Item item) {
    //_itemIds.remove(item.id);
    _itemName.remove(item.name);
    _itemPrice.remove(item.price);
    sum -= item.price;
    // Don't forget to tell dependent widgets to rebuild _every time_
    // you change the model.
    notifyListeners();
  }

  void reset(){
    _itemName = [];
    _itemPrice = [];
    sum = 0;
  }
}
