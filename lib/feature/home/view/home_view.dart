import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:gen/src/model/users/users.dart';
import 'package:kartal/kartal.dart';
import 'package:subsparrow/feature/home/view/mixin/home_view_mixin.dart';
import 'package:subsparrow/feature/home/view_model/home_view_model.dart';
import 'package:subsparrow/product/service/firebase_service.dart';
import 'package:subsparrow/product/utility/constants/string_constants.dart';

part 'widget/home_app_bar.dart';
part 'widget/home_search.dart';
part 'widget/home_total_price_card.dart';

/// [HomeView] is the main view of the application.
final class HomeView extends StatefulWidget {
  /// [HomeView] is the main view of the application.
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
        stream: homeViewModel.userDocument.snapshots(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.active) {
            if (snapshot.hasData) {
              final users = snapshot.data!.data();
              homeViewUsersInit(users, firebaseServices);
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const _HomeSearch(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      _TotalPriceCard(
                        homeViewModel: homeViewModel,
                        totalSubPrice: homeViewModel.totalPrice,
                        total: StringConstants.currentSubscriptions,
                      ),
                      _TotalPriceCard(
                        homeViewModel: homeViewModel,
                        totalSubPrice: homeViewModel.monthlyPrice,
                        total: StringConstants.total,
                      ),
                    ],
                  ),
                  SubscriptionCardList(
                    users: users,
                    firebaseServices: firebaseServices,
                    homeViewModel: homeViewModel,
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

/// [SubscriptionCardList] is the list of subscriptions.
final class SubscriptionCardList extends StatelessWidget {
  /// [SubscriptionCardList] is the list of subscriptions.
  const SubscriptionCardList({
    required this.users,
    required this.firebaseServices,
    required this.homeViewModel,
    super.key,
  });

  /// [users] is the user data.
  final Users? users;

  /// [firebaseServices] is the firebase services.
  final FirebaseServices firebaseServices;

  /// [homeViewModel] is the home view model.
  final HomeViewModel homeViewModel;
  @override
  Widget build(BuildContext context) {
    final subList = users?.subscriptions.where(
      (
        element,
      ) =>
          element.status == true,
    );
    return Expanded(
      child: ListView.builder(
        itemCount: subList?.length,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            onTap: () {},
            title: Text(
              subList?.first.name.toString() ?? '',
            ),
            subtitle: Text(
              subList?.first.platformName.toString() ?? '',
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
