import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';

class Transaction {
  String id;
  String title;
  int amount;
  DateTime date;

  Transaction(
      {@required this.id,
      @required this.title,
      @required this.amount,
      @required this.date});
}
