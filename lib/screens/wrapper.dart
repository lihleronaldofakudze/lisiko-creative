import 'package:flutter/material.dart';
import 'package:lisiko_creative/models/user.dart';
import 'package:lisiko_creative/screens/home.dart';
import 'package:lisiko_creative/screens/login.dart';
import 'package:provider/provider.dart';

class Wrapper extends StatelessWidget {
  const Wrapper({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserModel>(context);
    return user == null ? Login() : Home();
  }
}
