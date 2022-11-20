import 'package:flutter/material.dart';

import 'chartBar.dart';

class Charts extends StatelessWidget {
  const Charts({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          ChartBar('sun', 20),
          ChartBar('Mon', 30),
          ChartBar('tue', 40),
          ChartBar('wen', 50),
          ChartBar('thre', 60),
          ChartBar('fri', 30),
          ChartBar('sat', 10),
        ],
      ),
    );
  }
}
