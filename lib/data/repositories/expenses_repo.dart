import 'package:flutter/cupertino.dart';
import 'package:flutter_learning/data/database/database.dart';

class ExpenseRepository extends ChangeNotifier {
  double? totalExpenses = 0;

  void calculateTotalExpenses() {
    Database.calculateTotalExpenses().then((totalExpenses) =>
        {this.totalExpenses = totalExpenses, notifyListeners()});
  }
}
