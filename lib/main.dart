import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_learning/data/repositories/expenses_repo.dart';

import 'package:flutter_learning/presentation/router/app_routers.dart';

import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: ExpenseRepository(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          scaffoldBackgroundColor: const Color(0xFFFFFFFF),
          // Define the default brightness and colors.
          primaryColor: Color(0xff95d3c4),
          accentColor: Color(0xff95d3c4),

          // Define the default font family.
          // fontFamily: GoogleFonts.poppins(textStyle:),
        ),
        title: 'flutter todo - firebase',
        onGenerateRoute: AppRouter().onGenerateRoute,
      ),
    );
  }
}
