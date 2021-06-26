import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_learning/data/database/database.dart';
import 'package:flutter_learning/data/models/expenses.dart';

class EditModalBottom extends StatefulWidget {
  const EditModalBottom({
    Key? key,
    this.expense,
    this.isLongPress,
  }) : super(key: key);
  final expense;
  final isLongPress;

  @override
  _EditModalBottomState createState() => _EditModalBottomState();
}

class _EditModalBottomState extends State<EditModalBottom> {
  late TextEditingController expensesTitleController;
  late TextEditingController expensesAmountController;
  late TextEditingController expensesDateController;

  @override
  Widget build(BuildContext context) {
    expensesTitleController =
        TextEditingController(text: widget.expense.get('title'));
    expensesAmountController = TextEditingController(
        text: widget.expense.get('expenseAmount')!.toStringAsFixed(2));
    expensesDateController =
        TextEditingController(text: widget.expense.get('date'));
    return Container(
      height: 400,
      decoration: BoxDecoration(
        color: Color(0xffCEF7ED),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30.0),
        child: Column(
          children: [
            SizedBox(
              height: 30.0,
            ),
            TextField(
              controller: expensesAmountController,
              inputFormatters: <TextInputFormatter>[
                FilteringTextInputFormatter.digitsOnly
              ],
              decoration: InputDecoration(
                hintText: "Please enter expense amount",
                contentPadding: EdgeInsets.symmetric(horizontal: 10.0),
                fillColor: Colors.transparent,
                filled: true,
                enabledBorder: UnderlineInputBorder(
                  borderRadius: BorderRadius.circular(5.0),
                  borderSide: BorderSide(color: Color(0xff707070), width: 2.0),
                ),
              ),
              keyboardType: TextInputType.numberWithOptions(decimal: true),
            ),
            SizedBox(
              height: 25.0,
            ),
            TextField(
              controller: expensesTitleController,
              decoration: InputDecoration(
                hintText: "Please enter expense title",
                contentPadding: EdgeInsets.symmetric(horizontal: 10.0),
                fillColor: Colors.transparent,
                filled: true,
                enabledBorder: UnderlineInputBorder(
                  borderRadius: BorderRadius.circular(5.0),
                  borderSide: BorderSide(color: Color(0xff707070), width: 2.0),
                ),
              ),
              keyboardType: TextInputType.text,
            ),
            SizedBox(
              height: 20.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "20/10/2019",
                  style: TextStyle(fontSize: 18.0),
                ),
                TextButton(
                  style: TextButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12), // <-- Radius
                    ),
                    padding: const EdgeInsets.symmetric(
                        vertical: 10.0, horizontal: 20.0),
                    primary: Colors.white,
                    backgroundColor: Color(0xff267B7B),
                    textStyle: const TextStyle(fontSize: 20),
                  ),
                  onPressed: () => {},
                  child: Text("pick a date"),
                ),
              ],
            ),
            SizedBox(
              height: 40.0,
            ),
            // edit button
            Center(
              child: Container(
                width: 150.0,
                child: TextButton(
                  style: TextButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12), // <-- Radius
                    ),
                    padding: const EdgeInsets.symmetric(
                        vertical: 10.0, horizontal: 20.0),
                    primary: Colors.white,
                    backgroundColor: Color(0xff267B7B),
                    textStyle: const TextStyle(fontSize: 20),
                  ),
                  onPressed: () => {
                    print(widget.expense.id),
                    Database.updateExpense(
                      docId: widget.expense.id,
                      expense: Expense(
                        date: expensesDateController.text,
                        title: expensesTitleController.text,
                        expenseAmount:
                            double.tryParse(expensesAmountController.text),
                      ),
                    ),
                    Navigator.pop(context),
                    !widget.isLongPress ? Navigator.pop(context) : ''
                  },
                  child: Text("Edit"),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
