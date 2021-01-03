import 'package:hive/hive.dart';
import 'package:uuid/uuid.dart';

part 'ShoppingList.g.dart';


@HiveType(typeId : 1, adapterName: "ShoppingListAdapter")
class ShoppingList {

  @HiveField(0)
  String id;

  @HiveField(1)
  String title;

  @HiveField(2)
  DateTime createdAt;

  @HiveField(3)
  DateTime updatedAt;

  ShoppingList(String title) {
    var uuid = Uuid();
    this.id = uuid.v1();
    this.title = title;
  }

  ShoppingList.populate(String uuid, String title) {
    this.id = uuid;
    this.title = title;
  }
}
