import 'package:flutter/material.dart';
import 'package:line_animation/line_animation.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Line animation'),
        leading: new Icon(Icons.insert_emoticon),
      ),
      backgroundColor: Colors.white,
      body: Center(
          child: Container(
              padding: const EdgeInsets.all(10),
              //color: Colors.black.withOpacity(0.2),
              height: 300,
              width: 300,
              child: Line())),
    );
  }
}
