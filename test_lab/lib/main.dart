import 'package:flutter/material.dart';
import 'package:test_lab/cart.dart';
import 'package:test_lab/student.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Mainscreen(),
    );
  }
}

class Mainscreen extends StatelessWidget {
  const Mainscreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("home")),
      //builder
      body:ListView.builder(
        itemCount: students.length,
        itemBuilder:(BuildContext context,int index) => Carts(Student:  students[index]), 
        ),
    );
  }
}
List<Student> students=[
 Student(Name: "saif", Id: "211128", image: "../images/person.jpg", Address: "hebron",Phone:"0532131946"),
 Student(Name: "ahmad", Id: "202010", image: "../images/person.jpg", Address: "Anbles", Phone:"053102030"),
 
 
 Student(Name: "saif", Id: "211128", image: "../images/person.jpg", Address: "hebron",Phone:"0532131946"),
 Student(Name: "ahmad", Id: "202010", image: "../images/person.jpg", Address: "Anbles", Phone:"053102030"),
 
 Student(Name: "saif", Id: "211128", image: "../images/person.jpg", Address: "hebron",Phone:"0532131946"),
 Student(Name: "ahmad", Id: "202010", image: "../images/person.jpg", Address: "Anbles", Phone:"053102030"),
 
 Student(Name: "saif", Id: "211128", image: "../images/person.jpg", Address: "hebron",Phone:"0532131946"),
 Student(Name: "ahmad", Id: "202010", image: "../images/person.jpg", Address: "Anbles", Phone:"053102030"),
 
 Student(Name: "saif", Id: "211128", image: "../images/person.jpg", Address: "hebron",Phone:"0532131946"),
 Student(Name: "ahmad", Id: "202010", image: "../images/person.jpg", Address: "Anbles", Phone:"053102030"),
];