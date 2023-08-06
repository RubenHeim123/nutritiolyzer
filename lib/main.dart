import 'package:flutter/material.dart';
import 'package:nutritiolyzer/changePassword.dart';
import 'package:nutritiolyzer/login.dart';
import 'package:nutritiolyzer/home.dart';
import 'package:nutritiolyzer/register.dart';
import 'package:nutritiolyzer/meal.dart';
import 'package:nutritiolyzer/complaint.dart';
import 'package:nutritiolyzer/complaintClass.dart';
import 'package:nutritiolyzer/mealClass.dart';
import 'package:nutritiolyzer/start.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Nutritiolyzer',
      theme: ThemeData(
        primarySwatch: Colors.green
      ),
      //home: Login(),
      initialRoute: '/',
      routes: {
        '/':(context) => const Login(),
        '/loginpage': (context) => const LoginPage(),
        '/registerpage': (context) => const RegisterPage(),
        '/homepage': (context) => const homePage(), 
        '/changepassword2': (context) => const changePassword2(),
        '/changepassword': (context) => const changePassword(),
        '/newMeal': (context) => const newMeal(),
        '/newComplaint': (context) => const newComplaint(),
        '/newComplaintPage': (context) => ComplaintPage(
          complaint: Complaint(
            title: 'New Complaint', 
            timestamp: DateTime.now(),
            appeal: 0,
          ),
          changed: false,
        ),
        '/newMealPage': (context) => MealPage(
          meal: Meal(
            title: 'New Meal', 
            imagePath:  "assets/images/grey.png",
            timestamp: DateTime.now(),
            ingredient1: 0,
            ingredient2: 0,
            ingredient3: 0,
            ingredient4: 0,
            ingredient5: 0,
            ingredient6: 0,
            ingredient7: 0,
            ingredient8: 0,
            ingredient9: 0,
            ingredient10: 0,
          ),
          changed: false,
        ),
        '/startPage': (context) => const startPage(),
      },
    );
  }
}