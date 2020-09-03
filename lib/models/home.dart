import 'package:flutter/material.dart';

import 'item.dart';

class MyHomePage extends StatefulWidget {
  var items = new List<Item>();

  MyHomePage() {
    items = [];
    items.add(Item(title: "Item 01", done: false));
    items.add(Item(title: "Item 02", done: true));
    items.add(Item(title: "Item 03", done: false));
    items.add(Item(title: "Item 04", done: false));
    items.add(Item(title: "Item 05", done: false));
    items.add(Item(title: "Item 06", done: false));
    items.add(Item(title: "Item 07", done: false));
  }

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("To do LIST"),
      ),
      body: ListView.builder(
        itemCount: widget.items.length,
        itemBuilder: (context, index) {
          return Text(widget.items[index].title);
        },
      ),
    );
  }
}
