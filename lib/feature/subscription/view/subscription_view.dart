// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gen/gen.dart';
import 'package:kartal/kartal.dart';
import 'package:subsparrow/feature/sub_detail/view/sub_detail_view.dart';
import 'package:subsparrow/feature/subscription/view/mixin/subscription_mixin.dart';
import 'package:subsparrow/product/model/subscription/subscription.dart';
import 'package:subsparrow/product/model/subscription_collection/subscription_collection.dart';

part 'widget/new_sub_app_bar.dart';
part 'widget/new_sub_card.dart';

/// NewSub
final class SubscriptionView extends StatefulWidget {
  const SubscriptionView({super.key});

  @override
  State<SubscriptionView> createState() => _NewSubViewState();
}

class _NewSubViewState extends State<SubscriptionView> with SubscriptionMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const _NewSubAppBar(),
      body: FutureBuilder(
        future: getSubData(),
        builder: (
          BuildContext context,
          AsyncSnapshot<QuerySnapshot<SubscriptionCollection?>> snapshot,
        ) {
          switch (snapshot.connectionState) {
            case ConnectionState.none:
              return Center(
                child: Assets.images.imgSubSparrowLogo.image(
                  package: 'gen',
                ),
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

                return Column(
                  children: [
                    const _SearchSubscription(),
                    _subCardList(
                      subscriptions,
                    ),
                  ],
                );
              } else {
                return const Center(
                  child: Text('Veri Bulunamadı'),
                );
              }
          }
        },
      ),
    );
  }

  Expanded _subCardList(
    List<SubscriptionCollection?> subscriptions,
  ) {
    return Expanded(
      child: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 0.8,
        ),
        itemCount: subscriptions.first?.subscriptions?.length ?? 0,
        itemBuilder: (context, index) {
          final sub = subscriptions.first?.subscriptions?[index];

          return _SubCard(
            onTap: () {
              context.route.navigateToPage(
                SubDetailView(
                  subDetail: sub,
                  subDetailsList: subscriptions.first?.subscriptions,
                ),
              );
              //  addSub(user.toString(), sub);
            },
            sub: sub,
          );
        },
      ),
    );
  }
}

final class _SearchSubscription extends StatelessWidget {
  const _SearchSubscription();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: context.padding.low,
      child: const Card(
        child: TextField(
          decoration: InputDecoration(
            hintText: 'Abonelik Ara',
            prefixIcon: Icon(Icons.search),
          ),
        ),
      ),
    );
  }
}
