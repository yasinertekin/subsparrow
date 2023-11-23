import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:subsparrow/product/model/sub_detail/subscription_detail.dart';
import 'package:subsparrow/product/model/subscription_collection/subscription_collection.dart';

/// FirebaseService
abstract class FirebaseService {
  Future<QuerySnapshot<SubscriptionCollection?>> getSubscriptions(
    CollectionReference<Map<String, dynamic>> subscriptions,
  );
  Future<void> addUser(
    String documentId,
    List<SubscriptionDetail> subDetails,
    CollectionReference<Object?> users,
  );
  Future<void> addSubscriptionDetail(
    String userId,
    SubscriptionDetail newSubDetail,
    CollectionReference<Object?> users,
  );
}

class FirebaseServices extends FirebaseService {
  @override
  Future<QuerySnapshot<SubscriptionCollection?>> getSubscriptions(
    CollectionReference<Map<String, dynamic>> subscriptions,
  ) async {
    try {
      final response = await subscriptions.withConverter(
        fromFirestore: (snapshot, options) {
          return const SubscriptionCollection().fromFirebase(snapshot);
        },
        toFirestore: (value, options) {
          if (value == null) throw Exception('value is null');
          return value.toJson();
        },
      ).get();

      return response;
    } catch (e, stackTrace) {
      ///
      print(stackTrace);
      rethrow;
    }
  }

  @override
  Future<void> addUser(
    String documentId,
    List<SubscriptionDetail> subDetails,
    CollectionReference<Object?> users,
  ) async {
    try {
      final subDetailMaps = subDetails.map((subDetail) => subDetail.toJson()).toList();
      final docRef = await users.doc(documentId).set({
        'subscriptionDetails': subDetailMaps,
      });
    } catch (e) {}
  }

  @override
  Future<void> addSubscriptionDetail(
    String userId,
    SubscriptionDetail? newSubDetail,
    CollectionReference users,
  ) async {
    try {
      var documentSnapshot = await users.doc(userId).get();

      if (!documentSnapshot.exists) {
        await users.doc(userId).set({'subscriptionDetails'});
        documentSnapshot = await users.doc(userId).get();
      }

      final data = documentSnapshot.data() as Map<String, dynamic>?;

      if (data != null) {
        final existingSubDetails = data['subscriptionDetails'] as List<dynamic>;

        final newSubDetailMap = newSubDetail?.toJson();

        if (newSubDetailMap != null) {
          final newSubDetailId = newSubDetailMap['subId'] as String;

          // Check if a SubscriptionDetail with the same ID already exists
          final alreadyExists = existingSubDetails.any((existingSub) {
            return existingSub['subId'] == newSubDetailId;
          });

          if (!alreadyExists) {
            existingSubDetails.add(newSubDetailMap);

            await users.doc(userId).update({
              'subscriptionDetails': existingSubDetails,
            });
          }
        }
      }
    } catch (e) {
      // Handle the exception appropriately
    }
  }
}
