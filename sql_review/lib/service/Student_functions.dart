import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sql_review/model/student_model.dart';

// List<Map>detailsofstudent=[];

ValueNotifier<List<Map>>detailsofstudent=ValueNotifier([]);







late Database db;

Future<void>initializeDatabase()async{
  
 db=await openDatabase("Student.db",
  version: 1,
  onCreate: (db, version)async {
    await db.execute(
      " CREATE TABLE Student (id INTEGER PRIMARY KEY,name TEXT,place TEXT) "
    );
  },
  
  );
}
Future<void>getstudent()async{
  final val= await db.rawQuery("SELECT * FROM student");
  detailsofstudent.value=val;
}


Future<void>addDb(Student studentmodel)async{
  await db.rawInsert("INSERT INTO Student(name,place) VALUES (?,?)",[studentmodel.name,studentmodel.place]);
await  getstudent();
}

Future<void>updatedb(BuildContext context,Student studentnewmodel)async{
  TextEditingController studentnewname=TextEditingController();
  TextEditingController studentnewplace=TextEditingController();
  studentnewname.text=studentnewmodel.name;
  studentnewplace.text=studentnewmodel.place;
 showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          content: SizedBox(
            height: 500,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                //NAME FIELD
                TextField(
                   controller: studentnewname,
                  decoration: InputDecoration(
                      hintText: "Studentname", border: OutlineInputBorder()),
                ),
                SizedBox(
                  height: 20,
                ),

                // PLACEFIELD

                TextField(
                   controller: studentnewplace,
                  decoration: InputDecoration(
                      hintText: "Place", border: OutlineInputBorder()),
                ),
                SizedBox(
                  height: 30,
                ),

                  // BUTTON
                  
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
                         db.rawUpdate("UPDATE student SET name = ?, place = ? WHERE id = ?",
                        [studentnewname.text,studentnewplace.text,studentnewmodel.id]);
                          getstudent();
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


Future<void>deletedb(int primarykey)async{
  
  db.rawDelete("DELETE FROM student WHERE id = ?",
  [primarykey]);
  getstudent();
}

