import 'package:flutter/material.dart';

class NewTransaction extends StatelessWidget {
  Function addTransaction;

  NewTransaction(this.addTransaction);
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
                    child: Text('Date : $selectedDate'),
                  ),
                  TextButton(
                      onPressed: (() {
                        showDatePicker(
                                context: context,
                                initialDate: DateTime.now(),
                                firstDate: DateTime(2010),
                                lastDate: DateTime.now())
                            .then((value) {
                          selectedDate = value;
                        });
                      }),
                      child: Text('Choose Date'))
                ],
              ),
              TextButton(
                child: Text('Add transaction'),
                onPressed: () {
                  addTransaction(titleinput, amountinput);
                },
              ),
              ElevatedButton(
                  onPressed: () {
                    print('I am in showbottomsheet ');
                  },
                  child: Text('test'))
            ]),
          ),
        ),
      ),
    );
  }
}
