import 'package:flutter/material.dart';
import 'package:numberpicker/numberpicker.dart';
import 'package:nutritiolyzer/globals.dart' as globals;
import 'package:nutritiolyzer/mealClass.dart' as compCl;

class newMeal extends StatefulWidget{
  const newMeal({Key? key}) : super(key: key);

  @override
  _newMeal createState() => _newMeal();
}

class _newMeal extends State<newMeal> {

  final controller = TextEditingController();
  List<compCl.Meal> meals = globals.allMeals;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          Padding(padding: const EdgeInsets.only(right: 20), 
            child: ElevatedButton(
              onPressed: (){
                  Navigator.popUntil(
                    context,
                    ModalRoute.withName('/'),
                  );
              }, 
              child: const Text(
                'Logout',
                style: TextStyle(
                  color: Colors.white,
                ),
              )
            )
          )
        ],
      ),
      body: Column(
        children: <Widget>[
          Container(
            margin: const EdgeInsets.fromLTRB(16,16,16,16),
            child: TextField(
              controller: controller,
              decoration: InputDecoration(
                prefixIcon: const Icon(Icons.search),
                hintText: 'Meal name',
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
              itemCount: meals.length,
              itemBuilder: (context, index){
                final meal = meals[index];
                return ListTile(
                  leading: CircleAvatar(
                    radius: 25,
                    backgroundImage: AssetImage(
                      meal.imagePath,
                    )
                  ),
                  title: Text(meal.title),
                  onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => MealPage(meal: meal, changed: false)
                    )
                  ),
                );
              }
            ),
          )
        ]
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.pushNamed(
          context,
          '/newMealPage',
        ),
        child: const Icon(Icons.add),
      ),
    );
  }   
  void searchMeal(String query){
    final suggestions = globals.allMeals.where((meal){
      final mealTitle = meal.title.toLowerCase();
      final input = query.toLowerCase();

      return mealTitle.contains(input);
    }).toList();

    setState(() => meals = suggestions);
  }
}

class MealPage extends StatefulWidget{
  
  final compCl.Meal meal;
  final title_controller = TextEditingController();
  final bool changed;

  MealPage({
    Key ? key, 
    required this.meal,
    required this.changed,
  }) : super(key: key);

  @override
  _MealPage createState() => _MealPage(meal: meal, changed: changed);
}

class _MealPage extends State<MealPage> {

  final title_controller = TextEditingController();
  final compCl.Meal meal;
  DateTime? dateTime;
  final bool changed;

  String getText(){
    if(dateTime == null){
      return 'Select DateTime';
    } else {
      return '${meal.timestamp.hour.toString()}:${meal.timestamp.minute.toString()}  ${meal.timestamp.day.toString()}.${meal.timestamp.month.toString()}.${meal.timestamp.year.toString()}';
    }
  }

  _MealPage({
    required this.meal,
    required this.changed,
  });

