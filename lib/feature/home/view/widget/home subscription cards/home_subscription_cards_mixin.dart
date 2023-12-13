import 'package:flutter/material.dart';
import 'package:subsparrow/feature/home/view/home_view.dart';

/// The mixin for the [SubscriptionCards].
mixin HomeSubscriptionCardsMixin on State<SubscriptionCards> {
  bool _isFirstDialogOpen = false;

  Future<bool?> _showDialog(BuildContext context) async {
    if (_isFirstDialogOpen) {
      return null;
    }

    _isFirstDialogOpen = true;

    final result = await showDialog<bool>(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Emin misiniz?'),
          content: const Text(
            'Bu aboneliği silmek istediğinize emin misiniz?',
          ),
          actions: [
            TextButton(
              onPressed: () {
                _isFirstDialogOpen = false;
                Navigator.of(context).pop(false);
              },
              child: const Text('Hayır'),
            ),
            TextButton(
              onPressed: () async {
                _isFirstDialogOpen = false;
                Navigator.of(context).pop(true);
              },
              child: const Text('Evet'),
            ),
          ],
        );
      },
    );

    return result;
  }

  /// [customAlertDialog] is the custom alert dialog of the application.
  Future<bool> customAlertDialog(BuildContext context) async {
    final result = await _showDialog(context) ?? false;

    if (result) {
      // İlk dialogda "Evet" seçeneği seçildiyse, ikinci dialogu göster
      final localContext = context; // Capture the context

      // ignore: use_build_context_synchronously
      final isDelete = await showDialog<bool>(
        context: localContext,
        builder: (context) {
          return AlertDialog(
            title: const Text('Aboneliği sil'),
            content: const Text(
              'Bu aboneliği tamamen silmek mi istiyorsunuz yoksa inaktif yapmak mı istiyorsunuz?',
            ),
            actions: [
              TextButton(
                onPressed: () => Navigator.of(localContext).pop(true),
                child: const Text('İnaktif yap'),
              ),
              TextButton(
                onPressed: () => Navigator.of(localContext).pop(true),
                child: const Text('Tamamen sil'),
              ),
            ],
          );
        },
      );

      // ignore: use_if_null_to_convert_nulls_to_bools
      return isDelete == true;
    }

    return false;
  }
}
