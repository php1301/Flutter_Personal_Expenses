import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../model/transaction.dart';

class TransactionItem extends StatelessWidget {
  const TransactionItem({
    Key key,
    @required this.transaction,
    @required this.delelteTx,
  }) : super(key: key);

  // final List<Transaction> transactions;
  final Transaction transaction;
  final Function delelteTx;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      margin: EdgeInsets.symmetric(vertical: 8, horizontal: 5),
      child: ListTile(
        leading: CircleAvatar(
          radius: 30,
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: FittedBox(child: Text('\$${transaction.amount}')),
          ),
        ),
        title: Text(transaction.title,
            style: Theme.of(context).textTheme.headline6),
        subtitle: Text(DateFormat.yMMMEd().format(transaction.date)),
        trailing:
            MediaQuery.of(context).size.width > 360 // Responsive base on width
                ? FlatButton.icon(
                    textColor: Theme.of(context).errorColor,
                    onPressed: () => delelteTx(transaction.id),
                    icon: const Icon(Icons.delete),
                    label: const Text('Delete'),
                  )
                : IconButton(
                    icon: const Icon(Icons.delete),
                    color: Theme.of(context).errorColor,
                    onPressed: () => delelteTx(transaction.id),
                  ),
      ),
    );
  }
}
