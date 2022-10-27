import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'transaction.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<Transaction> list = [
    Transaction(12, DateTime.now(), 'bread'),
    Transaction(47, DateTime.now(), 'bread2'),
    Transaction(47, DateTime.now(), 'bread3'),
    Transaction(47, DateTime.now(), 'bread4'),
    Transaction(47, DateTime.now(), 'bread5'),
    Transaction(47, DateTime.now(), 'bread6'),
    Transaction(47, DateTime.now(), 'bread7'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('expense planner'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            width: double.infinity,
            height: 70,
            // color: Colors.purple,
            child: Card(
              color: Colors.blue,
              elevation: 100,
              child: Text('charts'),
            ),
          ),
          Column(
            children: <Widget>[
              ...list
                  .map(
                    (tr) => Text(tr.amount.toString()),
                  )
                  .toList()
            ],
          )
        ],
      ),
    );
  }
}
