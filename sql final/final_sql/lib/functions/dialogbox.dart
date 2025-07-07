import 'package:final_sql/functions/crud.dart';
import 'package:final_sql/model/model.dart';
import 'package:flutter/material.dart';

void dialog( BuildContext context,) {
  final name = TextEditingController();
  final model = TextEditingController();
  showDialog( context: context, builder: (context) {
      return AlertDialog(
        content: SizedBox(
          height: 400,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                controller: name,
                decoration: InputDecoration(
                    border: OutlineInputBorder(), hintText: "Name of the car"),
              ),
              SizedBox(
                height: 20,
              ),
              TextField(
                controller: model,
                decoration: InputDecoration(
                    border: OutlineInputBorder(), hintText: "model of car"),
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
                        width: 20,
                      ),
                  ElevatedButton(
                      onPressed: () {
                        addData(Car(name: name.text, model: model.text));
                        name.clear();
                        model.clear();
                        Navigator.pop(context);
                      },
                      child: Text("save"))
                ],
              ),
            ],
          ),
        ),
      );
    },
  );
}
