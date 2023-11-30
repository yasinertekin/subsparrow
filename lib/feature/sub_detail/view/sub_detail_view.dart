import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/scheduler/ticker.dart';
import 'package:gap/gap.dart';
import 'package:gen/gen.dart';
import 'package:kartal/kartal.dart';
import 'package:subsparrow/feature/sub_detail/view/mixin/sub_detail_mixin.dart';
import 'package:subsparrow/feature/sub_detail/view_model/sub_detail_notifier.dart';
import 'package:subsparrow/product/enum/sub_length.dart';
import 'package:subsparrow/product/enum/sub_view_enum.dart';
import 'package:subsparrow/product/model/subscription/subscription.dart';

part './widget/sub_month_list.dart';
part 'widget/price_view.dart';
part 'widget/sub_detail_app_bar.dart';
part 'widget/subscription_date_time_picker.dart';

/// SubDetail
final class SubDetailView extends StatefulWidget {
  /// SubDetail constructor
  const SubDetailView({
    required this.subDetail,
    required this.subDetailsList,
    super.key,
  });

  /// SubDetail key
  final Subscription? subDetail;

  /// SubDetail key
  final List<Subscription>? subDetailsList;

  @override
  State<SubDetailView> createState() => _SubDetailViewState();
}

final class _SubDetailViewState extends State<SubDetailView> with SubDetailMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _SubDetailAppBar(
        subDetailNotifier: subDetailNotifier,
      ),
      body: PageView.builder(
        physics: const NeverScrollableScrollPhysics(),
        controller: pageController,
        itemCount: SubViewEnum.values.length,
        itemBuilder: (context, index) {
          switch (subDetailNotifier.subViewEnum) {
            case SubViewEnum.date:
              return _SubscriptionDateTimePicker(
                subView: SubViewEnum.date,
                subDetailNotifier: subDetailNotifier,
                checkPickedDate: checkPickedDate,
                subDetail: widget.subDetail,
                pageController: pageController,
              );
            case SubViewEnum.monthLength:
              return _SubMonthList(
                subscription: widget.subDetail!,
                subDetailNotifier: subDetailNotifier,
                pageController: pageController,
              );
            case SubViewEnum.subPrice:
              return _PriceView(
                subscription: widget.subDetail!,
                subPrices: subPrices,
                subDetailNotifier: subDetailNotifier,
                pageController: pageController,
              );
            case SubViewEnum.verifications:
              return _VerificationView(
                subDetail: widget.subDetail!,
                subDetailNotifier: subDetailNotifier,
              );
          }
        },
      ),
    );
  }

  @override
  Ticker createTicker(TickerCallback onTick) {
    return Ticker(onTick);
  }
}

final class _VerificationView extends StatelessWidget {
  const _VerificationView({
    required this.subDetailNotifier,
    required this.subDetail,
  });
  final SubDetailNotifier subDetailNotifier;
  final Subscription subDetail;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Gap(15),
        Text(
          subDetailNotifier.selectedDate.toString(),
        ),
        const Gap(15),
        Text(
          subDetailNotifier.monthCount.toString(),
        ),
        const Gap(15),
        Text(
          subDetailNotifier.subPrice.toString(),
        ),
        const Gap(15),
        Text(
          subDetailNotifier.character,
        ),
        const Gap(15),
        Text(
          subDetailNotifier.subPrice.toString(),
        ),
        ElevatedButton(
          onPressed: () async {
            await subDetailNotifier.addSub(
              FirebaseAuth.instance.currentUser!.uid,
              subDetail.copyWith(
                subBasePrice: subDetailNotifier.subPrice.toString(),
                startDate: subDetailNotifier.selectedDate,
                endDate: subDetailNotifier.monthCount,
                subBaseMonth: subDetailNotifier.monthCount.toString(),
                subType: subDetailNotifier.subPlan.isEmpty ? 'Basic' : subDetailNotifier.subPlan,
              ),
            );
          },
          child: const Text('Save'),
        ),
      ],
    );
  }
}
