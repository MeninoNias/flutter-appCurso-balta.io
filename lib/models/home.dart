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
    items.add(Item(title: "Item 03", done: false));
    items.add(Item(title: "Item 04", done: false));
    items.add(Item(title: "Item 05", done: false));
    items.add(Item(title: "Item 06", done: false));
    items.add(Item(title: "Item 07", done: false));
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
  var newTaskCtrl = TextEditingController();

  FocusNode myFocusNode;

  void add() {
    setState(() {
      if (newTaskCtrl.text.isEmpty) {
        return;
      }
      widget.items.add(Item(title: newTaskCtrl.text, done: false));
      newTaskCtrl.text = "";
    });
  }

  void remove(int index) {
    setState(() {
      widget.items.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: TextFormField(
          controller: newTaskCtrl,
          keyboardType: TextInputType.text,
          style: TextStyle(color: Colors.white, fontSize: 18),
          decoration: InputDecoration(
              labelText: "Nova Tarefa",
              labelStyle: TextStyle(color: Colors.white)),
        ),
      ),
      body: ListView.builder(
        itemCount: widget.items.length,
        itemBuilder: (context, index) {
          final item = widget.items[index];
          return Dismissible(
            direction: DismissDirection.endToStart,
            child: CheckboxListTile(
              title: Text(item.title),
              value: item.done,
              onChanged: (value) {
                setState(() {
                  item.done = value;
                });
              },
            ),
            background: Container(
              padding: EdgeInsets.only(right: 20.0),
              child: new Align(
                alignment: Alignment.centerRight,
                child: Text('Delete',
                    textAlign: TextAlign.right,
                    style: new TextStyle(color: Colors.white, fontSize: 18)),
              ),
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.topRight,
                      end: Alignment.bottomLeft,
                      colors: [Colors.green, Colors.red])),
            ),
            onDismissed: (direction) {
              remove(index);
            },
            key: Key(item.title),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          add();
        },
        child: Icon(Icons.add),
        backgroundColor: Colors.pink,
      ),
    );
  }
}
