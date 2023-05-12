import '../models/transaction.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import './transaction_item.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;
  final Function deleteTx;

  TransactionList(this.transactions, this.deleteTx);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 400,
      child: transactions.isEmpty
          ? LayoutBuilder(
              builder: (ctx, constraints) {
                return Column(
                  children: [
                    Text(
                      'No transaction added yet',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20.0,
                      ),
                    ),
                    SizedBox(
                      height: constraints.maxHeight * 0.1,
                    ),
                    Center(
                      child: Container(
                        height: constraints.maxHeight * 0.6,
                        child: Image.asset(
                          'assets/images/waiting.png',
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ],
                );
              },
            )
          : ListView.builder(
              itemBuilder: ((ctx, index) {
                return TransactionItem(
                    transaction: transactions[index], deleteTx: deleteTx);
                // return Card(
                //   child: Row(
                //     children: [
                //       Container(
                //         padding: const EdgeInsets.all(10),
                //         margin: const EdgeInsets.symmetric(
                //           vertical: 10,
                //           horizontal: 15,
                //         ),
                //         decoration: BoxDecoration(
                //             border: Border.all(
                //           color: Theme.of(context).primaryColor,
                //           width: 2,
                //         )),
                //         child: Text(
                //           'Taka ${transactions[index].amount.toStringAsFixed(2)}',
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
                //             transactions[index].title,
                //             style: TextStyle(
                //               fontSize: 15,
                //               fontWeight: FontWeight.bold,
                //               fontFamily: 'OpenSans',
                //             ),
                //           ),
                //           Text(
                //             DateFormat.yMMMd().format(transactions[index].date),
                //             //tx.date.toString(),
                //             style: TextStyle(
                //               color: Colors.grey,
                //             ),
                //           ),
                //         ],
                //       ),
                //       // Column(
                //       //   children: [
                //       //     Text('Extra Column'),
                //       //     Text('Extra New Line'),
                //       //   ],
                //       // ),
                //       // Row(
                //       //   children: [
                //       //     Text('Row in Row'),
                //       //   ],
                //       // ),
                //     ],
                //   ),
                // );
              }),
              itemCount: transactions.length,
              // children: transactions.map((tx) {

              // }).toList(),
              // children: [
              //   Card(),
              //   Card(),
              // ],
            ),
    );
  }
}
