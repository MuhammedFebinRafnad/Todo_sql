import 'package:flutter/material.dart';
import 'package:sql_review/model/student_model.dart';
import 'package:sql_review/screen/ontapscreen.dart';
import 'package:sql_review/service/Student_functions.dart';

class Screen1 extends StatefulWidget {
  const Screen1({super.key});

  @override
  State<Screen1> createState() => _Screen1State();
}

final TextEditingController namecntrl = TextEditingController();
final TextEditingController placecntl = TextEditingController();


class _Screen1State extends State<Screen1> {
  @override
  void initState() {
    getstudent();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            showthedialogbox();
          },
          backgroundColor: Colors.teal,
          child: Icon(
            Icons.add,
            color: Colors.white,
          ),
        ),
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            "SQL",
            style: TextStyle(fontSize: 30),
          ),
          backgroundColor: Colors.white,
        ),
        body: Padding(
          padding: const EdgeInsets.only(top: 10, right: 10, left: 10),
          child: ValueListenableBuilder(
            valueListenable: detailsofstudent,  
            builder: (context, details, child) {
              return ListView.builder(
                itemCount: details.length,
                itemBuilder: (context, index) {
                  final valuesofstud = details[index];
                  return Card(
                    child: ListTile(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => Ontapscreen(
                                instance: Student(
                                    name: valuesofstud["name"],
                                    place: valuesofstud["place"]),
                              ),
                            ));
                      },
                      title: Text(valuesofstud["name"]),
                      subtitle: Text(valuesofstud["place"]),
                      trailing: Row(mainAxisSize: MainAxisSize.min, children: [
                        IconButton(
                            onPressed: () {
                              deletedb(valuesofstud["id"]);
                            },
                            icon: Icon(Icons.delete)),
                        IconButton(
                            onPressed: () {
                              updatedb(
                                  context,
                                  Student(
                                      name: valuesofstud["name"],
                                      place: valuesofstud["place"],
                                      id: valuesofstud["id"]));
                            },
                            icon: Icon(Icons.update))
                      ]),
                    ),
                  );
                },
              );
            },
          ),
        ));
  }

  Future<void> showthedialogbox() async {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          content: SizedBox(
            height: 500,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextField(
                  controller: namecntrl,
                  decoration: InputDecoration(
                      hintText: "Studentname", border: OutlineInputBorder()),
                ),
    

                SizedBox(
                  height: 20,
                ),
                TextField(
                  controller: placecntl,
                  decoration: InputDecoration(
                      hintText: "Place", border: OutlineInputBorder()),
                ),
                SizedBox(
                  height: 20,
                ),
               
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: Text("back")),
                    SizedBox(
                      width: 30,
                    ),
                    ElevatedButton(
                        onPressed: () {
                          addDb(Student(
                              name: namecntrl.text, place: placecntl.text));
                          namecntrl.clear();
                          placecntl.clear();

                          Navigator.pop(context);
                        },
                        child: Text("save")),
                  ],
                )
              ],
            ),
          ),
        );
      },
    );

  }
 
}
