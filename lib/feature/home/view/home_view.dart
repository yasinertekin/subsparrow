import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:subsparrow/feature/home/mixin/home_view_mixin.dart';
import 'package:subsparrow/product/model/subscriptions.dart';

/// HomeView
final class HomeView extends StatefulWidget {
  /// Default constructor for [HomeView].
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

final class _HomeViewState extends State<HomeView> with HomeViewMixin {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            'Aboneliklerim',
          ),
        ),
        body: FutureBuilder(
          future: getSubData(), // Bu fonksiyonun Firebase'den veri çekmesini bekliyoruz
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
                  // Firestore'dan gelen veriyi işle
                  final subscriptions = snapshot.data!.docs.map((e) => e.data()).toList();

                  return ListView.builder(
                    itemCount: subscriptions.first?.subscriptions?.length ?? 0,
                    itemBuilder: (context, index) {
                      final sub = subscriptions.first?.subscriptions?[index];

                      return Card(
                        child: ListTile(
                          leading: SvgPicture.network(
                            sub?.subIcon ?? '',
                            height: 50,
                            width: 50,
                          ),
                          title: Text(
                            sub?.subName ?? '',
                          ),
                          subtitle: Text(
                            '${sub?.subPrice} TL',
                          ),
                          trailing: IconButton(
                            onPressed: () {
                              print('${sub?.subName} silindi');
                            },
                            icon: const Icon(Icons.delete),
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
