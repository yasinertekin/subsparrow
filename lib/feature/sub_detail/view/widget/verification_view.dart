part of '../sub_detail_view.dart';

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
