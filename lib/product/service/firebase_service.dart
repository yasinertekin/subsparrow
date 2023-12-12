import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:gen/src/model/subscriptions/subscriptions.dart';
import 'package:gen/src/model/users/users.dart';

/// FirebaseService
abstract class FirebaseService {
  /// Add a new user
  Future<void> addUserSubscriptions(
    String documentId,
    List<Subscriptions> subDetails,
    CollectionReference<Object?> users,
  );

  /// [upgradeSubscriptions] adds a new subscription to the existing
  /// list of subscriptions
  Future<void> upgradeSubscriptions(
    String userId,
    Subscriptions newSubDetail,
    CollectionReference<Object?> users,
  );

  /// [fetchUserData] fetches the user data from the firestore
  Future<DocumentSnapshot<Users>> fetchUserData(
    String authId,
  );

  /// [setSubscriptions] sets the subscription details for the user
  Future<void> setSubscriptions(
    String userId,
    Subscriptions subDetails,
    CollectionReference<Object?> users,
  );
}

/// FirebaseServices
final class FirebaseServices extends FirebaseService {
  @override
  Future<void> addUserSubscriptions(
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
  Future<void> upgradeSubscriptions(
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
      final userDocument = FirebaseFirestore.instance
          .collection(
            'users',
          )
          .doc(auth)
          .withConverter<Users>(
            fromFirestore: (snapshot, _) => Users.fromJson(
              snapshot.data() ?? {},
            ),
            toFirestore: (users, _) => users.toJson(),
          );
      return await userDocument.get();
    } catch (error) {
      rethrow;
    }
  }

  @override
  Future<void> setSubscriptions(
    String userId,
    Subscriptions subDetails,
    CollectionReference<Object?> users,
  ) async {
    try {
      final docRef = await users.doc(userId).set({
        'subscriptionDetails': FieldValue.arrayUnion([subDetails.toJson()]),
      });

      return docRef;
    } catch (e) {
      // Handle the error
    }
  }
}
