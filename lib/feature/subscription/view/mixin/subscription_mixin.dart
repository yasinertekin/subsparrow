import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:subsparrow/feature/subscription/view/subscription_view.dart';
import 'package:subsparrow/product/model/subscription/subscription.dart';
import 'package:subsparrow/product/model/subscription_collection/subscription_collection.dart';
import 'package:subsparrow/product/service/firebase_service.dart';

/// NewSub
mixin SubscriptionMixin on State<SubscriptionView> {
  final CollectionReference<Map<String, dynamic>> _subscriptions =
      FirebaseFirestore.instance.collection('subscriptions');
  final FirebaseServices _firebaseServices = FirebaseServices();
  final CollectionReference<Map<String, dynamic>> users = FirebaseFirestore.instance.collection('users');

  /// customShowBottomSheet
  void customShowBottomSheet(Subscription? sub) {
    showModalBottomSheet<void>(
      context: context,
      builder: (BuildContext context) => SizedBox(
        child: Column(
          children: [
            SvgPicture.network(
              sub?.subIcon ?? '',
              height: 50,
              width: 50,
            ),
            Text(sub?.subName ?? ''),
            const TextField(
              maxLength: 5,
              keyboardAppearance: Brightness.dark,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Abonelik Fiyatı',
              ),
            ),
            ElevatedButton(
              onPressed: () {
                print('${sub?.subName} eklendi');
              },
              child: const Text('data'),
            ),
          ],
        ),
      ),
    );
  }

  /// SubCardList
  Future<QuerySnapshot<SubscriptionCollection?>> getSubData() {
    return _firebaseServices.getSubscriptions(_subscriptions);
  }

  /// Add Subscription
  Future<void> addSub(
    String userId,
    Subscription? newSubDetail,
  ) {
    return _firebaseServices.addSubscriptionDetail(
      userId,
      newSubDetail,
      users,
    );
  }
}
