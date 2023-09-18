import 'package:e_commerce/view/screens/login_screen/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../controller/onboarding/onboarding_cubit.dart';
import '../../../controller/onboarding/onboarding_state.dart';

import 'package:flutter_svg/svg.dart';

import '../../../generated/l10n.dart';
import '../../constans/static_list_onboarding/static_list_onboarding.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<OnBoardingCubit, OnBoardingState>(
      listener: (context, state) {},
      builder: (context, state) {
        OnBoardingCubit onBoardingCubit = BlocProvider.of(context);
        return Scaffold(
          body: SafeArea(
            child: PageView.builder(
              controller: onBoardingCubit.pageController,
              onPageChanged: (value) {
                onBoardingCubit.onChangePage(value);
              },
              itemCount: onBoardingModelList.length,
              itemBuilder: (context, index) {
                return SingleChildScrollView(
                  child: Column(
                    children: [
                      const SizedBox(height: 100),
                      SvgPicture.asset(
                        onBoardingModelList[index].image,
                        height: 250,
                        width: 200,
                      ),
                      const SizedBox(height: 40),
                      Text(
                        onBoardingModelList[index].title,
                        style: const TextStyle(
                          fontSize: 18,
                          fontFamily: "Rubik",
                        ),
                      ),
                      const SizedBox(height: 40),
                      Text(
                        onBoardingModelList[index].body,
                        style: const TextStyle(
                          color: Colors.grey,
                          fontFamily: "Rubik",
                        ),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 40),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ...List.generate(
                            onBoardingModelList.length,
                            (index) => AnimatedContainer(
                              duration: const Duration(milliseconds: 800),
                              margin: const EdgeInsets.only(right: 5),
                              height: 6,
                              width: onBoardingCubit.currentPosition == index
                                  ? 20
                                  : 6,
                              decoration: BoxDecoration(
                                color: Colors.redAccent,
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 60),
                      Row(
                        children: [
                          InkWell(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const LoginScreen(),
                                  ));
                            },
                            child: Padding(
                              padding:
                                  const EdgeInsets.only(left: 130, right: 50),
                              child: MaterialButton(
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            const LoginScreen(),
                                      ));
                                },
                                color: Colors.deepPurple.shade100,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(12)),
                                padding: const EdgeInsets.only(
                                    top: 10, bottom: 10, left: 25, right: 25),
                                child: Text(
                                  S.of(context).onboarding_button,
                                  style: const TextStyle(
                                    fontSize: 16,
                                    fontFamily: "Rubik",
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 20, right: 10),
                            child: Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(18),
                                  color: Colors.deepPurple.withOpacity(0.3)),
                              child: IconButton(
                                onPressed: () {
                                  onBoardingCubit.next(context);
                                },
                                icon:
                                    const Icon(Icons.arrow_forward_ios_rounded),
                              ),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                );
              },
            ),
          ),
        );
      },
    );
  }
}
