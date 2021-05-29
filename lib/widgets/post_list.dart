import 'package:flutter/material.dart';
import 'package:lisiko_creative/models/agenda.dart';
import 'package:provider/provider.dart';

class PostList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final agendas = Provider.of<List<Agenda>>(context);
    return ListView.builder(
      itemCount: agendas.length ?? [],
      itemBuilder: (context, index) {
        return GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, '/agenda');
            },
            child: Card(
              margin: EdgeInsets.all(15),
              elevation: 23,
              child: Column(
                children: [
                  Row(
                    children: [
                      Container(
                        padding: EdgeInsets.all(10),
                        color: Colors.blue,
                        height: 50,
                      ),
                      Expanded(
                        child: Container(
                          padding: EdgeInsets.all(10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                agendas[index].title,
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 23,
                                    fontWeight: FontWeight.bold),
                              ),
                              Text(
                                'by ${agendas[index].username}',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18,
                                    color: Colors.grey),
                              ),
                              SizedBox(
                                height: 8,
                              ),
                              RichText(
                                text: TextSpan(children: [
                                  TextSpan(
                                    text: 'DATE : ',
                                    style: TextStyle(
                                        fontSize: 14, color: Colors.grey),
                                  ),
                                  TextSpan(
                                    text: '${agendas[index].date}',
                                    style: TextStyle(
                                        fontSize: 18,
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  TextSpan(
                                    text: '\nTIME : ',
                                    style: TextStyle(
                                        fontSize: 14, color: Colors.grey),
                                  ),
                                  TextSpan(
                                    text: '${agendas[index].time}',
                                    style: TextStyle(
                                        fontSize: 18,
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold),
                                  )
                                ]),
                              ),
                              SizedBox(
                                height: 8,
                              ),
                              RichText(
                                text: TextSpan(children: [
                                  TextSpan(
                                    text: 'Location: ',
                                    style: TextStyle(
                                        fontSize: 14, color: Colors.grey),
                                  ),
                                  TextSpan(
                                    text: '${agendas[index].location}',
                                    style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black),
                                  ),
                                ]),
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                  Divider(),
                  TextButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/comments');
                    },
                    child: Text(
                      'Leave a comment',
                      style: TextStyle(fontSize: 18),
                    ),
                  )
                ],
              ),
            ));
      },
    );
  }
}
