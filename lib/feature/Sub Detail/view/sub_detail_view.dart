import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:subsparrow/feature/Sub%20Detail/view_model/sub_detail_notifier.dart';
import 'package:subsparrow/product/model/subscription/subscription.dart';

/// SubDetail
final class SubDetailView extends StatelessWidget {
  /// SubDetail constructor
  SubDetailView({required this.subDetail, super.key});

  /// SubDetail key
  final Subscription? subDetail;

  final SubDetailNotifier _subDetailNotifier = SubDetailNotifier();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () => print(subDetail?.subOnePrice),
        child: const Icon(Icons.add),
      ),
      appBar: AppBar(
        title: const Text('Abonelik Detayları'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              onPressed: () => _subDetailNotifier.selectDate(context),
              child: const Text(
                'Tarih Seç',
              ),
            ),
            ElevatedButton(
              onPressed: () {
                _subDetailNotifier.addSub(
                  FirebaseAuth.instance.currentUser?.uid ?? '',
                  subDetail,
                );
              },
              child: const Text('Kaydet'),
            ),
            if (subDetail?.subOnePrice == false)
              ExpansionTile(
                title: const Text('parent.self.uid'),
                controlAffinity: ListTileControlAffinity.leading,
                children: subDetail?.subPrices
                        ?.map(
                          (e) => ListTile(
                            title: Text(e.premium.toString()),
                            subtitle: Text(e.standard ?? ''),
                          ),
                        )
                        .toList() ??
                    [],
              )
            else
              const SizedBox.shrink(),
          ],
        ),
      ),
    );
  }
}
