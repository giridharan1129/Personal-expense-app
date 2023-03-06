import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:multiple_apps/personal_expenses_app/widgets/adaptive_flat_button.dart';

class NewTransaction extends StatefulWidget {
  final Function addTx;

  NewTransaction(this.addTx) {
    print('constructor newtransaction widget');
  }

  @override
  State<NewTransaction> createState() {
    print('create state newtransaction widget');
    return _NewTransactionState();
  }
}

class _NewTransactionState extends State<NewTransaction> {
  final _titleController = TextEditingController();
  final _amountController = TextEditingController();
  DateTime? _selectedDate;

  _NewTransactionState() {
    print('constructor newtransaction widget');
  }

  @override
  void initState() {
    print('init widget');
    super.initState();
  }

  @override
  void didUpdateWidget(covariant NewTransaction oldWidget) {
    print('didupdate widget');
    super.didUpdateWidget(oldWidget);
  }

  @override
  void dispose() {
    print('dispose widget');
    super.dispose();
  }

  void _submitData() {
    if (_amountController.text.isEmpty) {
      return;
    }
    final enteredTitle = _titleController.text;
    final enteredAmount = double.parse(_amountController.text);

    if (enteredTitle.isEmpty || enteredAmount <= 0 || _selectedDate == null) {
      return;
    }
    widget.addTx(enteredTitle, enteredAmount, _selectedDate);

    Navigator.of(context).pop();
  }

  void _presentDatePicker() {
    showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime(2022),
            lastDate: DateTime.now())
        .then((pickedDate) {
      if (pickedDate == null) {
        return;
      }
      setState(() {
        (_selectedDate = pickedDate);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Card(
        elevation: 5,
        child: Container(
          padding: EdgeInsets.only(
              top: 10,
              left: 10,
              right: 10,
              bottom: MediaQuery.of(context).viewInsets.bottom + 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              TextField(
                decoration: InputDecoration(labelText: 'Title'),
                cursorColor: Colors.amber,
                controller: _titleController,
                onSubmitted: (_) => _submitData(),
              ),
              TextField(
                decoration: InputDecoration(labelText: 'Amount'),
                cursorColor: Colors.green,
                controller: _amountController,
                keyboardType: TextInputType.number,
                onSubmitted: (_) => _submitData(),
              ),
              Container(
                height: 70,
                child: Row(
                  children: [
                    Expanded(
                        child: Text(_selectedDate == null
                            ? 'No date chosen !'
                            : 'Picked date : ${DateFormat.yMMMMd().format(_selectedDate as DateTime)}')),
                    AdaptiveFlatButton(
                        "Choose Date", () => _presentDatePicker())
                  ],
                ),
              ),
              ElevatedButton.icon(
                  onPressed: _submitData,
                  style: ButtonStyle(
                      backgroundColor: MaterialStatePropertyAll(
                          Theme.of(context).primaryColorLight)),
                  icon: Icon(Icons.add_to_queue),
                  label: Text('Add transaction'))
            ],
          ),
        ),
      ),
    );
  }
}
