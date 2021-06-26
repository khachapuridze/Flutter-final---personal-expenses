import 'package:flutter/material.dart';
import 'package:flutter_learning/data/database/database.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key}) : super(key: key);
  final TextEditingController _userEditController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    // double height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Center(
        child: Container(
          width: width * 0.7,
          child: Padding(
            padding: const EdgeInsets.all(25.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/images/logo.png',
                  fit: BoxFit.fitWidth,
                  width: width * 0.6,
                ),
                SizedBox(height: 20.0),
                Container(
                  width: double.infinity,
                  padding: EdgeInsets.all(5.0),
                  decoration: BoxDecoration(
                      color: Color(0xffA8E3E8),
                      borderRadius: BorderRadius.circular(12.0)),
                  child: TextField(
                    style: TextStyle(color: Colors.black),
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.symmetric(horizontal: 10.0),
                      fillColor: Color(0xffA8E3E8),
                      filled: true,
                      border: InputBorder.none,
                      focusedBorder: InputBorder.none,
                      errorBorder: InputBorder.none,
                      disabledBorder: InputBorder.none,
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                    ),
                    keyboardType: TextInputType.text,
                    controller: _userEditController,
                  ),
                ),
                SizedBox(height: 20.0),
                Container(
                  width: double.infinity,
                  padding: EdgeInsets.all(5.0),
                  decoration: BoxDecoration(
                      color: Color(0xffA8E3E8),
                      borderRadius: BorderRadius.circular(12.0)),
                  child: TextButton(
                    onPressed: () => {
                      Database.userId = _userEditController.text,
                      Navigator.pushReplacementNamed(context, '/home')
                    },
                    style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(Color(0xffA8E3E8))),
                    child: Text(
                      "Login",
                      style: TextStyle(color: Colors.black, fontSize: 20.0),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
