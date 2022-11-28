import 'package:flutter/material.dart';

import 'chartBar.dart';
import 'transaction.dart';
import 'package:intl/intl.dart';

class Charts extends StatelessWidget {
  List<Transaction> AllTrans = [];

  List<Map<String, Object>> weekTransSum = [];

  Charts(this.AllTrans);

  void TransformToWeekTransSum() {
    var sumofweek = 0.0;

    for (var i = 0; i < 7; i++) {
      var weekday = DateTime.now().subtract(Duration(days: i));

      var daystring = DateFormat.E().format(weekday).substring(0, 2);
      var sumday = 0.0;

      for (var j = 0; j < AllTrans.length; j++) {
        if (AllTrans[j].date.day == weekday.day &&
            AllTrans[j].date.year == weekday.year &&
            AllTrans[j].date.month == weekday.month) {
          sumday = sumday + AllTrans[j].amount;
        }

        sumofweek = sumofweek + sumday;
      }
      weekTransSum.add({
        'day': daystring,
        'amountDay': sumday,
        'weekpercent': sumday / sumofweek
      });
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
                  daymap['day'] as String,
                  daymap['amountDay'] as double,
                  daymap['weekpercent'] as double))
              .toList()
        ],
      ),
    );
  }
}
