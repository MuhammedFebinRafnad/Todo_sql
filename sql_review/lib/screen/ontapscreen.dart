import 'package:flutter/material.dart';
import 'package:sql_review/model/student_model.dart';


class Ontapscreen extends StatelessWidget {
  Student instance;
  Ontapscreen({super.key, required this.instance});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber,
        title:Text(instance.name),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              
              maxRadius:60,
              backgroundImage: NetworkImage(
                  "https://plus.unsplash.com/premium_photo-1689568126014-06fea9d5d341?w=600&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MXx8cHJvZmlsZXxlbnwwfHwwfHx8MA%3D%3D"),
            ),
            SizedBox(
             height: 20,
            ),
            Text("Name:${instance.name}"),
            Text("Place:${instance.place}"),
            SizedBox(
              height: 30,
            ),
            ElevatedButton(onPressed: (){
              Navigator.pop(context);
            }, child: Text("Back"))
          ],
        ),
      ),
    );
  }
}
