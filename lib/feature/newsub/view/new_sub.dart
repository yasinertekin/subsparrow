import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:subsparrow/feature/newsub/view/mixin/new_sub_mixin.dart';
import 'package:subsparrow/product/model/subscriptions.dart';

/// NewSub
final class NewSub extends StatefulWidget {
  /// Default constructor for [NewSub].
  const NewSub({super.key});

  @override
  State<NewSub> createState() => _NewSubState();
}

final class _NewSubState extends State<NewSub> with NewSubMixin {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: const Text(
            'Abonelikler',
          ),
        ),
        body: FutureBuilder(
          future: getSubData(),
          builder: (
            BuildContext context,
            AsyncSnapshot<QuerySnapshot<SubscriptionCollection?>> snapshot,
          ) {
            switch (snapshot.connectionState) {
              case ConnectionState.none:
                return const Center(
                  child: Text('Bağlantı Durumu: None'),
                );

              case ConnectionState.active:
              case ConnectionState.waiting:
                return const Center(
                  child: CircularProgressIndicator(),
                );

              case ConnectionState.done:
                if (snapshot.hasData) {
                  final subscriptions = snapshot.data!.docs.map((e) => e.data()).toList();

                  return ListView.builder(
                    itemCount: subscriptions.first?.subscriptions?.length ?? 0,
                    itemBuilder: (context, index) {
                      final sub = subscriptions.first?.subscriptions?[index];

                      return Card(
                        child: ListTile(
                          onTap: () {
                            customShowBottomSheet(sub);
                          },
                          leading: SvgPicture.network(
                            sub?.subIcon ?? '',
                            height: 50,
                            width: 50,
                          ),
                          title: Text(
                            sub?.subName ?? '',
                          ),
                          trailing: const Icon(
                            Icons.add,
                          ),
                        ),
                      );
                    },
                  );
                } else {
                  // Firestore'dan veri gelmediği durum
                  return const Center(
                    child: Text('Veri Bulunamadı'),
                  );
                }
            }
          },
        ),
      ),
    );
  }
}
