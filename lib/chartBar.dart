import 'package:flutter/material.dart';

class ChartBar extends StatelessWidget {
  String day = '';
  double amount = 0;
  double weekpercent = 0.0;
  ChartBar(this.day, this.amount, this.weekpercent);

  @override
  Widget build(BuildContextcontext) {
    return Column(
      children: [
        Text(amount.toString()),
        Container(
          width: 10,
          height: 100,
          child: Stack(children: [
            Container(
              width: 10,
              height: 100,
              color: Color.fromARGB(255, 218, 218, 218),
            ),
            FractionallySizedBox(
              heightFactor: weekpercent,
              child: Container(color: Colors.purple),
            )
          ]),
          decoration: BoxDecoration(
            color: Colors.grey,
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        Text(day),
      ],
    );
  }
}
