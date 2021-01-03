import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:Buddies/constants/strings.dart';
import 'package:Buddies/models/contact.dart';
import 'package:Buddies/models/users.dart';

class FriendsMethods {
  static final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  final CollectionReference _userCollection =
      _firestore.collection(USERS_COLLECTION);

  Future<void> addContactToDb(Users sender, Users receiver) async {
    addToContacts(senderId: sender.uid, receiverId: receiver.uid);
  }

  DocumentReference getFriendsDocument({String of, String forContact}) =>
      _userCollection.doc(of).collection(FRIENDS_COLLECTION).doc(forContact);

  addToContacts({String senderId, String receiverId}) async {
    Timestamp currentTime = Timestamp.now();

    await addToSenderContacts(senderId, receiverId, currentTime);
    await addToReceiverContacts(senderId, receiverId, currentTime);
  }

  Future<void> addToSenderContacts(
    String senderId,
    String receiverId,
    currentTime,
  ) async {
    DocumentSnapshot senderSnapshot =
        await getFriendsDocument(of: senderId, forContact: receiverId).get();

    if (!senderSnapshot.exists) {
      //does not exists
      Contact receiverContact = Contact(
        uid: receiverId,
        addedOn: currentTime,
      );

      var receiverMap = receiverContact.toMap(receiverContact);

      await getFriendsDocument(of: senderId, forContact: receiverId)
          .set(receiverMap);
    }
  }

  Future<void> addToReceiverContacts(
    String senderId,
    String receiverId,
    currentTime,
  ) async {
    DocumentSnapshot receiverSnapshot =
        await getFriendsDocument(of: receiverId, forContact: senderId).get();

    if (!receiverSnapshot.exists) {
      //does not exists
      Contact senderContact = Contact(
        uid: senderId,
        addedOn: currentTime,
      );

      var senderMap = senderContact.toMap(senderContact);

      await getFriendsDocument(of: receiverId, forContact: senderId)
          .set(senderMap);
    }
  }

  Stream<QuerySnapshot> fetchContacts({String userId}) =>
      _userCollection.doc(userId).collection(FRIENDS_COLLECTION).snapshots();
}
