import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:lisiko_creative/models/user.dart';
import 'package:lisiko_creative/screens/add_agenda.dart';
import 'package:lisiko_creative/screens/admin_login.dart';
import 'package:lisiko_creative/screens/agenda.dart ';
import 'package:lisiko_creative/screens/comments.dart';
import 'package:lisiko_creative/screens/home.dart';
import 'package:lisiko_creative/screens/login.dart';
import 'package:lisiko_creative/screens/register.dart';
import 'package:lisiko_creative/screens/wrapper.dart';
import 'package:lisiko_creative/services/auth.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return StreamProvider<UserModel>.value(
        value: AuthService().user,
        initialData: null,
        child: MaterialApp(
          routes: {
            '/': (context) => Wrapper(),
            '/home': (context) => Home(),
            '/login': (context) => Login(),
            '/register': (context) => Register(),
            '/agenda': (context) => Agenda(),
            '/add_agenda': (context) => AddAgenda(),
            '/admin_login': (context) => AdminLogin(),
            '/comments': (context) => Comments()
          },
          title: 'Lisiko Creative PTY',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            fontFamily: 'Nunito',
            visualDensity: VisualDensity.adaptivePlatformDensity,
            primarySwatch: Colors.blue,
          ),
        ));
  }
}
