import 'package:nutritiolyzer/complaintClass.dart' as comp;
import 'package:nutritiolyzer/mealClass.dart';

var exampleDate;
var exampleUsername = 'John Doe';
var exampleGender = 'Male';
var examplePhoneNumber = '015729685137';
var exampleEmail = 'a';
int homeindex = 0;

int passwordindex = 0;
List <String> passwordText = <String>[
  '*',
  'b', 
  exampleEmail,
];

set setPassword(String newPassword){
  passwordText[1] = newPassword;
  var help='';
  for (var i = 0; i <newPassword.length;i++){
    help += '*';
  }
  passwordText[0] = help;
}

List name = [
  'Laktose',
  'Gluten',
  'Ingredient3',
  'Ingredient4',
  'Ingredient5',
  'Ingredient6',
  'Ingredient7',
  'Ingredient8',
  'Ingredient9',
  'Ingredient10',
];

List checked= [
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
];

var allComplaints = [
  comp.Complaint(
    title: 'Magenschmerzen', 
    timestamp: DateTime.now(),
    appeal: 6,
  ),
  comp.Complaint(
    title: 'Durchfall', 
    timestamp: DateTime.now(),
    appeal: 3,
  ),
  comp.Complaint(
    title: 'Erbrechen', 
    timestamp: DateTime.now(),
    appeal: 10,
  ),
];

var allEntries = [

];

var allMeals = [
  Meal(
    title: 'Tacos', 
    imagePath:  "assets/images/Tacos.jpg",
    timestamp: DateTime.now(),
    ingredient1: 12,
    ingredient2: 324,
    ingredient3: 76,
    ingredient4: 56,
    ingredient5: 112,
    ingredient6: 126,
    ingredient7: 132,
    ingredient8: 212,
    ingredient9: 122,
    ingredient10: 127,
  ),
  Meal(
    title: 'Burger', 
    imagePath:  "assets/images/Burger.jpg",
    timestamp: DateTime.now(),
    ingredient1: 12,
    ingredient2: 324,
    ingredient3: 76,
    ingredient4: 56,
    ingredient5: 112,
    ingredient6: 126,
    ingredient7: 132,
    ingredient8: 212,
    ingredient9: 122,
    ingredient10: 127,
  ),
  Meal(
    title: 'Quark-Törtchen', 
    imagePath:  "assets/images/Quark_Toertchen.jpg",
    timestamp: DateTime.now(),
    ingredient1: 12,
    ingredient2: 324,
    ingredient3: 76,
    ingredient4: 56,
    ingredient5: 112,
    ingredient6: 126,
    ingredient7: 132,
    ingredient8: 212,
    ingredient9: 122,
    ingredient10: 127,
  ),
];

var bestIngredients = [
  'Laktose',
  'Gluten',
  'Ingredient10',
  'Ingredient3',
  'Ingredient7',
];