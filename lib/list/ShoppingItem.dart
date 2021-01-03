import 'package:hive/hive.dart';
import 'package:uuid/uuid.dart';

part 'ShoppingItem.g.dart';


@HiveType(typeId : 2, adapterName: "ShoppingItemAdapter")
class ShoppingItem {
  @HiveField(0)
  String id;

  @HiveField(1)
  String name;

  @HiveField(2)
  String quantity;

  @HiveField(3)
  bool isChecked;

  @HiveField(4)
  double price;

  @HiveField(5)
  String shoppingListId;

  ShoppingItem(String name, String quantity, double price, String shoppingListId) {
    var uuid = Uuid();
    this.id = uuid.v1();
    this.name = name;
    this.quantity = quantity;
    this.price = price;
    this.shoppingListId = shoppingListId;
  }
  ShoppingItem.populate(String id, String name, String quantity, double price, String shoppingListId) {
    this.id = id;
    this.name = name;
    this.quantity = quantity;
    this.price = price;
    this.shoppingListId = shoppingListId;
  }
}
