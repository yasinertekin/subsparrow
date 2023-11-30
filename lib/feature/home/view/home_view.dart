import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:gen/gen.dart';
import 'package:kartal/kartal.dart';
import 'package:subsparrow/feature/home/mixin/home_view_mixin.dart';
import 'package:subsparrow/product/model/subscription/subscription.dart';
import 'package:subsparrow/product/model/user/users.dart';
import 'package:subsparrow/product/constants/string_constants.dart';

part './widget/home_app_bar.dart';
part 'widget/home_sub_list_card.dart';
part 'widget/home_total_price_card.dart';

final class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

final class _HomeViewState extends State<HomeView> with HomeViewMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const _HomeAppBar(),
      body: StreamBuilder<DocumentSnapshot<Users>>(
        stream: stopListening ? null : userDocument.snapshots(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.active) {
            if (snapshot.hasData) {
              final users = snapshot.data!.data();

              final subPriceStrings = users?.subscriptions
                  .map(
                    (sub) => sub.subBasePrice.toString(),
                  )
                  .toList();

              final subPrices = subPriceStrings?.map(double.parse).toList();
              final totalSubPrice = subPrices?.fold(
                0.0,
                (previous, current) => previous + current,
              );
              return Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _TotalPriceCard(totalSubPrice: totalSubPrice ?? 0.0),
                  Padding(
                    padding: context.padding.low,
                    child: Text(
                      StringConstants.mySubscriptions,
                      style: context.general.textTheme.displaySmall?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  if (users != null && users.subscriptions.isNotEmpty)
                    _SubscriptionList(
                      users: users,
                    ),
                ],
              );
            } else if (snapshot.hasError) {
              return Text('Error: ${snapshot.error}');
            }
          }
          return const CircularProgressIndicator();
        },
      ),
    );
  }
}

final class _SubscriptionList extends StatelessWidget {
  const _SubscriptionList({
    required this.users,
    super.key,
  });

  final Users? users;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: users?.subscriptions.length,
        itemBuilder: (context, index) {
          final sub = users?.subscriptions[index];
          return _SubListCard(sub: sub);
        },
      ),
    );
  }
}
