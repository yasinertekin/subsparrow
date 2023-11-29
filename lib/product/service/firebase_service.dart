import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:subsparrow/product/model/subscription/subscription.dart';
import 'package:subsparrow/product/model/subscription_collection/subscription_collection.dart';

/// FirebaseService
abstract class FirebaseService {
  Future<QuerySnapshot<SubscriptionCollection?>> getSubscriptions(
    CollectionReference<Map<String, dynamic>> subscriptions,
  );
  Future<void> addUser(
    String documentId,
    List<Subscription> subDetails,
    CollectionReference<Object?> users,
  );
  Future<void> addSubscriptionDetail(
    String userId,
    Subscription newSubDetail,
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
    List<Subscription> subDetails,
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
    Subscription? newSubDetail,
    CollectionReference users,
  ) async {
    try {
      // Convert SubPrices to a Map
      final subPricesMap = {
        'basic': newSubDetail!.subPrices!.basic,
        'standard': newSubDetail.subPrices!.standard,
        'premium': newSubDetail.subPrices!.premium,
        'family': newSubDetail.subPrices!.family,
        'student': newSubDetail.subPrices!.student,
        'individual': newSubDetail.subPrices!.individual,
        'deluxe': newSubDetail.subPrices!.deluxe,
        'essential': newSubDetail.subPrices!.essential,
        'extra': newSubDetail.subPrices!.extra,
        'yearly': newSubDetail.subPrices!.yearly,
      };

      // Explicitly convert subPricesMap to JSON
      final subPricesJson = Map<String, dynamic>.from(subPricesMap);

      // Convert the entire Subscription object to a JSON-like structure
      final subscriptionJson = {
        'subId': newSubDetail.subId,
        'subName': newSubDetail.subName,
        'subType': newSubDetail.subType,
        'subBasePrice': newSubDetail.subBasePrice,
        'subPrices': subPricesJson,
        'status': newSubDetail.status,
        'subIcon': newSubDetail.subIcon,
        'subOnePrice': newSubDetail.subOnePrice,
        'subBaseMonth': newSubDetail.subBaseMonth,
      };

      final docRef = await users.doc(userId).update({
        'subscriptionDetails': FieldValue.arrayUnion([subscriptionJson]),
      });

      return docRef;
    } catch (e) {
      // Handle the error
      print('Error: $e');
    }
  }
}
