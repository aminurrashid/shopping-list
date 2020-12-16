import 'package:hive/hive.dart';

import 'ShoppingItem.dart';


@HiveType(typeId : 1)
class ShoppingList {

  @HiveField(0)
  String id;

  @HiveField(1)
  String title;

  @HiveField(2)
  DateTime createdAt;

  @HiveField(3)
  DateTime updatedAt;
}
