import '/listTx.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'newtransaction.dart';
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
        primarySwatch: Colors.purple,
        textTheme: ThemeData.light().textTheme.copyWith(
              bodyText2: TextStyle(fontSize: 25, color: Colors.red),
            ),
        textButtonTheme: TextButtonThemeData(
          style: TextButton.styleFrom(foregroundColor: Colors.orange),
        ),
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
  final List<Transaction> transactionslist = [
    Transaction(id: '1', title: 'apple', amount: 10, date: DateTime.now())
  ];

  void addNewTransaction(String titleinput, double amountinput) {
    print('  $titleinput    ------    $amountinput ');
    setState(() {
      var newtx = Transaction(
          id: DateTime.now().toString(),
          amount: amountinput,
          title: titleinput,
          date: DateTime.now());
      transactionslist.add(newtx);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter App'),
        actions: [
          IconButton(
              onPressed: () {
                print('I am in showbottomsheet ');
                showBottomSheet(
                    context: context,
                    builder: (BuildContext context) {
                      return Container(
                        width: 100,
                        height: 50,
                        color: Colors.pink,
                      );
                    });
              },
              icon: Icon(
                Icons.add,
                color: Colors.white,
              ))
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Container(
              width: double.infinity,
              child: Card(
                color: Colors.blue,
                child: Text(
                  'CHART!',
                  style: Theme.of(context).textTheme.headline3,
                ),
                elevation: 5,
              ),
            ),
            NewTransaction(addNewTransaction),
            ListTx(transactionslist)
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.small(
          child: Icon(
            Icons.add,
          ),
          onPressed: () {
            showModalBottomSheet(
                context: context,
                builder: (BuildContext context) {
                  return Container(
                    width: 100,
                    height: 100,
                    color: Colors.pink,
                  );
                });
          }),
    );
  }
}
