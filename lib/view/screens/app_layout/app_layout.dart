import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:e_commerce/generated/l10n.dart';
import 'package:e_commerce/view/screens/home_page/home_page.dart';
import 'package:e_commerce/view/screens/my_order_page/my_order_page.dart';
import 'package:e_commerce/view/screens/profile_page/profile_page.dart';
import 'package:flutter/material.dart';

import '../fav_page/fav_page.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class AppLayout extends StatefulWidget {
  const AppLayout({Key? key}) : super(key: key);

  @override
  State<AppLayout> createState() => _AppLayoutState();
}

class _AppLayoutState extends State<AppLayout> {
  int _currentIndex = 0;
  List<Widget> screens = [
    const HomeScreen(),
    const FavScreen(),
    const MyOrderScreen(),
    const ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: screens[_currentIndex],
        bottomNavigationBar: Container(
          margin: const EdgeInsets.only(left: 25, right: 25, bottom: 10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(18),
          ),
          clipBehavior: Clip.antiAlias,
          child: BottomNavyBar(
            backgroundColor: Colors.amber.shade100,
            selectedIndex: _currentIndex,
            showElevation: true,
            onItemSelected: (index) => setState(() {
              _currentIndex = index;
            }),
            items: [
              BottomNavyBarItem(
                  icon: const Icon(Icons.home_filled),
                  inactiveColor: Colors.black,
                  textAlign: TextAlign.center,
                  title: Text(
                    S.of(context).applayout_home,
                    style: const TextStyle(fontFamily: "Rubik"),
                  ),
                  activeColor: Colors.grey),
              BottomNavyBarItem(
                  inactiveColor: Colors.black,
                  textAlign: TextAlign.center,
                  icon: const Icon(Icons.favorite_rounded),
                  title: Text(
                    S.of(context).applayout_fav,
                    style: const TextStyle(fontFamily: "Rubik"),
                  ),
                  activeColor: Colors.grey),
              BottomNavyBarItem(
                  inactiveColor: Colors.black,
                  textAlign: TextAlign.center,
                  icon: const FaIcon(FontAwesomeIcons.bagShopping, size: 22),
                  title: Text(
                    S.of(context).applayout_order,
                    style: const TextStyle(fontFamily: "Rubik"),
                  ),
                  activeColor: Colors.grey),
              BottomNavyBarItem(
                  inactiveColor: Colors.black,
                  textAlign: TextAlign.center,
                  icon: const Icon(Icons.person_2_rounded),
                  title: Text(
                    S.of(context).applayout_profile,
                    style: const TextStyle(fontFamily: "Rubik"),
                  ),
                  activeColor: Colors.grey),
            ],
          ),
        ));
  }
}
