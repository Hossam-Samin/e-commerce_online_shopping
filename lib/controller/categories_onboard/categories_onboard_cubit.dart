import 'package:bloc/bloc.dart';
import 'package:e_commerce/controller/categories_onboard/categories_onboard_state.dart';
import 'package:e_commerce/view/screens/login_screen/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../view/constans/static_list_onboarding/static_list_onboarding.dart';

class CategoriesOnboardCubit extends Cubit<CategoriesOnboardState> {
  CategoriesOnboardCubit() : super(InitBoard());

  static CategoriesOnboardCubit get(context) => BlocProvider.of(context);

  PageController pageController = PageController();
  int currentPosition = 0;

  next(context) {
    currentPosition++;

    if (currentPosition == onBoardingModelList.length) {
      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const LoginScreen(),
          ));
    }
    pageController.animateToPage(currentPosition,
        duration: const Duration(milliseconds: 800), curve: Curves.easeInOut);

    emit(SucessNextPage());
  }

  onChangePage(int index) {
    currentPosition = index;
    emit(SucessChangePage());
  }
}
