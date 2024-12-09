import 'package:cloud_firestore/cloud_firestore.dart';

class UserData {
  final String uid;
  final String imageUrl;
  final String fullName;
  final String timestamp;

  UserData({
    required this.uid,
    required this.imageUrl,
    required this.fullName,
    required this.timestamp,
  });

  factory UserData.formSnapshot(DocumentSnapshot snapshot){
    final data = snapshot.data() as Map<String,dynamic>;
    return UserData(
        uid: data['uid'] ?? '',
        imageUrl: data['image_url'] ?? '',
        fullName: data['fullName'] ?? '',
        timestamp: (data['last_seen'] as Timestamp).toDate().toString() ?? ''
    );
  }
}
