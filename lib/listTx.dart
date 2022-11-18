import 'package:expenseplanner/transaction.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ListTx extends StatefulWidget {
  List<Transaction> transactionslist = [];
  final Function deteteTransaction;

  ListTx(this.transactionslist, this.deteteTransaction);

  @override
  State<ListTx> createState() => _ListTxState();
}

class _ListTxState extends State<ListTx> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 400,
      child: ListView(
        children: widget.transactionslist.map((tx) {
          return Card(
            child: ListTile(
                leading: CircleAvatar(
                  /// backgroundColor: _bgColor,
                  radius: 30,
                  child: Padding(
                    padding: EdgeInsets.all(6),
                    child: Text('\$${tx.amount}'),
                  ),
                ),
                title: Text(
                  tx.title,
                  style: Theme.of(context).textTheme.headline6,
                ),
                subtitle: Text(
                  DateFormat.yMMMd().format(tx.date),
                ),
                trailing: TextButton.icon(
                    onPressed: () => {widget.deteteTransaction(tx.id)},
                    icon: Icon(Icons.delete),
                    label: Text("Delete"))),
          );
        }).toList(),
      ),
    );
  }
}
