import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:lisiko_creative/models/agenda.dart';
import 'package:lisiko_creative/models/user.dart';

class DatabaseService {
  final String uid;
  final CollectionReference usersCollection = FirebaseFirestore.instance.collection("users");
  final CollectionReference agendasCollection = FirebaseFirestore.instance.collection("agenda");

  DatabaseService({this.uid});

  //update user
  Future updateUser (String username, String phoneNumber, String role) async {
    return await usersCollection.doc(uid).set({
      'username': username,
      'phone_number': phoneNumber,
      'role': role
    });
  }

  //registered user data
  UsersModel _userFromFirebase (DocumentSnapshot snapshot) {
    return UsersModel(
      username: snapshot.get('username') ?? '',
      phone_number: snapshot.get('phone_number') ?? '',
      role: snapshot.get('role') ?? ''
    );
  }

  //get user date
  Stream<UsersModel> get userData {
    return usersCollection.doc(uid).snapshots().map(_userFromFirebase);
  }

  //add agenda
  Future addAgenda (String title, String username, String date, String time, String location, String facilitator, String attendees) async {
      return await agendasCollection.add({
        'title': title,
        'username': username,
        'date': date,
        'time': time,
        'location': location,
        'facilitator': facilitator,
        'attendees': attendees,
        'postedAt': FieldValue.serverTimestamp()
      });
  }

  //update agenda
  Future updateAgenda (String id, String title, String username, String date, String time, String location, String facilitator, String attendees) async {
    return await agendasCollection.doc(id).set({
      'title': title,
      'username': username,
      'date': date,
      'time': time,
      'location': location,
      'facilitator': facilitator,
      'attendees': attendees
    });
  }

  //add agenda
  Future deleteAgenda (String id) async {
    return await agendasCollection.doc(id).delete();
  }

  List<Agenda> _getAllAgendas (QuerySnapshot snapshot) {
    return snapshot.docs.map((doc) {
      return Agenda(
        title: doc['title'] ?? '',
        username: doc['username'] ?? '',
        date: doc['date'] ?? '',
        time: doc['time'] ?? '',
        location: doc['location'] ?? '',
        facilitator: doc['facilitator'] ?? '',
        attendees: doc['attendees'] ?? ''
      );
    }).toList();
  }

  //Stream get all agendas
  Stream<List<Agenda>> get agendas {
    return agendasCollection.snapshots().map(_getAllAgendas);
  }
  // List<>
}