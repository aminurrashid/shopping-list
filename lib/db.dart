import 'dart:async';
import 'package:hive/hive.dart';
import 'package:shopping_list/list/ShoppingList.dart';

import 'list/ShoppingItem.dart';

class Db {
  static var shoppingListBox;
  static var itemsBox;
  static Future<void> initiateDB(String directory) async {
    await Hive.init(directory);
    shoppingListBox = await Hive.openBox("shoppingLists");
    itemsBox = await Hive.openBox("shoppingItems");
    Hive.registerAdapter(ShoppingItemAdapter());
    Hive.registerAdapter(ShoppingListAdapter());
  }

  List<ShoppingList> getAll() {
    List<ShoppingList> lists = [];
    for (int i=0; i<shoppingListBox.length; i++) {
      var list = shoppingListBox.getAt(i);
      lists.add(list);
    }
    return lists;
  }

  ShoppingList getShoppigList(String id) {
     return shoppingListBox.get(id);
  }

  ShoppingItem getShoppingItem(String itemId) {
    return itemsBox.get(itemId);
  }

  List<ShoppingItem> getShoppingItems(String listId) {
    List<ShoppingItem> items = [];
    itemsBox.values.where((item) => item.shoppingListId == listId)
      .forEach((item) => items.add(item));
    return items;
  }

  ShoppingItem addItem(ShoppingItem item) {
    itemsBox.put(item.id, item);
    return item;
  }

  ShoppingList addList(ShoppingList list) {
    shoppingListBox.put(list.id, list);
    return list;
  }
}

//void main() async {
//
//  Db.initiateDB();
//  addItem();
//
//  var shoppingItem1 = new ShoppingItem("daal", "1 kg", 230, shoppingList.id);
//
//  itemsBox.put(shoppingItem1.id, shoppingItem1);
//
//  var retrievedItem = itemsBox.get(shoppingItem1.id);
//  print(retrievedItem.name);
//  print(shoppingItem1.id);
//}
