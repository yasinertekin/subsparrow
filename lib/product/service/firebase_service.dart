import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:subsparrow/product/model/subscriptions.dart';

/// FirebaseService
abstract class FirebaseService {
  Future<QuerySnapshot<SubscriptionCollection?>> getSubscriptions(
    CollectionReference<Map<String, dynamic>> subscriptions,
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
      print('Error fetching data: $e\n$stackTrace');
      rethrow;
    }
  }
}
