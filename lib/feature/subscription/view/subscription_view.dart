import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';
import 'package:subsparrow/feature/search/view/search_view.dart';
import 'package:subsparrow/feature/subscription/view/mixin/subscription_mixin.dart';
import 'package:subsparrow/feature/subscription/view_model/subscription_view_model.dart';
import 'package:subsparrow/product/widget/circle_loading.dart';
import 'package:subsparrow/product/widget/custom_search_text_field.dart';
import 'package:subsparrow/product/widget/subscription_view_card.dart';

part 'widget/subscription_app_bar.dart';

/// [SubscriptionView] is the view that displays the list of subscriptions
final class SubscriptionView extends StatefulWidget {
  /// [SubscriptionView] is the view that displays the list of subscriptions
  const SubscriptionView({super.key});

  @override
  _SubscriptionViewState createState() => _SubscriptionViewState();
}

class _SubscriptionViewState extends State<SubscriptionView> with SubscriptionMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const _SubsriptionAppBar(),
      body: FutureBuilder(
        future: subscriptionViewModel.getSubscriptionData(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final subscriptionData = snapshot.data!;
            return Padding(
              padding: const EdgeInsets.all(8),
              child: Column(
                children: [
                  CustomSearchTextField(
                    readOnly: true,
                    onTap: () {
                      context.route.navigateToPage(
                        SearchView(
                          subscriptionData: subscriptionData,
                          subscriptionViewModel: subscriptionViewModel,
                        ),
                      );
                    },
                  ),
                  _SubscriptionList(
                    subscriptionViewModel: subscriptionViewModel,
                  ),
                ],
              ),
            );
          } else if (snapshot.hasError) {
            return const Center(
              child: Text('Error'),
            );
          } else {
            return const CircleLoading();
          }
        },
      ),
    );
  }
}

final class _SubscriptionList extends StatelessWidget {
  const _SubscriptionList({
    required SubscriptionViewModel subscriptionViewModel,
  }) : _subscriptionViewModel = subscriptionViewModel;

  final SubscriptionViewModel _subscriptionViewModel;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: _subscriptionViewModel.subscriptionData.length,
        itemBuilder: (context, index) {
          return SubscriptionViewCard(
            subscriptionData: _subscriptionViewModel.subscriptionData,
            subscriptionViewModel: _subscriptionViewModel,
            index: index,
          );
        },
      ),
    );
  }
}
