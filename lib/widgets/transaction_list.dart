import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../models/transaction.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;

  TransactionList(this.transactions);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      child: ListView.builder(
        itemBuilder: (ctx, index) {
          return Card(
            elevation: 5,
            child: Row(
              children: [
                Container(
                  child: Text(
                    "\₹" + transactions[index].amount.toStringAsFixed(2),
                    style: TextStyle(
                      fontSize: 15,
                      color: Colors.black,
                    ),
                  ),
                  margin: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                  decoration: BoxDecoration(
                    border: Border.all(
                        width: 3, color: Theme.of(context).primaryColor),
                  ),
                  padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      transactions[index].title,
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                          color: Colors.black),
                    ),
                    Text(
                      DateFormat.yMMMMd("en_US")
                          .format(transactions[index].date),
                      style: Theme.of(context).textTheme.bodyText1,
                      textAlign: TextAlign.start,
                    ),
                  ],
                ),
              ],
            ),
          );
        },
        itemCount: transactions.length,
      ),
    );
  }
}
