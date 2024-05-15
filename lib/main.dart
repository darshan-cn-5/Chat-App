// ignore_for_file: prefer_const_constructors, deprecated_member_use, non_constant_identifier_names

import 'package:cat_app1/Screens/c++_chat.dart';
import 'package:cat_app1/Screens/c_chat.dart';
import 'package:cat_app1/Screens/chat_screen.dart';
import 'package:cat_app1/Screens/css_chat.dart';
import 'package:cat_app1/Screens/dart_chat.dart';
import 'package:cat_app1/Screens/dashboard_screen.dart';
import 'package:cat_app1/Screens/firebase_chat.dart';
import 'package:cat_app1/Screens/flutter_chat.dart';
import 'package:cat_app1/Screens/html_chat.dart';
import 'package:cat_app1/Screens/java_chat.dart';
import 'package:cat_app1/Screens/javascript_screen.dart';
import 'package:cat_app1/Screens/laravell.dart';
import 'package:cat_app1/Screens/login_screen.dart';
import 'package:cat_app1/Screens/node_chat.dart';
import 'package:cat_app1/Screens/php.dart';
import 'package:cat_app1/Screens/python_chat.dart';
import 'package:cat_app1/Screens/react_chat.dart';
import 'package:cat_app1/Screens/register_screen.dart';
import 'package:cat_app1/Screens/sql_chat.dart';
import 'package:cat_app1/Screens/welcome_screen.dart';
import 'package:cat_app1/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData.dark().copyWith(
          textTheme: TextTheme(
            bodyText1: TextStyle(color: Colors.black54),
          ),
        ),
        debugShowCheckedModeBanner: false,
        initialRoute: LoginScreen.route,
        routes: {
          CChat().routeid: (context) => CChat(),
          CPlusChat().routeid: (context) => CPlusChat(),
          JavaChat().routeid: (context) => JavaChat(),
          SqlChat().routeid: (context) => SqlChat(),
          ReactChat().routeid: (context) => ReactChat(),
          NodeChat().routeid: (context) => NodeChat(),
          CssChats().routeid: (context) => CssChats(),
          DartChat().routeid: (context) => DartChat(),
          FirebaseChat().routeid: (context) => FirebaseChat(),
          FlutterChat().routeid: (context) => FlutterChat(),
          HtmlChats().routeid: (context) => HtmlChats(),
          JavaSCritChat().routeid: (context) => JavaSCritChat(),
          LaravelChat().routeid: (context) => LaravelChat(),
          PhpChats().routeid: (context) => PhpChats(),
          PythonChat().routeid: (context) => PythonChat(),
          DashBoardScreen().routeid: (context) => DashBoardScreen(),
          WelcomeScreen.route: (Context) => WelcomeScreen(),
          LoginScreen.route: (context) => LoginScreen(),
          RegistrationScreen.route: (context) => RegistrationScreen(),
          ChatScreen.route: (context) => ChatScreen(),
        });
  }
}
