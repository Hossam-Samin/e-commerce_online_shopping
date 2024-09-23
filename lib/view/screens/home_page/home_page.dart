import 'package:e_commerce/controller/categories_onboard/categories_onboard_cubit.dart';
import 'package:e_commerce/controller/categories_onboard/categories_onboard_state.dart';
import 'package:e_commerce/controller/favirote_feature/fav_cubit.dart';
import 'package:e_commerce/controller/favirote_feature/fav_state.dart';
import 'package:e_commerce/model/categories_model/brand_model.dart';
import 'package:e_commerce/view/screens/fav_page/fav_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../generated/l10n.dart';
import '../../constans/categories_list/brand_list.dart';
import '../../constans/categories_list/categories.list.dart';
import '../../constans/categories_onboard_list/categories_onboard_list.dart';
import '../../constans/custom_categories/custom_categories.dart';
import '../../widgets/custom_categories_card.dart';
import '../../widgets/custom_textField.dart';
import '../drawer/drawer_screen.dart';
import 'package:badges/badges.dart' as badges;
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../push_notification/notification_bottom_sheet.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final zoomDrawerController = ZoomDrawerController();
  final GlobalKey<ScaffoldState> _drawerKey = GlobalKey<ScaffoldState>();
  final TextEditingController _searchController = TextEditingController();
  int currentCategories = 0;
  List<BrandModel> displayCategoriesList = List.from(allBrand);

  void updateList(String value) {
    setState(() {
      displayCategoriesList = allBrand
          .where((element) =>
              element.title.toLowerCase().contains(value.toLowerCase()))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CategoriesOnboardCubit, CategoriesOnboardState>(
      listener: (context, state) {},
      builder: (context, state) {
        CategoriesOnboardCubit categoriesOnboardCubit =
            BlocProvider.of(context);
        return Scaffold(
          key: _drawerKey,
          drawer: DrawerScreen(),
          body: SingleChildScrollView(
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      height: 40,
                      width: 40,
                      margin:
                          const EdgeInsets.only(top: 40, left: 10, right: 10),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16),
                          color: Colors.grey.withOpacity(.3)),
                      child: IconButton(
                        onPressed: () {
                          if (ZoomDrawer.of(context)!.isOpen()) {
                            zoomDrawerController.toggle;
                            _drawerKey.currentState!.isDrawerOpen;
                            ZoomDrawer.of(context)!.close();
                          } else {
                            ZoomDrawer.of(context)!.open();
                          }
                        },
                        //  drawerController.toggle,
                        icon: const Icon(Icons.sort_rounded, size: 16),
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(
                          top: 40,
                        ),
                        child: Card(
                            color: Colors.grey.withOpacity(.3),
                            elevation: 0,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: CustomTextField(
                              controller: _searchController,
                              onChange: (value) => updateList(value),
                              hintText: S.of(context).search,
                              prefixIcon: const Icon(Icons.search_rounded),
                              suffixIcon: GestureDetector(
                                onTap: () {},
                                child: const Icon(Icons.keyboard_voice_rounded),
                              ),
                            )),
                      ),
                    ),
                    Stack(
                      children: [
                        Container(
                          height: 40,
                          width: 40,
                          margin: const EdgeInsets.only(
                              top: 40, left: 10, right: 10),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(16),
                              color: Colors.grey.withOpacity(.3)),
                          child: IconButton(
                            onPressed: () {
                              showModalBottomSheet(
                                clipBehavior: Clip.antiAlias,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(16),
                                ),
                                context: context,
                                builder: (context) {
                                  return const NotificationBottomSheet();
                                },
                              );
                            },
                            icon: const Icon(Icons.notifications_rounded,
                                size: 20),
                          ),
                        ),
                        Positioned(
                          top: 55,
                          right: 20,
                          child: Container(
                            height: 8,
                            width: 8,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: Colors.green),
                          ),
                        ),
                      ],
                    ),
                    Container(
                      height: 40,
                      width: 40,
                      margin: const EdgeInsets.only(top: 40, right: 10,bottom: 2),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16),
                          color: Colors.grey.withOpacity(.3)),
                      child: badges.Badge(
                        badgeStyle:
                            badges.BadgeStyle(badgeColor: Colors.red.shade200),
                        badgeContent:
                            BlocConsumer<FaviroteCubit, FaviroteState>(
                                listener: (context, state) {},
                                builder: (context, state) {
                                  FaviroteCubit faviroteCubit =
                                      BlocProvider.of(context);
                                  return Text(
                                    faviroteCubit.getCounter().toString(),
                                    style: const TextStyle(
                                        fontSize: 10, fontFamily: "Rubik"),
                                  );
                                }),
                        badgeAnimation: const badges.BadgeAnimation.rotation(
                            animationDuration: Duration(milliseconds: 500)),
                        position: badges.BadgePosition.topEnd(),
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const FavScreen(),
                              ));
                        },
                        child: IconButton(
                          onPressed: () {},
                          icon:
                              const Icon(Icons.shopping_cart_rounded, size: 20),
                        ),
                      ),
                    ),
                  ],
                ),
                Container(
                  margin: const EdgeInsets.only(left: 5, right: 5),
                  height: 200,
                  child: PageView.builder(
                    controller: categoriesOnboardCubit.pageController,
                    onPageChanged: (value) {
                      categoriesOnboardCubit.onChangePage(value);
                    },
                    itemCount: categoriesOnboardList.length,
                    itemBuilder: (context, index) => Container(
                      height: 150,
                      width: 300,
                      margin: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(18),
                          image: DecorationImage(
                            image:
                                AssetImage(categoriesOnboardList[index].images),
                            fit: BoxFit.fill,
                            opacity: .4,
                          )),
                      child: Column(
                        children: [
                          ListTile(
                            title: Text(
                              categoriesOnboardList[index].title,
                              style: const TextStyle(fontFamily: "Rubik"),
                            ),
                            subtitle: Text(
                              categoriesOnboardList[index].subtitle,
                              style: const TextStyle(
                                  fontSize: 12, fontFamily: "Rubik"),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 50, right: 250),
                            child: MaterialButton(
                              onPressed: () {},
                              color: Colors.deepPurple.shade100,
                              elevation: 0,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(16),
                              ),
                              child: Text(
                                S.of(context).button_onboarding_categories,
                                style: const TextStyle(fontFamily: "Rubik"),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ...List.generate(
                      categoriesOnboardList.length,
                      (index) => AnimatedContainer(
                        duration: const Duration(milliseconds: 800),
                        margin: const EdgeInsets.only(right: 5),
                        height: 6,
                        width: categoriesOnboardCubit.currentPosition == index
                            ? 20
                            : 6,
                        decoration: BoxDecoration(
                          color: Colors.brown.shade200,
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.only(left: 8, right: 8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        S.of(context).brand,
                        style: const TextStyle(fontFamily: "Rubik"),
                      ),
                      Text(
                        S.of(context).see_all,
                        style: const TextStyle(fontFamily: "Rubik"),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                Container(
                  margin: const EdgeInsets.only(left: 5, right: 5),
                  height: 100,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: categoriesList.length,
                    itemBuilder: (context, index) => GestureDetector(
                      onTap: () {
                        setState(
                          () {
                            currentCategories = index;
                          },
                        );
                      },
                      child: AnimatedContainer(
                        width: 70,
                        margin: const EdgeInsets.only(left: 5, right: 5),
                        duration: const Duration(microseconds: 3000),
                        decoration: BoxDecoration(
                            border: currentCategories == index
                                ? Border.all(color: Colors.deepPurple, width: 2)
                                : null,
                            borderRadius: BorderRadius.circular(18)),
                        child: CustomCategories(
                          images: categoriesList[index].image,
                          title: categoriesList[index].title,
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.only(left: 8, right: 8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        S.of(context).new_arial,
                        style: const TextStyle(fontFamily: "Rubik"),
                      ),
                      Text(
                        S.of(context).see_all,
                        style: const TextStyle(fontFamily: "Rubik"),
                      ),
                    ],
                  ),
                ),
                if (currentCategories == 0)
                  Container(
                    margin: const EdgeInsets.only(left: 10, right: 10),
                    height: 200,
                    child: GridView.builder(
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2),
                      itemCount: displayCategoriesList.length,
                      itemBuilder: (context, index) {
                        return CustomCategoriesCard(
                          image: displayCategoriesList[index].images,
                          title: displayCategoriesList[index].title,
                          price: displayCategoriesList[index].price,
                        );
                      },
                    ),
                  ),
                if (currentCategories == 1)
                  Container(
                    margin: const EdgeInsets.only(left: 10, right: 10),
                    height: 200,
                    child: GridView.builder(
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2),
                      itemCount: displayCategoriesList.length,
                      itemBuilder: (context, index) {
                        return CustomCategoriesCard(
                          image: displayCategoriesList[index].images,
                          title: displayCategoriesList[index].title,
                          price: displayCategoriesList[index].price,
                        );
                      },
                    ),
                  ),
                if (currentCategories == 2)
                  Container(
                    margin: const EdgeInsets.only(left: 10, right: 10),
                    height: 200,
                    child: GridView.builder(
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2),
                      itemCount: displayCategoriesList.length,
                      itemBuilder: (context, index) {
                        return CustomCategoriesCard(
                          image: displayCategoriesList[index].images,
                          title: displayCategoriesList[index].title,
                          price: displayCategoriesList[index].price,
                        );
                      },
                    ),
                  ),
                if (currentCategories == 3)
                  Container(
                    margin: const EdgeInsets.only(left: 10, right: 10),
                    height: 200,
                    child: GridView.builder(
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2),
                      itemCount: displayCategoriesList.length,
                      itemBuilder: (context, index) {
                        return CustomCategoriesCard(
                          image: displayCategoriesList[index].images,
                          title: displayCategoriesList[index].title,
                          price: displayCategoriesList[index].price,
                        );
                      },
                    ),
                  ),
                if (currentCategories == 4)
                  Container(
                    margin: const EdgeInsets.only(left: 10, right: 10),
                    height: 200,
                    child: GridView.builder(
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2),
                      itemCount: displayCategoriesList.length,
                      itemBuilder: (context, index) {
                        return CustomCategoriesCard(
                          image: displayCategoriesList[index].images,
                          title: displayCategoriesList[index].title,
                          price: displayCategoriesList[index].price,
                        );
                      },
                    ),
                  ),
              ],
            ),
          ),
        );
      },
    );
  }
}
