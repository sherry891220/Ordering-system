// Copyright 2019 The Flutter team. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/material.dart';

/// A proxy of the catalog of items the user can buy.
///
/// In a real app, this might be backed by a backend and cached on device.
/// In this sample app, the catalog is procedurally generated and infinite.
///
/// For simplicity, the catalog is expected to be immutable (no products are
/// expected to be added, removed or changed during the execution of the app).
///
///

//----------------------------------------------------
class CatalogModel {
  static List<String> itemNames = [
    '香蕉藍莓優格',
    '水果醋',
    '味噌湯',
    '鮮菇雞胸餐',
    '全麥麵包',
    '蒸蛋',
    '雞包仔',
    '生菜絲吞拿魚三明治',
    '番薯糖水',
    '豆腐花',
    '皮蛋瘦肉粥',
    '冬瓜蝦米粉絲',
    '秋葵魩仔魚五穀粥',
    '蘋果馬鈴薯燉肉',
    '豆腐鮮菇櫛瓜麵',
    '雙菇絲瓜',
    '擔仔麵',
    '咖哩豬排飯',
    '鍋燒意麵',
    '親子丼',
    '蝦仁炒飯',
  ];
  static List<String> itemImages = [
    'assets/images/digest1.jpg',
    'assets/images/digest2.jpg',
    'assets/images/digest3.jpg',
    'assets/images/digest4.jpg',
    'assets/images/digest5.jpg',
    'assets/images/digest6.jpg',
    'assets/images/chew1.jpg',
    'assets/images/chew2.jpg',
    'assets/images/chew3.jpg',
    'assets/images/chew4.jpg',
    'assets/images/chew5.jpg',
    'assets/images/fiber1.jpg',
    'assets/images/fiber2.jpg',
    'assets/images/fiber3.jpg',
    'assets/images/fiber4.jpg',
    'assets/images/fiber5.jpg',
    'assets/images/normal1.jpg',
    'assets/images/normal2.jpg',
    'assets/images/normal3.jpg',
    'assets/images/normal4.jpg',
    'assets/images/normal5.jpg',
  ];
  static List<int> itemPrices = [
    80,
    50,
    45,
    90,
    70,
    40,
    40,
    60,
    15,
    35,
    65,
    75,
    80,
    90,
    70,
    70,
    50,
    120,
    70,
    100,
    85,
  ];
  static List<int> itemNumbers = [
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
  ];

  /// Get item by [id].
  ///
  /// In this sample, the catalog is infinite, looping over [itemNames].
  Item getById(int id) => Item(
      id,
      itemNames[id % itemNames.length],
      itemPrices[id % itemPrices.length],
      itemImages[id % itemImages.length],
      itemNumbers[id % itemNames.length]);

  /// Get item by its position in the catalog.
  Item getByPosition(int position) {
    // In this simplified case, an item's position in the catalog
    // is also its id.
    return getById(position);
  }
}

@immutable
class Item {
  final int id;
  final String name;
  final Color color;
  final int price;
  final String image;
  int number;

  Item(this.id, this.name, this.price, this.image, this.number)
  // To make the sample app look nicer, each item is given one of the
  // Material Design primary colors.
      : color = Colors.primaries[id % Colors.primaries.length];

  @override
  int get hashCode => id;

  @override
  bool operator ==(Object other) => other is Item && other.id == id;
}
//--------------------------------------------------------------------------



