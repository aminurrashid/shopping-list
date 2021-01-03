import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart' as path_provider;
import 'package:shopping_list/list/ShoppingListService.dart';

import 'db.dart';
import 'list/ShoppingItem.dart';
import 'list/ShoppingList.dart';


Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final directory = await path_provider.getApplicationDocumentsDirectory();
  await Db.initiateDB(directory.path);
  runApp(MyApp(
    items: List<ListItem>.generate(
      10,
      (i) => MessageItem("Item $i", "Item details for item: $i"),
    ),
  ));
}

class MyApp extends StatelessWidget {
  ShoppingListService service = new ShoppingListServiceImpl();
  final List<ListItem> items;

  MyApp({Key key, @required this.items}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final title = 'Shopping List';
//    ShoppingList list = service.addList(new ShoppingList("Monthly grocery shopping"));
//    ShoppingItem listItem = new ShoppingItem("daal", "1 kg", 230, list.id);
//    ShoppingItem listItem2 = new ShoppingItem("Aata", "1 kg", 50, list.id);
//    service.addItem(listItem);
//    service.addItem(listItem2);
//    List<ShoppingList> lists = service.getAll();
//    List<ShoppingItem> shoppingItems = service.getShoppingItems(list.id);
//    print(lists.length);
//    print(shoppingItems.length);

    return MaterialApp(
      title: title,
      home: Scaffold(
        appBar: AppBar(
          title: Text(title),
        ),
        body: ListView.builder(
          // Let the ListView know how many items it needs to build.
          itemCount: items.length,
          // Provide a builder function. This is where the magic happens.
          // Convert each item into a widget based on the type of item it is.
          itemBuilder: (context, index) {
            final item = items[index];

            return GestureDetector(
              child: ListTile(
                title: item.buildTitle(context),
                subtitle: item.buildSubtitle(context),
              ),
              onTap: () => Scaffold.of(context)
                  .showSnackBar(SnackBar(content: Text(index.toString()))),
            );
          },
        ),
        floatingActionButton: Builder(
          builder: (context) => FloatingActionButton(
            onPressed: () {
              final snackBar = SnackBar(content: Text('Add New Item!'));
              Scaffold.of(context).showSnackBar(snackBar);
            },
            tooltip: 'Add',
            child: Icon(Icons.add),
          ),
        ),
        // floatingActionButton: FloatingActionButton(
        //   onPressed: () {
        //     final snackBar = SnackBar(content: Text('Add New Item!'));
        //     Scaffold.of(context).showSnackBar(snackBar);
        //   },
        //   tooltip: 'Add',
        //   child: Icon(Icons.add),
        // ),
      ),
    );
  }
}

/// The base class for the different types of items the list can contain.
abstract class ListItem {
  /// The title line to show in a list item.
  Widget buildTitle(BuildContext context);

  /// The subtitle line, if any, to show in a list item.
  Widget buildSubtitle(BuildContext context);
}

/// A ListItem that contains data to display a message.
class MessageItem implements ListItem {
  final String title;
  final String desc;

  MessageItem(this.title, this.desc);

  Widget buildTitle(BuildContext context) => Text(title);

  Widget buildSubtitle(BuildContext context) => Text(desc);
}
