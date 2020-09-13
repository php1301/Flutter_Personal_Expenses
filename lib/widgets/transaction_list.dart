import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../model/transaction.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;
  TransactionList(this.transactions);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      // child: ListView(
      child: transactions.isEmpty
          ? Column(
              children: [
                Text(
                  'No Transactions added yet!',
                  style: Theme.of(context).textTheme.headline6,
                ),
                SizedBox(height: 10), // Spacing,
                Container(
                    height: 200,
                    child: Image.asset(
                      'assets/images/image/waiting.png',
                      fit: BoxFit.cover,
                    )),
              ],
            )
          : ListView.builder(
              itemBuilder: (ctx, index) {
                return Card(
                  // Adavantage su dung class, khong phai ['property']
                  child: Row(
                    children: [
                      Container(
                        margin: EdgeInsets.symmetric(
                            vertical: 10, // Style top bottom
                            horizontal: 15 // Style left right
                            ),
                        decoration: BoxDecoration(
                            border: Border.all(
                          color: Theme.of(context).primaryColor,
                          width: 2,
                        )),
                        padding: EdgeInsets.all(10),
                        child: Text(
                          '\$${transactions[index].amount.toStringAsFixed(2)}', // chi co e thi $e, backlash-character
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            color: Theme.of(context).primaryColor,
                          ),
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            transactions[index].title.toString(),
                            // style: TextStyle(
                            //   fontWeight: FontWeight.bold,
                            //   fontSize: 20,
                            // ),
                            style: Theme.of(context).textTheme.headline6,
                          ),
                          Text(
                            // DateFormat('yyyy-MM-dd').format(e.date),
                            DateFormat.yMMMEd()
                                .format(transactions[index].date),
                            style: TextStyle(color: Colors.grey),
                          ),
                        ],
                      )
                    ],
                  ),
                );
              },
              itemCount: transactions.length,
              // children: transactions
              //     .map(
              //       (e) => Card(
              //         // Adavantage su dung class, khong phai ['property']
              //         child: Row(
              //           children: [
              //             Container(
              //               margin: EdgeInsets.symmetric(
              //                   vertical: 10, // Style top bottom
              //                   horizontal: 15 // Style left right
              //                   ),
              //               decoration: BoxDecoration(
              //                   border: Border.all(
              //                 color: Colors.purple,
              //                 width: 2,
              //               )),
              //               padding: EdgeInsets.all(10),
              //               child: Text(
              //                 '\$${e.amount}', // chi co e thi $e, backlash-character
              //                 style: TextStyle(
              //                   fontWeight: FontWeight.bold,
              //                   fontSize: 20,
              //                   color: Colors.purple,
              //                 ),
              //               ),
              //             ),
              //             Column(
              //               crossAxisAlignment: CrossAxisAlignment.start,
              //               children: [
              //                 Text(
              //                   e.title.toString(),
              //                   style: TextStyle(
              //                     fontWeight: FontWeight.bold,
              //                     fontSize: 20,
              //                   ),
              //                 ),
              //                 Text(
              //                   // DateFormat('yyyy-MM-dd').format(e.date),
              //                   DateFormat.yMMMEd().format(e.date),
              //                   style: TextStyle(color: Colors.grey),
              //                 ),
              //               ],
              //             )
              //           ],
              //         ),
              //       ),
              //     )
              //     .toList(),
            ),
    );
  }
}
