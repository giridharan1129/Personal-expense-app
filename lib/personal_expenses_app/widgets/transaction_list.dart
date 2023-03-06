import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:multiple_apps/personal_expenses_app/widgets/transaction_item.dart';

import '../models/transaction.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;
  final Function deleteTx;

  TransactionList(this.transactions, this.deleteTx);

  @override
  Widget build(BuildContext context) {
    return transactions.isEmpty
        ? LayoutBuilder(builder: (ctx, constraints) {
            return Column(
              children: [
                Text(
                  'No transactions added yet !',
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                Container(
                    height: constraints.maxHeight * 0.6,
                    child: Image.asset(
                      'assets/PEimages/waiting.png',
                      fit: BoxFit.cover,
                    ))
              ],
            );
          })
        : ListView(
            children: transactions
                .map((tx) => TransactionItem(
                    key: ValueKey(tx.id), transactions: tx, deleteTx: deleteTx))
                .toList(),
          );
  }
}
