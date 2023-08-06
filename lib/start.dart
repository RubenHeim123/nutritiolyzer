import 'package:flutter/material.dart';
import 'package:nutritiolyzer/complaint.dart';
import 'package:nutritiolyzer/globals.dart' as globals;
import 'package:nutritiolyzer/complaintClass.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:nutritiolyzer/meal.dart';
import 'package:nutritiolyzer/mealClass.dart';

class startPage extends StatefulWidget {
  const startPage({Key? key}) : super(key: key);

  @override
  State<startPage> createState() => _startPage();
}

class _startPage extends State<startPage>{

  @override
  Widget build(BuildContext context){
    return ListView.separated(
      separatorBuilder: (BuildContext context, int index) {
      return const SizedBox(
          height: 5,
        );
      },
      itemCount: globals.allEntries.length,
      itemBuilder: (context, index){
        final entry = globals.allEntries[index];
        if (entry.runtimeType == Complaint){
          return Slidable(
            endActionPane: ActionPane(
              motion: const DrawerMotion(), 
              children: [
                SlidableAction(
                  onPressed: (BuildContext context){
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ComplaintPage(complaint: entry, changed: true),
                       )
                    );
                  },
                  backgroundColor: Colors.green,
                  foregroundColor: Colors.white,
                  icon: Icons.edit,
                  label: 'Edit',
                ),
                SlidableAction(
                  onPressed: (BuildContext context){
                    var help = Complaint(  
                      appeal: entry.appeal,
                      timestamp: entry.timestamp, 
                      title: entry.title
                    );
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ComplaintPage(complaint: help, changed: false),
                      )
                    );
                  },
                  backgroundColor: Colors.blue,
                  foregroundColor: Colors.white,
                  icon: Icons.copy,
                  label: 'Copy',
                ),
                SlidableAction(
                  onPressed: (BuildContext context){
                    setState(() {
                      globals.allEntries.remove(entry);
                    });
                  },
                  backgroundColor: Colors.red,
                  foregroundColor: Colors.white,
                  icon: Icons.delete,
                  label: 'Delete',
                ),
              ]
            ),
            child: ListTile(
              leading: const CircleAvatar(
                radius: 25,
                backgroundColor: Colors.transparent,
              ),
              title: Text(entry.title),
              subtitle: Text('${entry.timestamp.hour.toString()}:${entry.timestamp.minute.toString()}  ${entry.timestamp.day.toString()}.${entry.timestamp.month.toString()}.${entry.timestamp.year.toString()}'),
            )
          );
        } else {
          return Slidable(
            endActionPane: ActionPane(
              motion: const DrawerMotion(), 
              children: [
                SlidableAction(
                  onPressed: (BuildContext context){
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => MealPage(meal: entry, changed: true),
                      )
                    );
                  },
                  backgroundColor: Colors.green,
                  foregroundColor: Colors.white,
                  icon: Icons.edit,
                  label: 'Edit',
                ),
                SlidableAction(
                  onPressed: (BuildContext context){
                    var help = Meal(  
                      imagePath: entry.imagePath, 
                      timestamp: entry.timestamp, 
                      title: entry.title, 
                      ingredient1: entry.ingredient1,
                      ingredient2: entry.ingredient2,
                      ingredient3: entry.ingredient3,
                      ingredient4: entry.ingredient4,
                      ingredient5: entry.ingredient5,
                      ingredient6: entry.ingredient6,
                      ingredient7: entry.ingredient7,
                      ingredient8: entry.ingredient8,
                      ingredient9: entry.ingredient9,
                      ingredient10: entry.ingredient10,
                    );
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => MealPage(meal: help, changed: false),
                      )
                    );
                  },
                  backgroundColor: Colors.blue,
                  foregroundColor: Colors.white,
                  icon: Icons.copy,
                  label: 'Copy',
                ),
                SlidableAction(
                  onPressed: (BuildContext context){
                    setState(() {
                      globals.allEntries.remove(entry);
                    });
                  },
                  backgroundColor: Colors.red,
                  foregroundColor: Colors.white,
                  icon: Icons.delete,
                  label: 'Delete',
                ),
              ]
            ),
            child: ListTile(
              leading: CircleAvatar(
                radius: 25,
                backgroundImage: AssetImage(
                entry.imagePath,
                )
              ),
              title: Text(entry.title),
              subtitle: Text('${entry.timestamp.hour.toString()}:${entry.timestamp.minute.toString()}  ${entry.timestamp.day.toString()}.${entry.timestamp.month.toString()}.${entry.timestamp.year.toString()}'),
            )
          );          
        }
      } 
    );
  }

} 