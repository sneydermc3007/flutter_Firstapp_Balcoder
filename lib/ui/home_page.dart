import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _counter = 0;

  increseCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text("Home Page Balcoder")),
      ),
      body: Container(
        child: Center(
            child: Text("El contador fue presionado: " + _counter.toString())),
        color: Colors.blue.shade50,
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add_box),
        onPressed: () {
          print("Pressed");
          increseCounter();
        },
      ),
    );
  }
}