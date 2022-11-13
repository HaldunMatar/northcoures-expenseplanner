import 'package:expenseplanner/transaction.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ListTx extends StatelessWidget {
  List<Transaction> transactionslist = [];
  final Function deteteTransaction;

  ListTx(this.transactionslist, this.deteteTransaction);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 400,
      child: ListView(
        children: transactionslist.map((tx) {
          return Card(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Container(
                  margin: EdgeInsets.symmetric(
                    vertical: 10,
                    horizontal: 15,
                  ),
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.purple,
                      width: 3,
                    ),
                  ),
                  padding: EdgeInsets.all(10),
                  child: Text(
                    ' \$  ${tx.amount.toString()}',
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      tx.title,
                      style: Theme.of(context).textTheme.bodyText2,
                    ),
                    Text(
                      DateFormat('yyyy/mm/dd').format(tx.date),
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
                IconButton(
                  onPressed: () {
                    deteteTransaction(tx.id);
                  },
                  icon: Icon(
                    color: Colors.red,
                    Icons.delete,
                  ),
                )
              ],
            ),
          );
        }).toList(),
      ),
    );
  }
}
