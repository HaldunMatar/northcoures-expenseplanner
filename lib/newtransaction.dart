import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class NewTransaction extends StatefulWidget {
  Function addTransaction;

  NewTransaction(this.addTransaction);

  @override
  State<NewTransaction> createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  String titleinput = '';

  double amountinput = 0;

  DateTime? selectedDate;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 20,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          // color: Colors.orange,
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Column(children: [
              TextField(
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  labelText: 'title',
                ),
                onChanged: (value) {
                  titleinput = value;
                },
              ),
              TextField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(labelText: 'Amount'),
                onChanged: (value) {
                  amountinput = double.parse(value);
                },
              ),
              Row(
                children: [
                  Expanded(
                    child: Text(
                        'Date : ${selectedDate == null ? '' : DateFormat.yMMMd().format(selectedDate!)}'),
                  ),
                  TextButton(
                      onPressed: (() {
                        showDatePicker(
                                context: context,
                                initialDate: DateTime.now(),
                                firstDate: DateTime(2010),
                                lastDate: DateTime.now())
                            .then((value) {
                          setState(() {
                            selectedDate = value;
                          });
                        });
                      }),
                      child: Text('Choose Date'))
                ],
              ),
              ElevatedButton(
                child: Text('Add transaction'),
                onPressed: () {
                  widget.addTransaction(titleinput, amountinput, selectedDate);
                },
              ),
            ]),
          ),
        ),
      ),
    );
  }
}
