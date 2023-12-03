import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:common/common.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:gen/gen.dart';
import 'package:gen/src/model/users/users.dart';
import 'package:kartal/kartal.dart';
import 'package:subsparrow/feature/home/mixin/home_view_mixin.dart';
import 'package:subsparrow/product/constants/string_constants.dart';

part 'widget/home_app_bar.dart';
part 'widget/home_total_price_card.dart';
part 'widget/home_subscription_card.dart';

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
        stream: userDocument.snapshots(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.active) {
            if (snapshot.hasData) {
              final users = snapshot.data!.data();

              final totalPrice = users?.subscriptions.map((e) => e.price).reduce(
                    (value, element) => value! + element!,
                  );

              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _TotalPriceCard(totalSubPrice: totalPrice ?? 0.0),
                  Padding(
                    padding: context.padding.low,
                    child: Text(
                      StringConstants.mySubscriptions,
                      style: context.general.textTheme.displaySmall?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Expanded(
                    child: ListView.builder(
                      itemCount: users?.subscriptions.length,
                      itemBuilder: (BuildContext context, int index) {
                        return _SubscriptionCard(
                          index: index,
                          users: users,
                        );
                      },
                    ),
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
