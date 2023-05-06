import 'package:flutter/material.dart';
import 'package:to_do_list/Home.dart';

void main() {
  runApp(
    MaterialApp(
      home: HomePage(),
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.teal),
    )
  );  
}