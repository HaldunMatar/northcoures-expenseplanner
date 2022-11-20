import 'package:flutter/material.dart';

class ChartBar extends StatelessWidget {
  String day = '';
  double amount = 0;
  ChartBar(this.day, this.amount);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(amount.toString()),
        Container(
          width: 10,
          height: 100,
          child: Stack(children: [
            Container(
              height: 50,
              width: 10,
              color: Colors.purple,
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
