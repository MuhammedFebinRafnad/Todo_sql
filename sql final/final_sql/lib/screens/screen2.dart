import 'package:final_sql/model/model.dart';
import 'package:flutter/material.dart';

class Screen2 extends StatelessWidget {
  Car instenceofcar;
   Screen2({super.key,required this.instenceofcar});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber,
        title:Text(instenceofcar.name),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              
              maxRadius:60,
             
            ),
            SizedBox(
             height: 20,
            ),
            Text("Name:${instenceofcar.name}"),
            Text("Place:${instenceofcar.model}"),
            SizedBox(
              height: 30,
            ),
            ElevatedButton(onPressed: (){
              Navigator.pop(context);
            }, child: Text("Back"))
          ],
        ),
      ),
    );  }
}