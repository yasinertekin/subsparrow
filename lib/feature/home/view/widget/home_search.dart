part of '../home_view.dart';

final class _HomeSearch extends StatelessWidget {
  const _HomeSearch({
    required this.users,
    required this.firebaseServices,
    required this.homeViewModel,
  });

  final Users? users;
  final FirebaseServices firebaseServices;
  final HomeViewModel homeViewModel;

  @override
  Widget build(BuildContext context) {
    return TextField(
      readOnly: true,
      onTap: () {
        context.route.navigateToPage(
          SearchView(
            subscriptions: users!.subscriptions,
            firebaseService: firebaseServices,
            homeViewModel: homeViewModel,
          ),
        );
      },
      keyboardType: TextInputType.text,
      textInputAction: TextInputAction.search,
      decoration: const InputDecoration(
        hintText: StringConstants.search,
        prefixIcon: Icon(Icons.search),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(10),
          ),
        ),
      ),
    );
  }
}
