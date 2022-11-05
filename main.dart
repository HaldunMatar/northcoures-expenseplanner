import 'package:expenseplanner/listTx.dart';
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
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String titleinput = '';

  double amountinput = 0;

  final List<Transaction> transactionslist = [
    Transaction(id: '1', title: 'apple', amount: 10, date: DateTime.now())
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter App'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Container(
            width: double.infinity,
            child: Card(
              color: Colors.blue,
              child: Text('CHART!'),
              elevation: 5,
            ),
          ),
          Card(
            elevation: 20,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                // color: Colors.orange,
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Column(children: [
                    TextField(
                      decoration: InputDecoration(
                        labelText: 'title',
                      ),
                      onChanged: (value) {
                        titleinput = value;
                      },
                    ),
                    TextField(
                      decoration: InputDecoration(labelText: 'Amount'),
                      onChanged: (value) {
                        amountinput = double.parse(value);
                      },
                    ),
                    TextButton(
                      child: Text('Add transaction'),
                      onPressed: () {
                        print('  $titleinput    ------    $amountinput ');
                        setState(() {
                          var newtx = Transaction(
                              id: DateTime.now().toString(),
                              amount: amountinput,
                              title: titleinput,
                              date: DateTime.now());
                          transactionslist.add(newtx);
                        });
                      },
                    )
                  ]),
                ),
              ),
            ),
          ),
          ListTx(transactionslist)
        ],
      ),
    );
  }
}
