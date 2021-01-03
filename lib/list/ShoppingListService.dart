import 'package:shopping_list/list/ShoppingItem.dart';

import '../db.dart';
import 'ShoppingList.dart';

class ShoppingListService {
  ShoppingList getShoppigList(String id){}
  List<ShoppingList> getAll(){}
  List<ShoppingItem> getShoppingItems(String listId){}
  ShoppingItem getShoppingItem(String itemId){}
  ShoppingList addList(ShoppingList list){}
  ShoppingItem addItem(ShoppingItem item){}
}

class ShoppingListServiceImpl implements ShoppingListService{
  @override
  ShoppingList getShoppigList(String id) {
    return (new Db()).getShoppigList(id);
  }

  @override
  ShoppingItem getShoppingItem(String itemId) {
    return (new Db()).getShoppingItem(itemId);
  }

  @override
  List<ShoppingItem> getShoppingItems(String listId) {
    return (new Db()).getShoppingItems(listId);
  }

  @override
  List<ShoppingList> getAll() {
    return (new Db()).getAll();
  }

  @override
  ShoppingItem addItem(ShoppingItem item) {
    return (new Db()).addItem(item);
  }

  @override
  ShoppingList addList(ShoppingList list) {
    return (new Db()).addList(list);
  }

}