import 'package:flutter/material.dart';

void main() {
  runApp(MyApp(
    items: List<ListItem>.generate(
      10,
      (i) => MessageItem("Item $i", "Item details for item: $i"),
    ),
  ));
}

class MyApp extends StatelessWidget {
  final List<ListItem> items;

  MyApp({Key key, @required this.items}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final title = 'Shopping List';

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
