import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: SecondView(),
      ),
    );
  }
}

class FirstView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: SingleChildScrollView(
        child: Column(
          children: List.generate(
              8,
              (index) => Container(
                    height: 100,
                    width: double.infinity,
                    margin: EdgeInsets.all(20),
                    color: Colors.blue,
                  )),
        ),
      ),
    );
  }
}

class SecondView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Column(
          children: List.generate(
        10,
        (index) => SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Container(
            child: Row(
              children: List.generate(
                  20,
                  (index) => Container(
                        height: 100,
                        margin: EdgeInsets.all(20),
                        width: 100,
                        color: Colors.red,
                      )),
            ),
          ),
        ),
      )),
    );
  }
}
