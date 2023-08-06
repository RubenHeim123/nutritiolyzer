import 'package:flutter/material.dart';

class addPage extends StatefulWidget {
  const addPage({Key? key}) : super(key: key);

  @override
  _addPage createState() => _addPage();
}

class _addPage extends State<addPage>{ 

  @override
  Widget build(BuildContext context){

    final double screenHeight = MediaQuery.of(context).size.height;
    final double screenWidth = MediaQuery.of(context).size.width;

    return ListView(
      padding: const EdgeInsets.all(20),
      children: [
        Container(
          width: screenWidth,
          height: screenHeight/3-30,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage(
                "assets/images/meal.jpg"
              ), 
              fit: BoxFit.cover
            )
          ),
        ),
        const SizedBox(height: 10),
        ElevatedButton(
          onPressed: (){
            Navigator.pushNamed(
              context, 
              '/newMeal',
            );
          }, 
          child: const Text('Add new Meal'),
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.black,
            minimumSize: Size(screenWidth-30,50),               
          ),
        ),
        const SizedBox(height: 10),
          Container(
          width: screenWidth,
          height: screenHeight/3-30,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage(
                "assets/images/complaint.jpg"
              ), 
              fit: BoxFit.cover
            )
          ),
        ),
        const SizedBox(height: 10),
        ElevatedButton(
          onPressed: (){
            Navigator.pushNamed(
              context, 
              '/newComplaint',
            );
          }, 
          child: const Text('Add new Complaint'),
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.black,
            minimumSize: Size(screenWidth-30,50),               
          ),
        ),
      ],
    );
  }
}