// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:subsparrow/feature/newsub/view/mixin/new_sub_mixin.dart';
import 'package:subsparrow/product/model/sub_detail/subscription_detail.dart';
import 'package:subsparrow/product/model/subscriptions.dart';

part 'widget/new_sub_app_bar.dart';
part 'widget/new_sub_card.dart';

/// NewSub
final class NewSubView extends StatefulWidget {
  /// NewSubView
  const NewSubView({super.key});

  @override
  State<NewSubView> createState() => _NewSubViewState();
}

final class _NewSubViewState extends State<NewSubView> with NewSubMixin {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: const _NewSubAppBar(),
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
                  final subscriptions = snapshot.data!.docs
                      .map(
                        (e) => e.data(),
                      )
                      .toList();

                  return _subCardList(subscriptions);
                } else {
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

  ListView _subCardList(List<SubscriptionCollection?> subscriptions) {
    return ListView.builder(
      itemCount: subscriptions.first?.subscriptions?.length ?? 0,
      itemBuilder: (context, index) {
        final sub = subscriptions.first?.subscriptions?[index];

        return _SubCard(
          onTap: () {
            customShowBottomSheet(sub);
          },
          sub: sub,
        );
      },
    );
  }
}
