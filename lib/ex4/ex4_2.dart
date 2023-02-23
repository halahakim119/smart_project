import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.white,
            title: const Text(
              'Explore',
              style: TextStyle(color: Colors.black),
            ),
            actions: const [
              Icon(
                Icons.add,
                color: Colors.blue,
              ),
              SizedBox(
                width: 10,
              ),
            ],
          ),
          body: BodyContainer()),
    );
  }
}

class BodyContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: MediaQuery.of(context).size.height * 0.4,
        width: MediaQuery.of(context).size.width * 0.9,
        decoration: const BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black26,
              offset: Offset(0, 3),
              blurRadius: 6,
            ),
          ],
          borderRadius: BorderRadius.all(Radius.circular(50)),
        ),
        child: Column(
          children: [
            Expanded(
              child: Image.network(
                'https://picsum.photos/250?image=9',
                fit: BoxFit.fill,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
