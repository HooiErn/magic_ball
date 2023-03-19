import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.lightBlueAccent,
        appBar: AppBar(
          title: Center(child: Text('Ask Me Anything')),
          backgroundColor: Colors.indigo,
        ),
        body: BallPage(),
      ),
    ),
  );
}

class BallPage extends StatefulWidget {
  const BallPage({Key? key}) : super(key: key);

  @override
  State<BallPage> createState() => _BallPageState();
}

class _BallPageState extends State<BallPage> {
  int ballNumber = 1;
  String message = '';
  List<String> messages = [
    'Want to continue asking?',
    'Do you have more questions?',
    'What else would you like to know?',
    'Anything else on your mind?',
    'Keep asking!'
  ];

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextButton(
            onPressed: () {
              setState(() {
                ballNumber = Random().nextInt(5) + 1;
                if (ballNumber == 6) {
                  ballNumber = 1;
                }
                message = messages[Random().nextInt(messages.length)];
              });
              print('ball $ballNumber is pressed');
            },
            child: Image.asset(
              'images/ball$ballNumber.png',
              width: 250.0,
              height: 250.0,
            ),
          ),
          SizedBox(
            height: 20.0,
          ),
          Text(
            message,
            style: TextStyle(
              color: Colors.white,
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
