import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_learning/data/database/database.dart';
import 'package:flutter_learning/data/models/expenses.dart';

class AddModalBottom extends StatefulWidget {
  const AddModalBottom({
    Key? key,
  }) : super(key: key);

  @override
  _AddModalBottomState createState() => _AddModalBottomState();
}

class _AddModalBottomState extends State<AddModalBottom> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController expensesTitleController = TextEditingController();
  TextEditingController expensesAmountController = TextEditingController();
  TextEditingController expensesDateController = TextEditingController();
  @override
  Widget build(BuildContext context) {
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
              inputFormatters: <TextInputFormatter>[
                FilteringTextInputFormatter.digitsOnly
              ],
              controller: expensesAmountController,
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
                  "Pick A Date ",
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
            Container(
              alignment: Alignment.centerRight,
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
                    Database.addExpense(
                        expense: Expense(
                            title: expensesTitleController.text,
                            expenseAmount:
                                double.tryParse(expensesAmountController.text),
                            date: '12/02/100')),
                    Navigator.pop(context)
                  },
                  child: Text("Add"),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
