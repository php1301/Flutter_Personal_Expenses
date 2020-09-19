import 'package:flutter/material.dart';
import '../model/transaction.dart';
import './transaction_item.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;
  final Function delelteTx;
  TransactionList(this.transactions, this.delelteTx);
  // use const widget when the overall widget included children is not dynamic
  // need a const constructor to enable this
  @override
  Widget build(BuildContext context) {
    // return Container(
    //   height: MediaQuery.of(context).size.height * 0.6,
    //   // child: ListView(
    //   child:
    return transactions.isEmpty
        ? LayoutBuilder(
            builder: (context, constraints) {
              return Column(
                children: [
                  Text(
                    'No Transactions added yet!',
                    style: Theme.of(context).textTheme.headline6,
                  ),
                  const SizedBox(height: 10), // Spacing,
                  Container(
                      height: constraints.maxHeight * 0.6,
                      child: Image.asset(
                        'assets/images/image/waiting.png',
                        fit: BoxFit.cover,
                      )),
                ],
              );
            },
          )
        : ListView.builder(
            itemBuilder: (ctx, index) {
              return TransactionItem(
                  transaction: transactions[index], delelteTx: delelteTx);
              // return Card(
              //   // Adavantage su dung class, khong phai ['property']
              //   child: Row(
              //     children: [
              //       Container(
              //         margin: EdgeInsets.symmetric(
              //             vertical: 10, // Style top bottom
              //             horizontal: 15 // Style left right
              //             ),
              //         decoration: BoxDecoration(
              //             border: Border.all(
              //           color: Theme.of(context).primaryColor,
              //           width: 2,
              //         )),
              //         padding: EdgeInsets.all(10),
              //         child: Text(
              //           '\$${transactions[index].amount.toStringAsFixed(2)}', // chi co e thi $e, backlash-character
              //           style: TextStyle(
              //             fontWeight: FontWeight.bold,
              //             fontSize: 20,
              //             color: Theme.of(context).primaryColor,
              //           ),
              //         ),
              //       ),
              //       Column(
              //         crossAxisAlignment: CrossAxisAlignment.start,
              //         children: [
              //           Text(
              //             transactions[index].title.toString(),
              //             // style: TextStyle(
              //             //   fontWeight: FontWeight.bold,
              //             //   fontSize: 20,
              //             // ),
              //             style: Theme.of(context).textTheme.headline6,
              //           ),
              //           Text(
              //             // DateFormat('yyyy-MM-dd').format(e.date),
              //             DateFormat.yMMMEd()
              //                 .format(transactions[index].date),
              //             style: TextStyle(color: Colors.grey),
              //           ),
              //         ],
              //       )
              //     ],
              //   ),
              // );
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
          );
  }
}
