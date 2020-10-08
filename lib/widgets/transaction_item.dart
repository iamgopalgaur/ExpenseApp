import 'package:expanse_app/models/transaction.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TransactionItem extends StatelessWidget {
  const TransactionItem({
    Key key,
    @required this.transaction,
    @required this.deleteTx,
  }) : super(key: key);

  final Transaction transaction;
  final Function deleteTx;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      margin: EdgeInsets.symmetric(
        vertical: 8,
        horizontal: 5,
      ),
      child: ListTile(
        leading: CircleAvatar(
          radius: 30,

//FittedBox is used to shrink the bigger text and fit into a particular area
          child: Padding(
            padding: EdgeInsets.all(6),
            child: FittedBox(
              child: Text('₹${transaction.amount}'),
            ),
          ),
        ),
        title: Text(transaction.title,
            // ignore: deprecated_member_use
            style: Theme.of(context).textTheme.title),
        subtitle: Text(
          DateFormat.yMMMd().format(transaction.date),
        ),

        //trailing shows up at the end od the listtile
        trailing: MediaQuery.of(context).size.width > 360
            ? FlatButton.icon(
                textColor: Theme.of(context).errorColor,
                onPressed: () => deleteTx(transaction.id),
                icon: Icon(Icons.delete),
                label: Text('Delete'),
              )
            : IconButton(
                icon: Icon(Icons.delete),
                color: Theme.of(context).errorColor,
                onPressed: () => deleteTx(transaction.id),
              ),
      ),
    );
  }
}
