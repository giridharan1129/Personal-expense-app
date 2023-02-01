import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../models/transaction.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;
  final Function deleteTx;

  TransactionList(this.transactions,this.deleteTx);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height*0.6,
      child: transactions.isEmpty
          ? Column(
              children: [
                Text(
                  'No transactions added yet !',
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                    height: 200,
                    child: Image.asset(
                      'assets/PEimages/waiting.png',
                      fit: BoxFit.cover,
                    ))
              ],
            )
          : ListView.builder(
              itemBuilder: (context, index) {
                return Card(
                  margin: EdgeInsets.symmetric(vertical: 8, horizontal: 5),
                  elevation: 5,
                  child: ListTile(
                    leading: CircleAvatar(
                      radius: 30,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: FittedBox(
                          child: Text('\u{20B9} ${transactions[index].amount}'),
                        ),
                      ),
                    ),
                    title: Text(
                      transactions[index].title,
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    subtitle: Text(
                      DateFormat.yMMMMd()
                          .add_jm()
                          .format(transactions[index].date),
                      style: TextStyle(color: Colors.grey),
                    ),
                    trailing:IconButton(
                      icon: Icon(Icons.delete_forever),
                      color: Theme.of(context).errorColor,
                      onPressed: ()=>deleteTx(transactions[index].id),
                    ),
                  ),
                );
                // return Card(
                //   child: Row(
                //     children: [
                //       Container(
                //           margin: EdgeInsets.symmetric(
                //               vertical: 10, horizontal: 15),
                //           decoration: BoxDecoration(
                //               border: Border.all(
                //             color: Theme.of(context).primaryColor,
                //             width: 2,
                //           )),
                //           padding: EdgeInsets.all(10),
                //           child: Text(
                //             '\u{20B9} ${transactions[index].amount.toStringAsFixed(2)}',
                //             style: TextStyle(
                //                 fontWeight: FontWeight.bold,
                //                 fontSize: 20,
                //                 color: Theme.of(context).primaryColor),
                //           )),
                //       Column(
                //         crossAxisAlignment: CrossAxisAlignment.start,
                //         children: [
                //           Text(
                //             transactions[index].title,
                //             style: TextStyle(
                //                 fontSize: 18, fontWeight: FontWeight.bold),
                //           ),
                //           SizedBox(
                //             height: 8,
                //           ),
                //           Text(
                //             DateFormat.yMMMMd()
                //                 .add_jm()
                //                 .format(transactions[index].date),
                //             style: TextStyle(color: Colors.grey),
                //           )
                //         ],
                //       )
                //     ],
                //   ),
                // );
              },
              itemCount: transactions.length,
            ),
    );
  }
}
