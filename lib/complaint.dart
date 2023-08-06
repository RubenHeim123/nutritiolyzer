import 'package:flutter/material.dart';
import 'package:numberpicker/numberpicker.dart';
import 'package:nutritiolyzer/globals.dart' as globals;
import 'package:nutritiolyzer/complaintClass.dart' as compCl;

class newComplaint extends StatefulWidget{
  const newComplaint({Key? key}) : super(key: key);

  @override
  _newComplaint createState() => _newComplaint();
}

class _newComplaint extends State<newComplaint> {

  final controller = TextEditingController();
  List<compCl.Complaint> complaints = globals.allComplaints;

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
                hintText: 'Complaint name',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: const BorderSide(color: Colors.black)
                )
              ),
              onChanged: searchComplaint, 
            ),
          ),
          Expanded(
            child: ListView.separated(
              separatorBuilder: (BuildContext context, int index) {
              return const SizedBox(
                  height: 5,
                );
              },
              itemCount: complaints.length,
              itemBuilder: (context, index){
                final complaint = complaints[index];
                return ListTile(
                  title: Text(complaint.title),
                  onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ComplaintPage(complaint: complaint, changed: false),
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
          '/newComplaintPage',
        ),
        child: const Icon(Icons.add),
      ),
    );
  }   
  void searchComplaint(String query){
    final suggestions = globals.allComplaints.where((complaint){
      final complaintTitle = complaint.title.toLowerCase();
      final input = query.toLowerCase();

      return complaintTitle.contains(input);
    }).toList();

    setState(() => complaints = suggestions);
  }
}

class ComplaintPage extends StatefulWidget{
  
  final compCl.Complaint complaint;
  final title_controller = TextEditingController();
  final bool changed;

  ComplaintPage({
    Key ? key, 
    required this.complaint, 
    required this.changed,
  }) : super(key: key);

  @override
  _ComplaintPage createState() => _ComplaintPage(complaint: complaint, changed: changed);
}

class _ComplaintPage extends State<ComplaintPage> {

  final title_controller = TextEditingController();
  final compCl.Complaint complaint;
  DateTime? dateTime;
  final bool changed;


  String getText(){
    if(dateTime == null){
      return 'Select DateTime';
    } else {
      return '${complaint.timestamp.hour.toString()}:${complaint.timestamp.minute.toString()}  ${complaint.timestamp.day.toString()}.${complaint.timestamp.month.toString()}.${complaint.timestamp.year.toString()}';
    }
  }

  _ComplaintPage({
    required this.complaint,
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
        title: Text(complaint.title),
      ),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          Card(
            child: ListTile(
              title: Text(complaint.title),
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

                setState(() => complaint.title = name);
              },
            ),
          ),
          Card(
            child: ListTile(
              title: const Text('Date'),
              trailing: Text('${complaint.timestamp.hour.toString()}:${complaint.timestamp.minute.toString()}  ${complaint.timestamp.day.toString()}.${complaint.timestamp.month.toString()}.${complaint.timestamp.year.toString()}'),
              shape: const RoundedRectangleBorder(side: BorderSide(color: Colors.black)),
              onTap: () async {
                  final name = await showDialog(
                  context: context,
                  builder: (context) => StatefulBuilder(
                    builder: (context, setState) => AlertDialog(
                      title: const Text('New Date'),
                      content: ListTile(
                        onTap: () => pickDateTime(context, setState), 
                        title: Text(getText()),
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

                setState(() => complaint.timestamp = name);
              },
            ),
          ),
          Card(
            child: ListTile(
              title: const Text('Appeal'),
              trailing: Text(complaint.appeal.toString()),
              shape: const RoundedRectangleBorder(side: BorderSide(color: Colors.black)),
              onTap: () async {
                  final name = await showDialog(
                  context: context,
                  builder: (context) => StatefulBuilder(
                    builder: (
                      (context, setState) => AlertDialog(
                        title: const Text('Set Appeal'),
                        content: NumberPicker(
                          value: complaint.appeal,
                          minValue: 0,
                          maxValue: 10,
                          onChanged: (value) => setState(() => complaint.appeal = value),
                        ),
                        actions: [
                          TextButton(
                            onPressed: (){
                              this.setState((){});
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
              for (var item in globals.allComplaints) {
                if (item.title.toLowerCase() == complaint.title.toLowerCase()){
                  found = true;
                }
              }
              if (found && (changed == false)){
                globals.allEntries.add(complaint); 
                globals.allEntries.sort((a,b) => b.timestamp.compareTo(a.timestamp));               
              } else if (found && changed){
                globals.allEntries.sort((a,b) => b.timestamp.compareTo(a.timestamp));
              } else if ((found == false) && (changed == false)){
                globals.allEntries.add(complaint);
                globals.allComplaints.add(complaint);
                globals.allEntries.sort((a,b) => b.timestamp.compareTo(a.timestamp));
              } else if ((found == false) && changed){
                globals.allComplaints.add(complaint);
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
      complaint.timestamp = dateTime!;
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