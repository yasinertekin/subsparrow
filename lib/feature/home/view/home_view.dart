import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:subsparrow/feature/home/view/mixin/home_view_mixin.dart';
import 'package:subsparrow/product/model/user/users.dart';

final class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State createState() => _HomeViewState();
}

final class _HomeViewState extends State<HomeView> with HomeViewMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<DocumentSnapshot<Users>>(
        stream: stopListening ? null : userDocument.snapshots(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.active) {
            if (snapshot.hasData) {
              final users = snapshot.data!.data();
              /*    final subPriceStrings = users?.subscriptions
                  .map(
                    (sub) => sub.subBasePrice.toString(),
                  )
                  .toList();

              final subPrices = subPriceStrings?.map(double.parse).toList();
              final totalSubPrice = subPrices?.fold(
                0.0,
                (previous, current) => previous + current,
              );*/
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('User Subscriptions:'),
                  if (users != null && users.subscriptions.isNotEmpty)
                    ListView.builder(
                      shrinkWrap: true,
                      itemCount: users.subscriptions.length,
                      itemBuilder: (context, index) {
                        final sub = users.subscriptions[index];
                        return Card(
                          child: ListTile(
                            leading: SvgPicture.network(
                              sub.subIcon.toString(),
                              height: 50,
                            ),
                            title: Text(
                              sub.subName.toString(),
                            ),
                            trailing: Text(
                              '${sub.subBasePrice} TL',
                            ),
                          ),
                        );
                      },
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
