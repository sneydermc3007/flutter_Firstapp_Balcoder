import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({ Key? key }) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  int _counter = 0;

  contar() {
    setState(() {
        _counter = _counter + 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text( "Home Page Balcoder",
          style: TextStyle (color: Colors.white, fontSize: 16), )) ,),
      body: Container(
        child: Text("El contador fue ppresionado: " + _counter.toString(), 
        style: TextStyle(color: Colors.black, fontSize: 24)),
        color: Colors.green, ),

      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add) ,
        onPressed: (){
        print("Pressed");
        contar();
      },),
    );
  }
}