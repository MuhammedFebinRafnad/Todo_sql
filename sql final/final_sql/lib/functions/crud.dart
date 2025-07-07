import 'package:final_sql/model/model.dart';
import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';

ValueNotifier<List<Map>> dbvalues = ValueNotifier([]);

late Database db;
Future<void> initializeDB() async {
  db = await openDatabase(
    "car.db",
    version: 1,
    onCreate: (db, version) async {
      await db.execute(
          "CREATE TABLE Car (id INTEGER PRIMARY KEY,name TEXT,model TEXT)");
    },
  );
}

Future<void> addData(Car car) async {
  await db.rawInsert(
      "INSERT INTO Car(name,model) VALUES (?,?)",[car.name, car.model]);
  getDB();
}

Future<void> getDB() async {
  final val = await db.rawQuery("SELECT * FROM Car");
  dbvalues.value = val;
}

Future<void> update(BuildContext context, Car carUpdatedval,int id) async {
  final upname = TextEditingController();
  final upmodel = TextEditingController();


  upname.text=carUpdatedval.name;
  upmodel.text=carUpdatedval.model;

  showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        content: SizedBox(
          height: 400,
          child: Column(
            children: [
              TextField(
                controller: upname,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              TextField(
                controller: upmodel,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  ElevatedButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Text("back")),
                  ElevatedButton(
                      onPressed: () {
                        db.rawUpdate("UPDATE Car SET name = ?, model =? WHERE id  =?",
                        [upname.text,upmodel.text,id]);
                        getDB();
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

Future<void> deletedb(int int) async {
  db.rawDelete("DELETE FROM Car WHERE id = ?", [int]);
  getDB();
}
