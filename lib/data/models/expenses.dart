class Expense {
  String? docId;
  final String? title;
  final double? expenseAmount;
  final String date;

  Expense({
    required this.title,
    required this.expenseAmount,
    required this.date,
  });
}
