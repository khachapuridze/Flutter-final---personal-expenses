import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_learning/data/models/expenses.dart';

final FirebaseFirestore _firestore = FirebaseFirestore.instance;
final CollectionReference _collectionReference = _firestore.collection("users");

class Database {
  static String? userId;

  static Future<void> addExpense({required Expense expense}) async {
    DocumentReference documentReference =
        _collectionReference.doc(userId).collection("expenses").doc();

    var data = <String, dynamic>{
      "title": expense.title,
      "expenseAmount": expense.expenseAmount,
      "date": expense.date
    };

    await documentReference
        .set(data)
        .whenComplete(() => print("added"))
        .catchError((e) => print(e));
  }

  static Future<QuerySnapshot> readExpenses() async {
    CollectionReference expensesReference =
        _collectionReference.doc(userId).collection("expenses");
    return expensesReference.get();
  }

  static Future<double> calculateTotalExpenses() async {
    QuerySnapshot expenses = await readExpenses();
    double total = 0;

    var i = 0;
    while (i < expenses.size) {
      total += expenses.docs[i].get("expenseAmount");
      i++;
    }
    return total;
  }

  static Stream<QuerySnapshot> readExpensesAsStream() {
    CollectionReference expensesReference =
        _collectionReference.doc(userId).collection("expenses");
    return expensesReference.snapshots();
  }

  static Future<void> updateExpense(
      {required String? docId, required Expense expense}) async {
    DocumentReference documentReference =
        _collectionReference.doc(userId).collection("expenses").doc(docId);

    var data = <String, dynamic>{
      "title": expense.title,
      "expenseAmount": expense.expenseAmount,
      "date": expense.date
    };

    await documentReference
        .update(data)
        .whenComplete(() => print("expense updated!"))
        .catchError((e) => print(e));
  }

  static Future<void> deleteExpense({required String docId}) async {
    DocumentReference documentReference =
        _collectionReference.doc(userId).collection("expenses").doc(docId);

    await documentReference
        .delete()
        .whenComplete(() => print("deleted"))
        .catchError((e) => print(e));
  }
}
