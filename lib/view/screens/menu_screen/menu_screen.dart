import 'package:e_commerce/controller/languages/local_cubit.dart';
import 'package:e_commerce/controller/languages/local_state.dart';
import 'package:e_commerce/controller/payment/payment_manager.dart';
import 'package:e_commerce/view/constans/app_assets_images/app_assets_images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../controller/theme/theme_cubit.dart';
import '../../../generated/l10n.dart';
import '../login_screen/login_screen.dart';

class MenuScreen extends StatefulWidget {
  const MenuScreen({super.key});

  @override
  State<MenuScreen> createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen> {
  bool iconBoll = false;
  IconData iconLight = Icons.wb_sunny_rounded;
  IconData iconDark = Icons.nights_stay_rounded;
  bool switchIcon = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.only(top: 200, right: 60),
              decoration: BoxDecoration(
                  image: const DecorationImage(
                    image: AssetImage(AppAssets.clothesOnboard),
                    opacity: 0.4,
                    alignment: Alignment.topLeft,
                    fit: BoxFit.cover,
                  ),
                  borderRadius: BorderRadius.circular(20)),
              child: const CircleAvatar(
                radius: 50,
                backgroundImage: AssetImage(AppAssets.myUserAcccount1),
              ),
            ),
            const ListTile(
              contentPadding: EdgeInsets.only(left: 10, right: 25),
              title: Text(
                "Hossam Samin",
                style: TextStyle(fontFamily: "Rubik"),
              ),
              subtitle: Text(
                "hossamsamin505@gmail.com",
                style: TextStyle(fontFamily: "Rubik", fontSize: 9),
              ),
            ),
            ListTile(
              contentPadding: const EdgeInsets.only(left: 10, right: 25),
              title: Text(
                S.of(context).theme,
                style: const TextStyle(fontFamily: "Rubik"),
              ),
              trailing: IconButton(
                onPressed: () {
                  setState(() {
                    iconBoll = !iconBoll;
                  });
                  final cubit = context.read<ThemeCubit>();
                  cubit.toggelTheme();
                },
                icon: Icon(iconBoll == false ? iconLight : iconDark),
              ),
            ),
            ListTile(
              contentPadding: const EdgeInsets.only(left: 10, right: 25),
              title: Text(
                S.of(context).lang,
                style: const TextStyle(fontFamily: "Rubik"),
              ),
              trailing: BlocBuilder<LocalCubit, ChangeLocaleState>(
                  builder: (context, state) {
                return DropdownButton<String>(
                  onChanged: (String? value) {
                    if (value != null) {
                      context.read<LocalCubit>().changeLanguages(value);
                    }
                  },
                  value: state.locale.languageCode,
                  icon: const Icon(Icons.arrow_drop_down_rounded),
                  items: ['en', 'ar'].map((String items) {
                    return DropdownMenuItem<String>(
                      value: items,
                      child: Text(items),
                    );
                  }).toList(),
                );
              }),
            ),
            ListTile(
              contentPadding: const EdgeInsets.only(left: 10, right: 25),
              title: Text(
                S.of(context).notify,
                style: const TextStyle(fontFamily: "Rubik", fontSize: 13.5),
              ),
              trailing: IconButton(
                  onPressed: () {
                    setState(() {
                      switchIcon = !switchIcon;
                    });
                  },
                  icon: switchIcon == false
                      ? const Icon(Icons.toggle_off_sharp)
                      : const Icon(
                          Icons.toggle_on_sharp,
                          color: Colors.lightBlue,
                        )),
            ),
            ListTile(
              contentPadding: const EdgeInsets.only(left: 10, right: 25),
              title: Text(
                S.of(context).pay,
                style: const TextStyle(fontFamily: "Rubik"),
              ),
              trailing: IconButton(
                onPressed: () => PaymentManager.makePayment(120, "USD"),
                icon: const Icon(Icons.payment_rounded),
              ),
            ),
            const SizedBox(height: 35),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(),
                  child: MaterialButton(
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(18),
                            ),
                            title: const Text("Are you sure to Logout ?",
                                style: TextStyle(fontFamily: "Rubik")),
                            actions: [
                              ListTile(
                                onTap: () {
                                  Navigator.pushAndRemoveUntil(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            const LoginScreen(),
                                      ),
                                      (route) => false);
                                },
                                title: const Text("Yes",
                                    style: TextStyle(fontFamily: "Rubik")),
                                trailing: const Icon(Icons.done_rounded,
                                    color: Colors.lightGreen),
                              ),
                              ListTile(
                                onTap: () {
                                  Navigator.pop(context);
                                },
                                title: const Text("No",
                                    style: TextStyle(fontFamily: "Rubik")),
                                trailing: const Icon(Icons.close_rounded,
                                    color: Colors.redAccent),
                              )
                            ],
                          );
                        },
                      );
                    },
                    color: Colors.red.shade100,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    elevation: 0,
                    child: Text(
                      S.of(context).logout,
                      style: const TextStyle(fontFamily: "Rubik"),
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                Container(
                  height: 40,
                  width: 40,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.red.shade100,
                  ),
                  child: IconButton(
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            title: const Text("Are you sure to Logout ?",
                                style: TextStyle(fontFamily: "Rubik")),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(18),
                            ),
                            actions: [
                              ListTile(
                                onTap: () {
                                  Navigator.pushAndRemoveUntil(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            const LoginScreen(),
                                      ),
                                      (route) => false);
                                },
                                title: const Text("Yes",
                                    style: TextStyle(fontFamily: "Rubik")),
                                trailing: const Icon(Icons.done_rounded,
                                    color: Colors.lightGreen),
                              ),
                              ListTile(
                                onTap: () {
                                  Navigator.pop(context);
                                },
                                title: const Text("No",
                                    style: TextStyle(fontFamily: "Rubik")),
                                trailing: const Icon(Icons.close_rounded,
                                    color: Colors.redAccent),
                              )
                            ],
                          );
                        },
                      );
                    },
                    icon: const Icon(
                      Icons.arrow_forward_ios_rounded,
                      size: 15,
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
