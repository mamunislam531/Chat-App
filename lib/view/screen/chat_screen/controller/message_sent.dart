import 'package:cloud_firestore/cloud_firestore.dart';

class MessageSentService {
  static Future<void> messageSentService(
      {required String message, required String senderID, required String docID, required String messageType}) async {
    var dateTime = DateTime.now();
    var data = {"id": senderID, "message": message, "dateTime": dateTime, "message_type": messageType};
    var a = FirebaseFirestore.instance.collection("chat").doc(docID);
    await a.set({"dateTime": dateTime});
    await a.collection("collectionPath").doc().set(data);
  }
}
