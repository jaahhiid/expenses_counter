import '../models/transaction.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;

  TransactionList(this.transactions);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      child: transactions.isEmpty
          ? Column(
              children: [
                Text(
                  'No transaction added yet',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20.0,
                  ),
                ),
                SizedBox(
                  height: 20.0,
                ),
                Center(
                  child: Container(
                    height: 200,
                    child: Image.asset(
                      'assets/images/waiting.png',
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ],
            )
          : ListView.builder(
              itemBuilder: ((ctx, index) {
                return Card(
                  child: Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(10),
                        margin: const EdgeInsets.symmetric(
                          vertical: 10,
                          horizontal: 15,
                        ),
                        decoration: BoxDecoration(
                            border: Border.all(
                          color: Theme.of(context).primaryColor,
                          width: 2,
                        )),
                        child: Text(
                          'Taka ${transactions[index].amount.toStringAsFixed(2)}',
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
                            transactions[index].title,
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'OpenSans',
                            ),
                          ),
                          Text(
                            DateFormat.yMMMd().format(transactions[index].date),
                            //tx.date.toString(),
                            style: TextStyle(
                              color: Colors.grey,
                            ),
                          ),
                        ],
                      ),
                      // Column(
                      //   children: [
                      //     Text('Extra Column'),
                      //     Text('Extra New Line'),
                      //   ],
                      // ),
                      // Row(
                      //   children: [
                      //     Text('Row in Row'),
                      //   ],
                      // ),
                    ],
                  ),
                );
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
