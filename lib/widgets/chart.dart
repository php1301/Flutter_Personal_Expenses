import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../model/transaction.dart';
import '../widgets/chart_bar.dart';

class Chart extends StatelessWidget {
  final List<Transaction> recentTransactions;
  Chart(this.recentTransactions);
  List<Map<String, Object>> get groupedTransactionValues {
    return List.generate(7, (i) {
      final weekDay = DateTime.now().subtract(Duration(days: i));
      double totalSum = 0.0; // Able to infer the type
      for (var index = 0; index < recentTransactions.length; index++) {
        if (recentTransactions[index].date.day == weekDay.day &&
            recentTransactions[index].date.month == weekDay.month &&
            recentTransactions[index].date.year == weekDay.year) {
          totalSum += recentTransactions[index].amount;
        }
      }
      // print(DateFormat.E().format(weekDay)); // Shortcut to weekday
      // print(totalSum);
      return {
        'day': DateFormat.E().format(weekDay).substring(0, 1),
        'amount': totalSum
      };
    });
  }

  double get totalSpending {
    return groupedTransactionValues.fold(0.0, (sum, item) {
      return sum + item['amount'];
    });
  }

  @override
  Widget build(BuildContext context) {
    print(groupedTransactionValues);
    print(totalSpending);
    return Card(
      elevation: 6,
      margin: EdgeInsets.all(20),
      child: Padding(
        padding: EdgeInsets.all(10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: groupedTransactionValues.map((e) {
            // return Text('${e['day']}: ${e['amount']}');
            return Flexible(
              fit: FlexFit.tight,
              child: ChartBar(
                label: e['day'],
                spendingAmount: e['amount'],
                spendingPctOfTotal: totalSpending == 0.0
                    ? 0.0
                    : (e['amount'] as double) / totalSpending,
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}
