// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, non_constant_identifier_names, unnecessary_brace_in_string_interps

import 'package:cat_app1/Screens/c++_chat.dart';
import 'package:cat_app1/Screens/c_chat.dart';
import 'package:cat_app1/Screens/css_chat.dart';
import 'package:cat_app1/Screens/dart_chat.dart';
import 'package:cat_app1/Screens/firebase_chat.dart';
import 'package:cat_app1/Screens/flutter_chat.dart';
import 'package:cat_app1/Screens/html_chat.dart';
import 'package:cat_app1/Screens/java_chat.dart';
import 'package:cat_app1/Screens/javascript_screen.dart';
import 'package:cat_app1/Screens/laravell.dart';
import 'package:cat_app1/Screens/node_chat.dart';
import 'package:cat_app1/Screens/php.dart';
import 'package:cat_app1/Screens/python_chat.dart';
import 'package:cat_app1/Screens/react_chat.dart';
import 'package:cat_app1/Screens/sql_chat.dart';
import 'package:flutter/material.dart';

class DashBoardScreen extends StatefulWidget {
  final String routeid = 'dashboard/screen';
  const DashBoardScreen({super.key});
  @override
  State<DashBoardScreen> createState() => _DashBoardScreenState();
}

class _DashBoardScreenState extends State<DashBoardScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          leading: null,
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.close),
              onPressed: () {
                // _auth.signOut();
                // Navigator.pop(context);
                // getMessages();
                // messagesstream();
              },
            ),
          ],
          title: Text('⚡️Technologies Chat'),
          backgroundColor: Colors.lightBlueAccent,
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, PythonChat().routeid);
                },
                child: Containercard(
                    "Python", "Lets discuss Python", "Python.png"),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, DartChat().routeid);
                },
                child: Containercard("Dart", "Lets discuss Dart", "Dart.jpg"),
              ),

              GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, FlutterChat().routeid);
                  },
                  child: Containercard(
                      "Flutter", "Lets discuss Flutter", "Flutter.png")),
              GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, FirebaseChat().routeid);
                },
                child: Containercard(
                    "Firebase", "Lets discuss Firebase", "Firebase.png"),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, PhpChats().routeid);
                },
                child: Containercard("Php", "Lets discuss Php", "Php.png"),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, LaravelChat().routeid);
                },
                child: Containercard(
                    "Laravel", "Lets discuss Laravel", "Laravel.png"),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, HtmlChats().routeid);
                },
                child: Containercard("Html", "Lets discuss Html", "HTML.png"),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, CssChats().routeid);
                },
                child: Containercard("Css", "Lets discuss Css", "CSS.jpg"),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, JavaSCritChat().routeid);
                },
                child: Containercard(
                    "JavaScript", "Lets discuss Javascript", "JavaScript.png"),
              ),
              GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, ReactChat().routeid);
                  },
                  child: Containercard(
                      "React", "Lets discuss React", "React.png"),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, NodeChat().routeid);
                },
                child: Containercard(
                    "Node Js", "Lets discuss Node Js", "node.png"),
              ),
              GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, JavaChat().routeid);
                  },
                  child:
                      Containercard("Java", "Lets discuss Java", "Java.jpg")),
              GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, CChat().routeid);
                },
                child: Containercard(
                    "C Programming", "Lets discuss C Programming ", "C.jpg"),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, CPlusChat().routeid);
                },
                child: Containercard("C++ ", "Lets discuss C++ ", "C++.jpg"),
              ),
              GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, SqlChat().routeid);
                  },
                  child: Containercard(
                      "SQL", "Lets discuss  SQL Queries", "SQL.jpg")),
              // Containercard("", "Lets discuss ", "node.png"),
              // Containercard("", "Lets discuss ", "node.png"),
            ],
          ),
        ));
  }

  Widget Containercard(String? title, String? subtitle, String? imagepath) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 2, horizontal: 5),
      child: Container(
          decoration: BoxDecoration(
            border: Border(
              bottom: BorderSide(
                color: Colors.black,
                width: 0.3,
              ),
            ),
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 7),
            child: Row(
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 10),
                  child: Container(
                    height: 60,
                    width: 60,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage("images/$imagepath"),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "${title}",
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w400,
                            fontSize: 20),
                      ),
                      Text("${subtitle}",
                          style: TextStyle(color: Colors.black)),
                    ],
                  ),
                )
              ],
            ),
          )),
    );
  }
}
