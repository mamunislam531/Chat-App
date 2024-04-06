import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:my_chat/model/user.dart';

class FirebaseService {
  static Future<bool> createAccount({required UserModels userModels}) async {
    var a = await FirebaseFirestore.instance.collection("User").add(userModels.toJson()).then((value) => true);
    return a;
  }
}
