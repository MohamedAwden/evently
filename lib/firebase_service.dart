import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:evently/modals/event.dart';
import 'package:evently/modals/user_modal.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FirebaseService {
  static CollectionReference<Event> getEventCollection() =>
      FirebaseFirestore.instance.collection('events').withConverter<Event>(
            fromFirestore: (dpcSnapshot, _) =>
                Event.fromJason(dpcSnapshot.data()!),
            toFirestore: (event, _) => event.toJason(),
          );

  static CollectionReference<UserModal> getUserCollection() =>
      FirebaseFirestore.instance.collection('users').withConverter<UserModal>(
            fromFirestore: (dpcSnapshot, _) =>
                UserModal.fromJason(dpcSnapshot.data()!),
            toFirestore: (user, _) => user.toJason(),
          );

  static Future<void> addEventToFireStore(Event event) async {
    CollectionReference<Event> eventsCollection = getEventCollection();
    DocumentReference<Event> doc = eventsCollection.doc();
    event.id = doc.id;
    return doc.set(event);
  }

  static Future<List<Event>> getEventsFromFirestore(String? categoryId) async {
    CollectionReference<Event> eventsCollection = getEventCollection();
    late QuerySnapshot<Event> querySnapshot;
    if (categoryId == null) {
      querySnapshot = await eventsCollection.orderBy('timeStamp').get();
    } else {
      querySnapshot = await eventsCollection
          .where('categoryId', isEqualTo: categoryId)
          .orderBy('timeStamp')
          .get();
    }

    return querySnapshot.docs
        .map(
          (docSnapshot) => docSnapshot.data(),
        )
        .toList();
  }

  static Future<void> deleteEventFromFirestore(String eventId) async {
    CollectionReference<Event> eventsCollection = getEventCollection();
    return eventsCollection.doc(eventId).delete();
  }

  static Future<UserModal> register({
    required String name,
    required String email,
    required String password,
  }) async {
    UserCredential credential =
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );
    UserModal user = UserModal(
      id: credential.user!.uid,
      name: name,
      email: email,
      favouriteEventsIds: [],
    );
    CollectionReference<UserModal> usersCollection = getUserCollection();
    await usersCollection.doc(user.id).set(user);
    return user;
  }

  static Future<UserModal> login({
    required String email,
    required String password,
  }) async {
    UserCredential credential =
        await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
    CollectionReference<UserModal> usersCollection = getUserCollection();
    DocumentSnapshot<UserModal> docSnapshot =
        await usersCollection.doc(credential.user!.uid).get();
    return docSnapshot.data()!;
  }

  static Future<void> logout() => FirebaseAuth.instance.signOut();

  static Future<void> addEventToFavourites(String eventId) async {
    CollectionReference<UserModal> usersCollection = getUserCollection();
  return  usersCollection.doc(FirebaseAuth.instance.currentUser!.uid).update(
      {
        'favouriteEventsIds': FieldValue.arrayUnion([eventId]),
      },

    );
  }
  static Future<void> removeEventFromFavourites(String eventId) async {
    CollectionReference<UserModal> usersCollection = getUserCollection();
    return  usersCollection.doc(FirebaseAuth.instance.currentUser!.uid).update(
      {
        'favouriteEventsIds': FieldValue.arrayRemove([eventId]),
      },

    );
  }
}
