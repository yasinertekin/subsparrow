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

part 'widget/home subscription cards/home_subscription_cards.dart';
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
                  GridView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: HomeGridViewBuilder.values.length,
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      childAspectRatio: 1.5,
                    ),
                    itemBuilder: (BuildContext context, int index) {
                      final item = HomeGridViewBuilder.values[index];

                      return Text(
                        maxLines: 1,
                        item.name,
                        style: context.general.textTheme.bodyMedium?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                      );
                    },
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

final class _TotalPriceHeader extends StatelessWidget {
  const _TotalPriceHeader({
    required this.homeViewModel,
  });

  final HomeViewModel homeViewModel;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        _TotalPriceCard(
          homeViewModel: homeViewModel,
          totalSubPrice: homeViewModel.totalPrice,
          total: StringConstants.currentSubscriptions,
        ),
        const Column(
          children: [
            Text('Toplam Abonelik Sayısı'),
            CircleAvatar(
              radius: 20,
              child: Text(
                'tatal',
              ),
            ),
          ],
        ),
        _TotalPriceCard(
          homeViewModel: homeViewModel,
          totalSubPrice: homeViewModel.monthlyPrice,
          total: StringConstants.total,
        ),
      ],
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

            return SubscriptionCards(
              item: subscription,
            );
          },
        ),
      ),
    );
  }
}
