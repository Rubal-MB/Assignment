import 'package:ass_salon_app/reservation_screen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class OwnerPage extends StatefulWidget {
  @override
  _OwnerPageState createState() => _OwnerPageState();
}

class _OwnerPageState extends State<OwnerPage> {
  final Color primaryColor = Color(0xff18203d);
  final Color secondaryColor = Color(0xff232c51);
  final Color logoGreen = Color(0xff25bcbb);

  CollectionReference ref = FirebaseFirestore.instance.collection('data');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        backgroundColor: primaryColor,
        body: Container(
          margin: EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              FlatButton(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text('Add New Rservation'),
                ),
                color: logoGreen,
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ReservationScreen()));
                },
              ),
              SizedBox(
                height: 20,
              ),
              Card(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    ListTile(
                      leading: Icon(Icons.check),
                      title: Text(
                        'Name',
                      ),
                      subtitle: Text(
                        'Email Id     PhoneNumber     Date    Time',
                      ),
                    ),
                    ButtonBar(
                      children: <Widget>[
                        FlatButton(
                          child: const Text('Delete'),
                          onPressed: () {/* ... */},
                        ),
                        FlatButton(
                          child: const Text('update'),
                          onPressed: () {/* ... */},
                        ),
                        FlatButton(
                          child: const Text('Mark As Read'),
                          onPressed: () {/* ... */},
                        ),
                        FlatButton(
                          child: const Text('Edit'),
                          onPressed: () {/* ... */},
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),

          // StreamBuilder(
          //   stream: ref.snapshots(),
          //   builder: (_, AsyncSnapshot<QuerySnapshot> snapshot) {
          //     if (snapshot.hasData) {
          //       return ListView.builder(
          //           itemCount: snapshot.data.docs.length,
          //           itemBuilder: (context, index) {
          //             var doc = snapshot.data.docs[index].data;
          //             return ListTile(
          //               title: Text(
          //                 // doc['name'],
          //                 style: TextStyle(
          //                   color: Colors.white,
          //                 ),
          //               ),
          //             );
          //           });
          //     } else
          //       return Text('');
          //   },
          // ),
        ));
  }
}
