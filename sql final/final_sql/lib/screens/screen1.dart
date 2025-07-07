import 'package:final_sql/functions/crud.dart';
import 'package:final_sql/functions/dialogbox.dart';
import 'package:final_sql/model/model.dart';
import 'package:final_sql/screens/screen2.dart';
import 'package:flutter/material.dart';

class Homescreen extends StatefulWidget {
  const Homescreen({super.key});

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  @override
  void initState() {
    getDB();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          dialog(context);
        },
        child: Icon(Icons.add),
      ),
      appBar: AppBar(
        centerTitle: true,
        title: Text("SQL"),
        backgroundColor: Colors.blue,
      ),
      body: ValueListenableBuilder(
        valueListenable: dbvalues,
        builder: (context, value, child) {
          return ListView.builder(
            itemCount: value.length,
            itemBuilder: (context, index) {
              final eachindex = value[index];
              return Card(
                child: ListTile(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Screen2(
                            instenceofcar: Car(
                                name: eachindex["name"],
                                model: eachindex["model"]),
                          ),
                        ));
                  },
                  title: Text(eachindex["name"]),
                  subtitle: Text(eachindex["model"]),
                  trailing:Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(onPressed: (){
                            deletedb(eachindex["id"]);
                      }, icon: Icon(Icons.delete)),
                      IconButton(onPressed: (){
                        update(context, Car(name: eachindex["name"], model: eachindex["model"],),
                        eachindex["id"]);
                      }, icon: Icon(Icons.update)),
                      


                    ],
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
