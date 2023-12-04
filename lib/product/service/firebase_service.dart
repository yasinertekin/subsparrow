import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:gen/src/model/subscriptions/subscriptions.dart';
import 'package:gen/src/model/users/users.dart';

/// FirebaseService
abstract class FirebaseService {
  /// Add a new user
  Future<void> addUser(
    String documentId,
    List<Subscriptions> subDetails,
    CollectionReference<Object?> users,
  );

  Future<void> addSubscription(
    String userId,
    Subscriptions newSubDetail,
    CollectionReference<Object?> users,
  );

  Future<DocumentSnapshot<Users>> fetchUserData(
    String authId,
  );
}

/// FirebaseServices
final class FirebaseServices extends FirebaseService {
  @override
  Future<void> addUser(
    String documentId,
    List<Subscriptions> subDetails,
    CollectionReference<Object?> users,
  ) async {
    try {
      final docRef = await users.doc(documentId).set({
        'subscriptionDetails': subDetails,
      });

      return docRef;
    } catch (e) {
      // Handle the error
    }
  }

  @override
  Future<void> addSubscription(
    String userId,
    Subscriptions newSubDetail,
    CollectionReference<Object?> users,
  ) async {
    try {
      final docRef = await users.doc(userId).update({
        'subscriptionDetails': FieldValue.arrayUnion([newSubDetail.toJson()]),
      });

      return docRef;
    } catch (e) {
      // Handle the error
    }
  }

  @override
  Future<DocumentSnapshot<Users>> fetchUserData(
    String authId,
  ) async {
    try {
      final auth = FirebaseAuth.instance.currentUser?.uid;
      final userDocument = FirebaseFirestore.instance.collection('users').doc(auth).withConverter<Users>(
            fromFirestore: (snapshot, _) => Users.fromJson(snapshot.data() ?? {}),
            toFirestore: (users, _) => users.toJson(),
          );
      return await userDocument.get();
    } catch (error) {
      print('Error fetching data: $error');
      rethrow;
    }
  }
}
