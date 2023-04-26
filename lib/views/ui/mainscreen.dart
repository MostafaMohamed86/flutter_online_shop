import 'package:flutter/material.dart';
import 'package:flutter_online_shop/controllers/mainscreen_provider.dart';
import 'package:flutter_online_shop/views/shared/bottom_nav_widget.dart';
import 'package:flutter_online_shop/views/ui/cartpage.dart';
import 'package:flutter_online_shop/views/ui/homepage.dart';
import 'package:flutter_online_shop/views/ui/profile.dart';
import 'package:flutter_online_shop/views/ui/searchpage.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:provider/provider.dart';

class MainScreen extends StatelessWidget {
  MainScreen({super.key});

  List<Widget> pageList = [
    HomePage(),
    SearchPage(),
    HomePage(),
    CartPage(),
    ProfilePage()
  ];

  @override
  Widget build(BuildContext context) {
    return Consumer<MainScreenNotifier>(
      builder: (context, mainScreenNotifier, child) {
        return Scaffold(
        backgroundColor: const Color(0xFFE2E2E2),
        body: pageList[mainScreenNotifier.pageIndex],
        bottomNavigationBar: SafeArea(
            child: Padding(
          padding: EdgeInsets.all(8),
          child: Container(
            padding: EdgeInsets.all(12),
            margin: EdgeInsets.symmetric(horizontal: 10),
            decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.all(Radius.circular(16))),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                BottomNavWidget(
                  onTap: () {
                    mainScreenNotifier.pageIndex = 0;
                  },
                  icon: mainScreenNotifier.pageIndex == 0
                  ? MaterialCommunityIcons.home
                  : MaterialCommunityIcons.home_outline
                ),
                BottomNavWidget(
                  onTap: () {
                    mainScreenNotifier.pageIndex = 1;
                  },
                  icon: mainScreenNotifier.pageIndex == 1
                  ? Ionicons.search
                  : Ionicons.search_circle_outline
                ),
                BottomNavWidget(
                  onTap: () {
                    mainScreenNotifier.pageIndex = 2;
                  },
                  icon: mainScreenNotifier.pageIndex == 2
                  ? Ionicons.add
                  : Ionicons.add_circle_outline
                ),
                BottomNavWidget(
                  onTap: () {
                    mainScreenNotifier.pageIndex = 3;
                  },
                  icon: mainScreenNotifier.pageIndex == 3
                  ?Ionicons.cart
                  :Ionicons.cart_outline
                ),
                BottomNavWidget(
                  onTap: () {
                    mainScreenNotifier.pageIndex = 4;
                  },
                  icon: mainScreenNotifier.pageIndex == 4
                  ?Ionicons.person
                  :Ionicons.person_outline
                ),
              ],
            ),
          ),
        )),
      );
      },
    );
  }
}
