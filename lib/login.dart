import 'package:flutter/material.dart';

import 'main.dart';

class login extends StatelessWidget {
  const login({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          child: Center(
        child: ElevatedButton(
          child: Text('login'),
          onPressed: () {
            Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => MyHomePage(),
            ));
          },
        ),
      )),
    );
  }
}
