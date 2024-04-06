

import 'package:cloud_firestore/cloud_firestore.dart';

class FirebaseService{

  Future<void> createAccount({required dynamic data})async{
    await FirebaseFirestore.instance.collection("Users").add(data);
  }
}