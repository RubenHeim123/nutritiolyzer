import 'package:flutter/material.dart';
import 'package:nutritiolyzer/complaint.dart';
import 'package:nutritiolyzer/complaintClass.dart';
import 'package:nutritiolyzer/globals.dart' as globals;
import 'package:nutritiolyzer/meal.dart';

class searchPage extends StatefulWidget{
  const searchPage({Key? key}) : super(key: key);

  @override
  _searchPage createState() => _searchPage();
}

class _searchPage extends State<searchPage> {

  final controller = TextEditingController();
  List entrys = [globals.allComplaints, globals.allMeals].expand((x) => x).toList();
  List entrys2 = [globals.allComplaints, globals.allMeals].expand((x) => x).toList();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Container(
            margin: const EdgeInsets.fromLTRB(16,16,16,16),
            child: TextField(
              controller: controller,
              decoration: InputDecoration(
                prefixIcon: const Icon(Icons.search),
                hintText: 'Name',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: const BorderSide(color: Colors.black)
                )
              ),
              onChanged: searchMeal, 
            ),
          ),
          Expanded(
            child: ListView.separated(
              separatorBuilder: (BuildContext context, int index) {
              return const SizedBox(
                  height: 5,
                );
              },
              itemCount: entrys.length,
              itemBuilder: (context, index){
                final entry = entrys[index];
                if (entry.runtimeType == Complaint){
                  return ListTile(
                    leading: const CircleAvatar(
                      radius: 25,
                      backgroundColor: Colors.transparent,
                    ),
                    title: Text(entry.title),
                    onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ComplaintPage(complaint: entry, changed: false),
                      )
                    ),
                  );
                } else {
                  return ListTile(
                    leading: CircleAvatar(
                      radius: 25,
                      backgroundImage: AssetImage(
                        entry.imagePath,
                      )
                    ),
                    title: Text(entry.title),
                    onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => MealPage(meal: entry, changed: false),
                      )
                    ),
                  );
                }
              }
            ),
          )
        ]
      ),
    );
  }   
  void searchMeal(String query){
    final suggestions = entrys2.where((entry){
      final entryTitle = entry.title.toLowerCase();
      final input = query.toLowerCase();

      return entryTitle.contains(input);
    }).toList();

    setState(() => entrys = suggestions);
  }
}