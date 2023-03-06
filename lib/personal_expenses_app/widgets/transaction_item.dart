import 'dart:math';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../models/transaction.dart';

class TransactionItem extends StatefulWidget {
  const TransactionItem({
    super.key,
    required this.transactions,
    required this.deleteTx,
  });

  final Transaction transactions;
  final Function deleteTx;

  @override
  State<TransactionItem> createState() => _TransactionItemState();
}

class _TransactionItemState extends State<TransactionItem> {
  Color? _bgColor;
  @override
  void initState() {
    const availableColors = [
      Colors.red,
      Colors.black,
      Colors.blue,
      Colors.purple
    ];

    _bgColor = availableColors[Random().nextInt(4)];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 8, horizontal: 5),
      elevation: 5,
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: _bgColor,
          radius: 30,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: FittedBox(
              child: Text('\u{20B9} ${widget.transactions.amount}'),
            ),
          ),
        ),
        title: Text(
          widget.transactions.title,
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        subtitle: Text(
          DateFormat.yMMMMd().add_jm().format(widget.transactions.date),
          style: TextStyle(color: Colors.grey),
        ),
        trailing: MediaQuery.of(context).size.width > 460
            ? TextButton.icon(
                style: TextButton.styleFrom(primary: Colors.red),
                onPressed: () => widget.deleteTx(widget.transactions.id),
                icon: const Icon(Icons.delete),
                label: const Text("Delete"))
            : IconButton(
                icon: const Icon(Icons.delete),
                color: Theme.of(context).errorColor,
                onPressed: () => widget.deleteTx(widget.transactions.id),
              ),
      ),
    );
  }
}
