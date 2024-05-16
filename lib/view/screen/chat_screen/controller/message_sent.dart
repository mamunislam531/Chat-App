import 'package:cloud_firestore/cloud_firestore.dart';

class MessageSentService {
  static Future<void> messageSentService({required String message, required String senderID, required String docID}) async {
    var dateTime = DateTime.now();
    var data = {"id": senderID, "message": message, "dateTime": dateTime};
    var a = FirebaseFirestore.instance.collection("chat").doc(docID);
    await a.set({"dateTime": dateTime});
    await a.collection("collectionPath").doc().set(data);
  }
}
