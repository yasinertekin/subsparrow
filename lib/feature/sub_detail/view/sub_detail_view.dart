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
import 'package:subsparrow/product/model/user/users.dart';

part 'widget/sub_detail_app_bar.dart';

/// SubDetail
final class SubDetailView extends StatefulWidget {
  /// SubDetail constructor
  const SubDetailView({required this.subDetail, required this.user, super.key});

  /// SubDetail key
  final Subscription? subDetail;
  final Users? user;

  @override
  State<SubDetailView> createState() => _SubDetailViewState();
}

class _SubDetailViewState extends State<SubDetailView> with SubDetailMixin {
  final SubDetailNotifier _subDetailNotifier = SubDetailNotifier();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const _SubDetailAppBar(),
      body: PageView.builder(
        physics: const NeverScrollableScrollPhysics(),
        controller: pageController,
        itemCount: SubViewEnum.values.length,
        itemBuilder: (context, index) {
          return SubViewEnum.values[index].index == 0
              ? _SubscriptionDateTimePicker(
                  subView: SubViewEnum.values[index],
                  subDetailNotifier: _subDetailNotifier,
                  checkPickedDate: checkPickedDate,
                  subDetail: widget.subDetail,
                  pageController: pageController,
                )
              : widget.subDetail?.subOnePrice == false
                  ? const _SubMonthList()
                  : const Text('data');
        },
      ),
    );
  }

  @override
  Ticker createTicker(TickerCallback onTick) {
    return Ticker(onTick);
  }
}

final class _SubMonthList extends StatelessWidget {
  const _SubMonthList();

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: SubLength.values.length,
      itemBuilder: (BuildContext context, int index) {
        return ListTile(
          title: Text(
            SubLength.values[index].name.replaceFirst(
              SubLength.values[index].name[0],
              SubLength.values[index].name[0].toUpperCase(),
            ),
          ),
          onTap: () {},
        );
      },
    );
  }
}

final class _SubscriptionDateTimePicker extends StatelessWidget {
  const _SubscriptionDateTimePicker({
    required this.subView,
    required this.subDetailNotifier,
    required this.checkPickedDate,
    required this.subDetail,
    required this.pageController,
  });
  final SubViewEnum subView;
  final SubDetailNotifier subDetailNotifier;
  final void Function(DateTime pickedDate) checkPickedDate;
  final Subscription? subDetail;
  final PageController pageController;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Assets.icons.icDatePicker.svg(
          package: 'gen',
          height: context.sized.dynamicHeight(0.35),
        ),
        Padding(
          padding: context.padding.low,
          child: Column(
            children: [
              const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Lütfen Bir Tarih Seçiniz',
                ),
              ),
              const Gap(15),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () async {
                    final pickedDate = await subDetailNotifier.selectDate(
                      context,
                    );
                    if (pickedDate != null) {
                      await pageController.nextPage(
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.easeInOut,
                      );
                    }
                  },
                  child: const Text(
                    'Tarih Seç',
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
