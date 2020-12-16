import 'dart:async';
import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:hive/hive.dart';


void main() async {
  await Hive.init("/db");
  var box = await Hive.openBox('testBox');
  box.put('name', 'David');

  print('Name: ${box.get('name')}');
  var uniqueKey = UniqueKey();
  print(uniqueKey.toString());
}
