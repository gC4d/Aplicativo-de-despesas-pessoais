import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../models/Transaction.dart';
import 'chart_bar.dart';

class Chart extends StatelessWidget {
  final List<Transaction> recentTransaction;

  Chart(this.recentTransaction);

  List<Map<String, Object>> get groupedTransactions {
    return List.generate(7, (index) {
      final weekDay = DateTime.now().subtract(
        Duration(days: index),
      );
      double totalSum = 0.0;

      for (Transaction rT in recentTransaction) {
        bool sameDay = rT.date.day == weekDay.day;
        bool sameMonth = rT.date.month == weekDay.month;
        bool sameYear = rT.date.year == weekDay.year;

        if (sameDay && sameMonth && sameYear) {
          totalSum += rT.value;
        }
      }

      return {
        'day': DateFormat.E().format(weekDay)[0]+DateFormat.E().format(weekDay)[1]+DateFormat.E().format(weekDay)[2],
        'value': totalSum,
      };
    }).reversed.toList();
  }

  double get _weekTotalValue {
    return groupedTransactions.fold(0.0, (sum, tr) {
      return sum + double.parse(tr['value'].toString());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 6,
      margin: EdgeInsets.all(20),
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: groupedTransactions.map((tr) {
            return Flexible(
              fit: FlexFit.tight,
              child: ChartBar(
                label: tr['day'].toString(),
                value: double.parse(tr['value'].toString()),
                percentage: _weekTotalValue == 0 ? 0 :(tr['value'] as double) / _weekTotalValue ,
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}
