import 'package:hive/hive.dart';


@HiveType(typeId : 2)
class ShoppingItem {
  @HiveField(0)
  String id;

  @HiveField(0)
  String name;

  @HiveField(1)
  String quantity;

  @HiveField(2)
  bool isChecked;

  @HiveField(3)
  double price;

  @HiveField(4)
  int shoppingListId;
}