  @override
  Widget build(BuildContext context) {

    final double screenWidth = MediaQuery.of(context).size.width; 

    return Scaffold(
      appBar: AppBar(
        actions: [
          Padding(padding: const EdgeInsets.only(right: 20), 
            child: ElevatedButton(
              onPressed: (){
                  Navigator.popUntil(
                    context,
                    ModalRoute.withName('/'),
                  );
              }, 
              child: const Text(
                'Logout',
                style: TextStyle(
                  color: Colors.white,
                ),
              )
            )
          )
        ],
        title: Text(meal.title),
      ),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          Image.asset(
            meal.imagePath,
            width: double.infinity,
            height: 300,
            fit: BoxFit.cover,
          ),
          Card(
            child: ListTile(
              title: Text(meal.title),
              shape: const RoundedRectangleBorder(side: BorderSide(color: Colors.black)),
              onTap: () async {
                  final name = await showDialog(
                  context: context,
                  builder: (context) => StatefulBuilder(
                    builder: (
                      (context, setState) => AlertDialog(
                        title: const Text('New Title'),
                        content: TextField(
                          autofocus: true,
                          decoration: const InputDecoration(
                            hintText: 'Enter new title',
                          ),
                          controller: title_controller,
                        ),
                        actions: [
                          TextButton(
                            onPressed: (){
                              Navigator.of(context).pop(title_controller.text);
                              title_controller.clear();
                            },
                            child: const Text('SUBMIT')
                          )
                        ],
                      )
                    )
                  ),
                );
                if(name==null ||name.isEmpty) return;

                setState(() => meal.title = name);
              },
            ),
          ),
          Card(
            child: ListTile(
              title: const Text('Date'),
              trailing: Text('${meal.timestamp.hour.toString()}:${meal.timestamp.minute.toString()}  ${meal.timestamp.day.toString()}.${meal.timestamp.month.toString()}.${meal.timestamp.year.toString()}'),
              shape: const RoundedRectangleBorder(side: BorderSide(color: Colors.black)),
              onTap: () async {
                  final name = await showDialog(
                  context: context,
                  builder: (context) => StatefulBuilder(
                    builder: (context, setState) => AlertDialog(
                      title: const Text('New Date'),
                      content: ListTile(
                        onTap: () => pickDateTime(context, setState), 
                        title: Text(
                          getText(),
                        ),
                        shape: const Border(
                          bottom: BorderSide(width: 2, color: Colors.green)
                        ),
                      ),
                      actions: [
                        TextButton(
                          onPressed: (){Navigator.of(context).pop(title_controller.text);},
                          child: const Text('SUBMIT')
                        )
                      ],
                    ),
                  )
                );
                if(name==null ||name.isEmpty) return;

                setState(() => meal.timestamp = name);
              },
            ),
          ),
          Card(
            child: ListTile(
              title: Text(globals.name[0]),
              trailing: Text('${meal.ingredient1.toString()} g'),
              shape: const RoundedRectangleBorder(side: BorderSide(color: Colors.black)),
              onTap: () async {
                  final name = await showDialog(
                  context: context,
                  builder: (context) => StatefulBuilder(
                    builder: (
                      (context, setState) => AlertDialog(
                        title: const Text('Set Weight'),
                        content: NumberPicker(
                          value: meal.ingredient1,
                          minValue: 0,
                          maxValue: 1000,
                          onChanged: (value) => setState(() => meal.ingredient1 = value),
                        ),
                        actions: [
                          TextButton(
                            onPressed: (){
                              this.setState(() {});
                              Navigator.of(context).pop();
                            },
                            child: const Text('SUBMIT')
                          )
                        ],
                      )
                    )
                  ),
                );
              },
            ),
          ),
          Card(
            child: ListTile(
              title: Text(globals.name[1]),
              trailing: Text('${meal.ingredient2.toString()} g'),
              shape: const RoundedRectangleBorder(side: BorderSide(color: Colors.black)),
              onTap: () async {
                  final name = await showDialog(
                  context: context,
                  builder: (context) => StatefulBuilder(
                    builder: (
                      (context, setState) => AlertDialog(
                        title: const Text('Set Weight'),
                        content: NumberPicker(
                          value: meal.ingredient2,
                          minValue: 0,
                          maxValue: 1000,
                          onChanged: (value) => setState(() => meal.ingredient2 = value),
                        ),
                        actions: [
                          TextButton(
                            onPressed: (){
                              this.setState(() {});
                              Navigator.of(context).pop();
                            },
                            child: const Text('SUBMIT')
                          )
                        ],
                      )
                    )
                  ),
                );
              },
            ),
          ),
          Card(
            child: ListTile(
              title: Text(globals.name[2]),
              trailing: Text('${meal.ingredient3.toString()} g'),
              shape: const RoundedRectangleBorder(side: BorderSide(color: Colors.black)),
              onTap: () async {
                  final name = await showDialog(
                  context: context,
                  builder: (context) => StatefulBuilder(
                    builder: (
                      (context, setState) => AlertDialog(
                        title: const Text('Set Weight'),
                        content: NumberPicker(
                          value: meal.ingredient3,
                          minValue: 0,
                          maxValue: 1000,
                          onChanged: (value) => setState(() => meal.ingredient3 = value),
                        ),
                        actions: [
                          TextButton(
                            onPressed: (){
                              this.setState(() {});
                              Navigator.of(context).pop();
                            },
                            child: const Text('SUBMIT')
                          )
                        ],
                      )
                    )
                  ),
                );
              },
            ),
          ),
          Card(
            child: ListTile(
              title: Text(globals.name[3]),
              trailing: Text('${meal.ingredient4.toString()} g'),
              shape: const RoundedRectangleBorder(side: BorderSide(color: Colors.black)),
              onTap: () async {
                  final name = await showDialog(
                  context: context,
                  builder: (context) => StatefulBuilder(
                    builder: (
                      (context, setState) => AlertDialog(
                        title: const Text('Set Weight'),
                        content: NumberPicker(
                          value: meal.ingredient4,
                          minValue: 0,
                          maxValue: 1000,
                          onChanged: (value) => setState(() => meal.ingredient4 = value),
                        ),
                        actions: [
                          TextButton(
                            onPressed: (){
                              this.setState(() {});
                              Navigator.of(context).pop();
                            },
                            child: const Text('SUBMIT'),
                          ),
                        ],
                      )
                    )
                  ),
                );
              },
            ),
          ),
          Card(
            child: ListTile(
              title: Text(globals.name[4]),
              trailing: Text('${meal.ingredient5.toString()} g'),
              shape: const RoundedRectangleBorder(side: BorderSide(color: Colors.black)),
              onTap: () async {
                  final name = await showDialog(
                  context: context,
                  builder: (context) => StatefulBuilder(
                    builder: (
                      (context, setState) => AlertDialog(
                        title: const Text('Set Weight'),
                        content: NumberPicker(
                          value: meal.ingredient5,
                          minValue: 0,
                          maxValue: 1000,
                          onChanged: (value) => setState(() => meal.ingredient5 = value),
                        ),
                        actions: [
                          TextButton(
                            onPressed: (){
                              this.setState(() {});
                              Navigator.of(context).pop();
                            },
                            child: const Text('SUBMIT')
                          )
                        ],
                      )
                    )
                  ),
                );
              },
            ),
          ),
          Card(
            child: ListTile(
              title: Text(globals.name[5]),
              trailing: Text('${meal.ingredient6.toString()} g'),
              shape: const RoundedRectangleBorder(side: BorderSide(color: Colors.black)),
              onTap: () async {
                  final name = await showDialog(
                  context: context,
                  builder: (context) => StatefulBuilder(
                    builder: (
                      (context, setState) => AlertDialog(
                        title: const Text('Set Weight'),
                        content: NumberPicker(
                          value: meal.ingredient6,
                          minValue: 0,
                          maxValue: 1000,
                          onChanged: (value) => setState(() => meal.ingredient6 = value),
                        ),
                        actions: [
                          TextButton(
                            onPressed: (){
                              this.setState(() {});
                              Navigator.of(context).pop();
                            },
                            child: const Text('SUBMIT')
                          )
                        ],
                      )
                    )
                  ),
                );
              },
            ),
          ),
          Card(
            child: ListTile(
              title: Text(globals.name[6]),
              trailing: Text('${meal.ingredient7.toString()} g'),
              shape: const RoundedRectangleBorder(side: BorderSide(color: Colors.black)),
              onTap: () async {
                  final name = await showDialog(
                  context: context,
                  builder: (context) => StatefulBuilder(
                    builder: (
                      (context, setState) => AlertDialog(
                        title: const Text('Set Weight'),
                        content: NumberPicker(
                          value: meal.ingredient7,
                          minValue: 0,
                          maxValue: 1000,
                          onChanged: (value) => setState(() => meal.ingredient7 = value),
                        ),
                        actions: [
                          TextButton(
                            onPressed: (){
                              this.setState(() {});
                              Navigator.of(context).pop();
                            },
                            child: const Text('SUBMIT')
                          )
                        ],
                      )
                    )
                  ),
                );
              },
            ),
          ),
          Card(
            child: ListTile(
              title: Text(globals.name[7]),
              trailing: Text('${meal.ingredient8.toString()} g'),
              shape: const RoundedRectangleBorder(side: BorderSide(color: Colors.black)),
              onTap: () async {
                  final name = await showDialog(
                  context: context,
                  builder: (context) => StatefulBuilder(
                    builder: (
                      (context, setState) => AlertDialog(
                        title: const Text('Set Weight'),
                        content: NumberPicker(
                          value: meal.ingredient8,
                          minValue: 0,
                          maxValue: 1000,
                          onChanged: (value) => setState(() => meal.ingredient8 = value),
                        ),
                        actions: [
                          TextButton(
                            onPressed: (){
                              this.setState(() {});
                              Navigator.of(context).pop();
                            },
                            child: const Text('SUBMIT')
                          )
                        ],
                      )
                    )
                  ),
                );
              },
            ),
          ),
          Card(
            child: ListTile(
              title: Text(globals.name[8]),
              trailing: Text('${meal.ingredient9.toString()} g'),
              shape: const RoundedRectangleBorder(side: BorderSide(color: Colors.black)),
              onTap: () async {
                  final name = await showDialog(
                  context: context,
                  builder: (context) => StatefulBuilder(
                    builder: (
                      (context, setState) => AlertDialog(
                        title: const Text('Set Weight'),
                        content: NumberPicker(
                          value: meal.ingredient9,
                          minValue: 0,
                          maxValue: 1000,
                          onChanged: (value) => setState(() => meal.ingredient9 = value),
                        ),
                        actions: [
                          TextButton(
                            onPressed: (){
                              this.setState(() {});
                              Navigator.of(context).pop();
                            },
                            child: const Text('SUBMIT')
                          )
                        ],
                      )
                    )
                  ),
                );
              },
            ),
          ),
          Card(
            child: ListTile(
              title: Text(globals.name[9]),
              trailing: Text('${meal.ingredient10.toString()} g'),
              shape: const RoundedRectangleBorder(side: BorderSide(color: Colors.black)),
              onTap: () async {
                  final name = await showDialog(
                  context: context,
                  builder: (context) => StatefulBuilder(
                    builder: (
                      (context, setState) => AlertDialog(
                        title: const Text('Set Weight'),
                        content: NumberPicker(
                          value: meal.ingredient10,
                          minValue: 0,
                          maxValue: 1000,
                          onChanged: (value) => setState(() => meal.ingredient10 = value),
                        ),
                        actions: [
                          TextButton(
                            onPressed: (){
                              this.setState(() {});
                              Navigator.of(context).pop();
                            },
                            child: const Text('SUBMIT')
                          )
                        ],
                      )
                    )
                  ),
                );
              },
            ),
          ),
          ElevatedButton(
            onPressed: (){
              var found = false;
              for (var item in globals.allMeals) {
                if (item.title.toLowerCase() == meal.title.toLowerCase()){
                  found = true;
                }
              }
              if (found && (changed == false)){
                globals.allEntries.add(meal);                 
                globals.allEntries.sort((a,b) => b.timestamp.compareTo(a.timestamp));
              } else if (found && changed){
                globals.allEntries.sort((a,b) => b.timestamp.compareTo(a.timestamp));
              } else if ((found == false) && (changed == false)){
                globals.allEntries.add(meal);
                globals.allMeals.add(meal);
                globals.allEntries.sort((a,b) => b.timestamp.compareTo(a.timestamp));
              } else if ((found == false) && changed){
                globals.allMeals.add(meal);
                globals.allEntries.sort((a,b) => b.timestamp.compareTo(a.timestamp));
              }
              setState(() {
                globals.homeindex = 0;
              });
              Navigator.pushNamed(
                context,
                '/homepage',
              );
            }, 
            child: const Text('Save'),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.black,
              minimumSize: Size(screenWidth/2-30,50),
            ),
          )
        ]
      ),
    );
  }

  Future pickDateTime(BuildContext context, setState) async{
    final date = await pickDate(context);
    if (date == null) return;

    final time = await pickTime(context);
    if (time == null) return;

    setState((){
      dateTime = DateTime(
        date.year,
        date.month,
        date.day,
        time.hour,
        time.minute,
      );
      meal.timestamp = dateTime!;
      this.setState(() {});
    });
  }

  Future<DateTime?> pickDate(BuildContext context) async{
    final initialDate = DateTime.now();
    final newDate = await showDatePicker(
      context: context, 
      initialDate: dateTime ?? initialDate, 
      firstDate: DateTime(DateTime.now().year - 150), 
      lastDate: DateTime.now(),
    ); 

    if (newDate == null) return null;     

    return newDate;
  }

  Future<TimeOfDay?> pickTime(BuildContext context) async{
    const initialTime = TimeOfDay(hour: 9, minute: 0);
    final newTime = await showTimePicker(
      context: context, 
      initialTime: dateTime != null
          ? TimeOfDay(hour: dateTime!.hour, minute: dateTime!.minute)
          : initialTime,
    );

    if (newTime == null) return null;

    return newTime;
  }
}