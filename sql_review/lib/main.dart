import 'package:flutter/material.dart';
import 'package:sql_review/screen/Screen1.dart';
import 'package:sql_review/service/Student_functions.dart';

void main()async {      
  WidgetsFlutterBinding.ensureInitialized();
  await initializeDatabase();
  
  
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home:Screen1() ,
  ));
}
