import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:subsparrow/feature/newsub/view/new_sub_view.dart';
import 'package:subsparrow/product/model/sub_detail/subscription_detail.dart';
import 'package:subsparrow/product/model/subscriptions.dart';
import 'package:subsparrow/product/service/firebase_service.dart';

/// NewSub
mixin NewSubMixin on State<NewSubView> {
  /// customShowBottomSheet
  void customShowBottomSheet(SubscriptionDetail? sub) {
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

  final CollectionReference<Map<String, dynamic>> _subscriptions =
      FirebaseFirestore.instance.collection('subscriptions');
  final FirebaseServices _firebaseServices = FirebaseServices();

  Future<QuerySnapshot<SubscriptionCollection?>> getSubData() {
    return _firebaseServices.getSubscriptions(_subscriptions);
  }
}
