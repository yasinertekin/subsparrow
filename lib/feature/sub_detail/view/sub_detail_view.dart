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

part 'widget/sub_detail_app_bar.dart';

/// SubDetail
final class SubDetailView extends StatefulWidget {
  /// SubDetail constructor
  const SubDetailView({required this.subDetail, super.key});

  /// SubDetail key
  final Subscription? subDetail;

  @override
  State<SubDetailView> createState() => _SubDetailViewState();
}

class _SubDetailViewState extends State<SubDetailView> with SubDetailMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const _SubDetailAppBar(),
      body: PageView.builder(
        physics: const NeverScrollableScrollPhysics(),
        controller: pageController,
        itemCount: SubViewEnum.values.length,
        itemBuilder: (context, index) {
          switch (SubViewEnum.values[index]) {
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
                subDetailNotifier: subDetailNotifier,
                pageController: pageController,
              );
            case SubViewEnum.subPrice:
              // Handle subPrice case
              // You can return a different widget or perform specific actions for subPrice
              return Column(
                children: [
                  ListView.builder(
                    itemCount: 1,
                    itemBuilder: (BuildContext context, int index) {
                      return;
                    },
                  ),
                ],
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

final class _SubMonthList extends StatelessWidget {
  const _SubMonthList({
    required this.subDetailNotifier,
    required this.pageController,
  });

  final SubDetailNotifier subDetailNotifier;
  final PageController pageController;

  String _formatEnumName(SubLength enumValue) {
    final enumName = enumValue.toString().split('.').last;
    final words = enumName.split(RegExp('(?=[A-Z])'));

    for (var i = 0; i < words.length; i++) {
      words[i] = words[i][0].toUpperCase() + words[i].substring(1);
    }

    return words.join(' ');
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: SubLength.values.length,
      itemBuilder: (BuildContext context, int index) {
        final currentSubLength = SubLength.values[index];

        return ListTile(
          title: Text(
            _formatEnumName(currentSubLength),
          ),
          onTap: () async {
            subDetailNotifier.monthCount = subDetailNotifier.selectedDate.add(
              Duration(
                days: getSubscriptionDays(currentSubLength),
              ),
            );
            await pageController.nextPage(
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeInOut,
            );
          },
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
        Padding(
          padding: const EdgeInsets.all(8),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Text(
              'Abonelik Başlangıç Tarihiniz',
              style: context.general.textTheme.headlineSmall?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
        Assets.icons.icDatePicker.svg(
          package: 'gen',
          height: context.sized.dynamicHeight(0.35),
        ),
        Padding(
          padding: context.padding.low,
          child: Column(
            children: [
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
