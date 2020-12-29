import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';

class ReservationScreen extends StatefulWidget {
  @override
  _ReservationScreenState createState() => _ReservationScreenState();
}

class _ReservationScreenState extends State<ReservationScreen> {
  final Color primaryColor = Color(0xff18203d);
  final Color secondaryColor = Color(0xff232c51);
  final Color logoGreen = Color(0xff25bcbb);

  TextEditingController nameController = TextEditingController();
  TextEditingController phonenumberController = TextEditingController();
  TextEditingController emailidController = TextEditingController();
  TextEditingController timeController = TextEditingController();
  TextEditingController dateController = TextEditingController();

  FirebaseFirestore firestore = FirebaseFirestore.instance;

  Map<String, dynamic> dataToAdd;

  CollectionReference collectionReference =
      FirebaseFirestore.instance.collection('data');

  addData() {
    dataToAdd = {
      "name": nameController.text,
      "phonenumber": phonenumberController.text,
      "emailid": emailidController.text,
      "time": timeController.text,
      "date": dateController.text,
    };

    collectionReference
        .add(dataToAdd)
        .whenComplete(() => print('added to firebase'));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      backgroundColor: primaryColor,
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              Text(
                'Rservation Screen',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 28,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: 40,
              ),
              _buildTextField(nameController, 'Name'),
              SizedBox(
                height: 20,
              ),
              _buildTextField(phonenumberController, 'Phone Number'),
              SizedBox(
                height: 20,
              ),
              _buildTextField(emailidController, 'Email Id'),
              SizedBox(
                height: 20,
              ),
              _buildTextField(timeController, 'Time'),
              SizedBox(
                height: 20,
              ),
              _buildTextField(dateController, 'Date'),
              SizedBox(
                height: 20,
              ),
              FlatButton(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text('Submit'),
                ),
                color: logoGreen,
                onPressed: () {
                  addData();
                },
              )
            ],
          ),
        ),
      ),
    );
  }

  _buildTextField(TextEditingController controller, String labelText) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      decoration: BoxDecoration(
          color: secondaryColor, border: Border.all(color: Colors.blue)),
      child: TextField(
        controller: controller,
        style: TextStyle(color: Colors.white),
        decoration: InputDecoration(
            contentPadding: EdgeInsets.symmetric(horizontal: 10),
            labelText: labelText,
            labelStyle: TextStyle(color: Colors.white),
            border: InputBorder.none),
      ),
    );
  }
}
