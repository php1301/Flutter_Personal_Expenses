import 'package:flutter/material.dart';
import '../widgets/new_transaction.dart';
// import '../widgets/transaction_list.dart';
import '../model/transaction.dart';

class UserTransactions extends StatefulWidget {
  @override
  _UserTransactionsState createState() => _UserTransactionsState();
}

class _UserTransactionsState extends State<UserTransactions> {
  final List<Transaction> _userTransactions = [
    Transaction(
        id: '1', title: 'Transaction 1', amount: 99.99, date: DateTime.now()),
    Transaction(
        id: '2', title: 'Transaction 2', amount: 19.99, date: DateTime.now()),
  ];
  void _addNewTransaction(String txTitle, double txAmount) {
    final newTx = Transaction(
        title: txTitle,
        amount: txAmount,
        date: DateTime.now(),
        id: DateTime.now().toString());
    setState(() {
      _userTransactions.add(newTx);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        NewTransaction(_addNewTransaction),
        // TransactionList(_userTransactions),
      ],
    );
  }
}
