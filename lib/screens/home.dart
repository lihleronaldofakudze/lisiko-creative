import 'package:flutter/material.dart';
import 'package:lisiko_creative/models/agenda.dart';
import 'package:lisiko_creative/models/user.dart';
import 'package:lisiko_creative/services/database.dart';
import 'package:lisiko_creative/widgets/drawer.dart';
import 'package:lisiko_creative/widgets/post_list.dart';
import 'package:provider/provider.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserModel>(context);
    return StreamProvider<List<Agenda>>.value(
      value: DatabaseService().agendas,
      initialData: [],
      child: StreamBuilder<UsersModel>(
        stream: DatabaseService(uid: user.uid).userData,
        builder: (context, snapshot) {
          UsersModel users = snapshot.data;
          if (snapshot.hasData) {
            return Scaffold(
              drawer: drawer(context),
              appBar: AppBar(
                title: Text(
                    'Lisiko Create (PTY) Ltd'
                ),
                actions: [
                  users.role == 'admin' ? IconButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/add_agenda');
                    },
                    icon: Icon(
                      Icons.add,
                      color: Colors.white,
                    ),
                  ) : Text('')
                ],
              ),
              body: DecoratedBox(
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('assets/images/one.png')
                    )
                ),
                child: DecoratedBox(
                  decoration: BoxDecoration(
                      color: Color.fromRGBO(255, 255, 255, .8)
                  ),
                  child: Expanded(
                    child: PostList(),
                  ),
                ),
              ),
            );
          } else {
            return Scaffold(
              body: Container(
                width: double.infinity,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'Lisiko Creative',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    CircularProgressIndicator(),
                    SizedBox(
                      height: 15,
                    ),
                    Text(
                      'Please wait still fetching data...',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18
                      ),
                    )
                  ],
                ),
              ),
            );
          }
        },
      )
    );
  }
}
