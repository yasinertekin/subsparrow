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
import 'package:subsparrow/product/service/firebase_service.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

part 'widget/home_app_bar.dart';
part 'widget/home_total_price_card.dart';
part 'widget/home_subscription_card.dart';
part 'widget/home_search.dart';

final class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

final class _HomeViewState extends State<HomeView> with HomeViewMixin {
  @override
  Widget build(BuildContext context) {
    final firebaseServices = FirebaseServices();

    return Scaffold(
      appBar: const _HomeAppBar(),
      body: StreamBuilder<DocumentSnapshot<Users>>(
        stream: homeViewModel.userDocument.snapshots(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.active) {
            if (snapshot.hasData) {
              final users = snapshot.data!.data();

              homeViewModel.subTotalPrice(users);
              homeViewModel.subMonthlyTotalPrice(users);

              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _HomeSearch(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      _TotalPriceCard(
                        homeViewModel: homeViewModel,
                        totalSubPrice: homeViewModel.totalPrice ?? 0.0,
                        total: StringConstants.currentSubscriptions,
                      ),
                      _TotalPriceCard(
                        homeViewModel: homeViewModel,
                        totalSubPrice: homeViewModel.monthlyPrice ?? 0.0,
                        total: StringConstants.total,
                      ),
                    ],
                  ),
                  SubscriptionCardList(
                    users: users,
                    firebaseServices: firebaseServices,
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
  const SubscriptionCardList({
    required this.users,
    super.key,
    required this.firebaseServices,
  });
  final Users? users;
  final FirebaseServices firebaseServices;
  @override
  Widget build(BuildContext context) {
    final subList = users?.subscriptions.where((element) => element.status == true);
    final userCollection = FirebaseFirestore.instance.collection('users');
    return Expanded(
      child: ListView.builder(
        itemCount: subList?.length,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            onTap: () {
              firebaseServices.setSubscriptions(
                FirebaseAuth.instance!.currentUser!.uid.toString(),
                subList!.first.copyWith(
                  status: false,
                  icon: subList.first.icon,
                  platformName: subList.first.platformName,
                ),
                userCollection,
              );
            },
            title: Text(
              subList?.first?.name.toString() ?? '',
            ),
            subtitle: Text(
              subList?.first?.platformName.toString() ?? '',
            ),
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
