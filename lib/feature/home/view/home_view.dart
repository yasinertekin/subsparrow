import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:gen/src/model/subscriptions/subscriptions.dart';
import 'package:gen/src/model/users/users.dart';
import 'package:kartal/kartal.dart';
import 'package:subsparrow/feature/home/view/mixin/home_view_mixin.dart';
import 'package:subsparrow/feature/home/view/widget/home%20subscription%20cards/home_subscription_cards_mixin.dart';
import 'package:subsparrow/feature/home/view_model/home_view_model.dart';
import 'package:subsparrow/product/service/firebase_service.dart';
import 'package:subsparrow/product/utility/constants/string_constants.dart';
import 'package:subsparrow/product/utility/enum/home_grid.dart';

part 'widget/custom_circle_avatar.dart';
part 'widget/home subscription cards/home_subscription_cards.dart';
part 'widget/home_app_bar.dart';
part 'widget/home_header.dart';
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
                  _HomeHeader(homeViewModel: homeViewModel),
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
      child: Padding(
        padding: context.padding.low,
        child: ListView.builder(
          itemCount: subList?.length,
          itemBuilder: (BuildContext context, int index) {
            final subscription = subList?.elementAt(index); // Get the subscription for the current index
            homeViewModel.changeSubCount(subList?.length ?? 0);
            return SubscriptionCards(
              item: subscription,
            );
          },
        ),
      ),
    );
  }
}
