import 'package:flutter/material.dart';

import 'chartBar.dart';
import 'transaction.dart';
import 'package:intl/intl.dart';

class Charts extends StatelessWidget {
  List<Transaction> AllTrans = [];

  List<Map<String, Object>> weekTransSum = [];

  Charts(this.AllTrans);

  void TransformToWeekTransSum() {
    for (var i = 0; i < 7; i++) {
      var weekday = DateTime.now().subtract(Duration(days: i));

      var daystring = DateFormat.E().format(weekday).substring(0, 2);

     


      weekTransSum.add({'day': daystring, 'amountDay': 10.6});
    }
  }

  @override
  Widget build(BuildContext context) {
    TransformToWeekTransSum();
    return Card(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          ...weekTransSum
              .map((daymap) => ChartBar(
                  daymap['day'] as String, daymap['amountDay'] as double))
              .toList()
        ],
      ),
    );
  }
}
