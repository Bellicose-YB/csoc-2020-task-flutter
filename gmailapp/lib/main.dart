
import 'package:flutter/material.dart';
import 'package:gmailapp/app_screens/emaillist.dart';

//import 'app_screens/emaillist.dart';
void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    
    return MaterialApp(
      title: 'Gmail_App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          primarySwatch: Colors.grey
      ),
      home: MailList(),
    );
  }
}