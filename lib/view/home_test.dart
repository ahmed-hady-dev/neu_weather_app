import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';

class HomeTest extends StatefulWidget {
  static const double minSize = 50;
  static const double maxSize = 200;

  @override
  _HomeTestState createState() => _HomeTestState();
}

class _HomeTestState extends State<HomeTest> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Test'),
          centerTitle: true,
        ),
        body: PageView(
          // allowImplicitScrolling: false,
          // reverse: true,
          
          scrollDirection: Axis.vertical,
          // pageSnapping: false,
          children: [
            Opacity(
              opacity: 0.5,
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.blue,
                ),
                height: HomeTest.maxSize,
                width: HomeTest.maxSize,
                child: Center(
                  child: Text(
                    'hahahha',
                    style: TextStyle(color: Colors.black),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 16,
            ),
            RaisedButton(
              shape: StadiumBorder(),
              onPressed: () {},
              child: Text(
                'do Magic',
                style: TextStyle(color: Colors.white),
              ),
              color: Colors.teal,
            ),
          ],
        ),
      ),
    );
  }
}
