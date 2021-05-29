import 'package:flutter/material.dart';
import 'package:lisiko_creative/models/user.dart';
import 'package:lisiko_creative/services/database.dart';
import 'package:provider/provider.dart';

class AddAgenda extends StatefulWidget {
  const AddAgenda({Key key}) : super(key: key);

  @override
  _AddAgendaState createState() => _AddAgendaState();
}

class _AddAgendaState extends State<AddAgenda> {
  final _formKey = GlobalKey<FormState>();
  final titleController = TextEditingController();
  final facilitatorController = TextEditingController();
  final dateController = TextEditingController();
  final timeController = TextEditingController();
  final locationController = TextEditingController();
  final attendeesController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserModel>(context);
    return StreamBuilder<UsersModel>(
      stream: DatabaseService(uid: user.uid).userData,
      builder: (context, snapshot) {
        print(user.uid);
        if (snapshot.hasData) {
           UsersModel usersModel = snapshot.data;

          return Scaffold(
            appBar: AppBar(
              title: Text(
                'Add Agenda',
              ),
            ),
            body: SingleChildScrollView(
              padding: EdgeInsets.symmetric(vertical: 12.5, horizontal: 25),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                      'Please enter every required information'
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        TextFormField(
                          controller: titleController,
                          decoration: InputDecoration(
                              labelText: 'Enter a title',
                              contentPadding: EdgeInsets.all(2.0),
                              border: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Colors.blue
                                  )
                              )
                          ),
                          validator: (value) {
                            if (value.isEmpty) {
                              return 'Please enter title';
                            }
                            return null;
                          },
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        TextFormField(
                          controller: facilitatorController,
                          decoration: InputDecoration(
                              labelText: 'Enter a facilitator',
                              contentPadding: EdgeInsets.all(2.0),
                              border: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Colors.blue
                                  )
                              )
                          ),
                          validator: (value) {
                            if (value.isEmpty) {
                              return 'Please enter facilitator';
                            }
                            return null;
                          },
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        TextFormField(
                          controller: dateController,
                          decoration: InputDecoration(
                              labelText: 'Enter a date',
                              contentPadding: EdgeInsets.all(2.0),
                              border: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Colors.blue
                                  )
                              )
                          ),
                          validator: (value) {
                            if (value.isEmpty) {
                              return 'Please enter date';
                            }
                            return null;
                          },
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        TextFormField(
                          controller: timeController,
                          decoration: InputDecoration(
                              labelText: 'Enter a time',
                              contentPadding: EdgeInsets.all(2.0),
                              border: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Colors.blue
                                  )
                              )
                          ),
                          validator: (value) {
                            if (value.isEmpty) {
                              return 'Please enter time';
                            }
                            return null;
                          },
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        TextFormField(
                          decoration: InputDecoration(
                              labelText: 'Enter a location',
                              contentPadding: EdgeInsets.all(2.0),
                              border: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Colors.blue
                                  )
                              )
                          ),
                          validator: (value) {
                            if (value.isEmpty) {
                              return 'Please enter location';
                            }
                            return null;
                          },
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        TextFormField(
                          maxLines: 3,
                          decoration: InputDecoration(
                              labelText: 'Enter a attendees',
                              contentPadding: EdgeInsets.all(2.0),
                              border: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Colors.blue
                                  )
                              )
                          ),
                          validator: (value) {
                            if (value.isEmpty) {
                              return 'Please enter attendees';
                            }
                            return null;
                          },
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState.validate()) {
                          DatabaseService()
                              .addAgenda(
                                titleController.text,
                                usersModel.username,
                                dateController.text,
                                timeController.text,
                                locationController.text,
                                facilitatorController.text,
                                attendeesController.text)
                              .then((value) {
                                titleController.clear();
                                facilitatorController.clear();
                                dateController.clear();
                                timeController.clear();
                                attendeesController.clear();
                                Navigator.pushNamed(context, '/home');
                          });
                        }
                      },
                      child: Text(
                          'Add Agenda'
                      ),
                    ),
                  )
                ],
              ),
            ),
          );
        } else {
          return Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
        }
      },
    );
  }
}
