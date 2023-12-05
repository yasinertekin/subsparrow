import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:common/common.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:gen/gen.dart';
import 'package:gen/src/model/users/users.dart';
import 'package:kartal/kartal.dart';
import 'package:subsparrow/product/constants/string_constants.dart';
import 'package:subsparrow/feature/home/view/mixin/home_view_mixin.dart';
import 'package:subsparrow/feature/home/view_model/home_view_model.dart';

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
    final HomeViewModel viewModel = HomeViewModel();
    return Scaffold(
      appBar: const _HomeAppBar(),
      body: StreamBuilder<DocumentSnapshot<Users>>(
        stream: userDocument.snapshots(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.active) {
            if (snapshot.hasData) {
              final users = snapshot.data!.data();

              viewModel.subTotalPrice(users);

              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _TotalPriceCard(totalSubPrice: viewModel.totalPrice ?? 0.0),
                  SubscriptionCardList(
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

final class SubscriptionCardList extends StatelessWidget {
  const SubscriptionCardList({required this.users, super.key});
  final Users? users;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: users?.subscriptions.length ?? 0,
        itemBuilder: (BuildContext context, int index) {
          return _SubscriptionCard(
            index: index,
            users: users,
          );
        },
      ),
    );
  }
}

final class _HomeTitle extends StatelessWidget {
  const _HomeTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: context.padding.low,
      child: Text(
        StringConstants.mySubscriptions,
        style: context.general.textTheme.displaySmall?.copyWith(
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
