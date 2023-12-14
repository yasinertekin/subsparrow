import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:gen/src/model/subscriptions/subscriptions.dart';
import 'package:subsparrow/feature/home/view/widget/home%20subscription%20cards/home_subscription_cards.dart';
import 'package:subsparrow/product/service/firebase_service.dart';

/// The mixin for the [SubscriptionCards].
mixin HomeSubscriptionCardsMixin on State<SubscriptionCards> {
  /// The method for showing the dialog.
  Future<bool?> showCustomDialog(
    BuildContext context,
    FirebaseService firebaseService,
    Subscriptions subscriptions,
  ) {
    final userId = FirebaseAuth.instance.currentUser?.uid;
    final users = FirebaseFirestore.instance.collection('users');

    return showDialog<bool>(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Emin misiniz?'),
          content: const Text(
            'Bu aboneliği silmek istediğinize emin misiniz?',
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(false),
              child: const Text('Hayır'),
            ),
            TextButton(
              onPressed: () {
                firebaseService.deleteSubscriptions(
                  userId.toString(),
                  subscriptions,
                  users,
                );
                Navigator.of(context).pop(true);
              },
              child: const Text('Evet'),
            ),
          ],
        );
      },
    );
  }
}
