import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:lift/core/models/user_details.dart';
import 'package:lift/core/services/firebase_services.dart';

class Signup extends StatelessWidget {
  Signup({super.key});

  final FireBaseServices fireBaseServices = FireBaseServices();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('SignUp'),
      ),
      body: Column(
        children: [
          FutureBuilder<DocumentSnapshot>(
              future: fireBaseServices.getDocument(
                  collectionPath: 'User',
                  document: 'MQebomzRV1OxwfuU52IsEDzSHbx2'),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const CircularProgressIndicator();
                } else if (snapshot.hasError) {
                  return Center(
                    child: Text('Snapshot error: ${snapshot.error}'),
                  );
                } else if (snapshot.hasData && snapshot.data != null) {
                  final documentSnapshot = snapshot.data!;
                  final userData = UserData.formSnapshot(documentSnapshot);
                  return Center(
                    child: Text( 'User: ${userData.fullName}\nLast Seen: ${userData.timestamp}'),
                  );
                }else{
                  return const Center(child: Text('Snapshot: No data found'));
                }
              }
              )
        ],
      ),
    );
  }
}
