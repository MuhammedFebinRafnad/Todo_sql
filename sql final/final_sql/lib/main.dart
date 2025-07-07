import 'package:final_sql/functions/crud.dart';
import 'package:final_sql/screens/screen1.dart';
import 'package:flutter/material.dart';

void main()async{
  WidgetsFlutterBinding.ensureInitialized();
  await initializeDB();
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Homescreen()
  ));
}
