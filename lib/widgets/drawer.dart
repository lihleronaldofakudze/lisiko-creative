import 'package:flutter/material.dart';
import 'package:lisiko_creative/services/auth.dart';

Drawer drawer (BuildContext context) {
  return Drawer(
    child: Column(
      children: [
        DrawerHeader(
          child: Column(
            children: [
              Container(
                width: double.infinity,
                height: 100,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/images/one.png')
                  )
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                  'Lisiko Creative (PTY) Ltd',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18
                  ),
              )
            ],
          ),
        ),
        GestureDetector(
          onTap: () {

          },
          child: Container(
            padding: EdgeInsets.all(8),
            child: Row(
              children: [
                IconButton(
                  onPressed: () {},
                  icon: Icon(
                      Icons.person
                  ),
                ),
                SizedBox(
                  width: 30,
                ),
                Expanded(
                  child: Text(
                    'Profile',
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
        Container(
          padding: EdgeInsets.all(8),
          child: Row(
            children: [
              IconButton(
                onPressed: () {},
                icon: Icon(
                    Icons.label_important
                ),
              ),
              SizedBox(
                width: 30,
              ),
              Expanded(
                child: Text(
                  'About Us',
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold
                  ),
                ),
              )
            ],
          ),
        ),
        GestureDetector(
          onTap: () {
            showDialog(
              context: context,
              builder: (context) => AlertDialog(
                title: Text(
                  'Lisiko Creative',
                  style: TextStyle(
                      fontWeight: FontWeight.bold
                  ),
                ),
                content: Text(
                  'Are you sure you want to exit?',
                  style: TextStyle(
                      fontWeight: FontWeight.bold
                  ),
                ),
                actions: [
                  TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text(
                      'No',
                      style: TextStyle(
                          fontWeight: FontWeight.bold
                      ),
                    ),
                  ),
                  TextButton(
                    onPressed: () async {
                      await AuthService().logOut().then((value) => Navigator.pushNamed(context, '/'));
                    },
                    child: Text(
                      'Yes',
                      style: TextStyle(
                        fontWeight: FontWeight.bold
                      ),
                    ),
                  )
                ],
              )
            );
          },
          child: Container(
            padding: EdgeInsets.all(8),
            child: Row(
              children: [
                IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.close
                  ),
                ),
                SizedBox(
                  width: 30,
                ),
                Expanded(
                  child: Text(
                    'Log Out',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ],
    ),
  );
}