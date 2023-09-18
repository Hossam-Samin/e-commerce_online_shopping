// This statement form type list about on Boarding screen in app

import '../../../generated/l10n.dart';
import '../../../model/onboarding_model/onboarding_model.dart';
import '../app_assets_images/app_assets_images.dart';

List<OnboardingModel> onBoardingModelList = [
  OnboardingModel(
    title: S.current.onboarding_title1,
    image: AppAssets.onboarding1,
    body: S.current.onboarding_descrption1,
  ),
  OnboardingModel(
    title: S.current.onboarding_title2,
    image: AppAssets.onboarding2,
    body: S.current.onboarding_descrption2,
  ),
  OnboardingModel(
    title: S.current.onboarding_title3,
    image: AppAssets.onboarding3,
    body: S.current.onboarding_descrption3,
  ),
  OnboardingModel(
    title: S.current.onboarding_title4,
    image: AppAssets.onboarding4,
    body: S.current.onboarding_descrption4,
  ),
  OnboardingModel(
    title: S.current.onboarding_title5,
    image: AppAssets.onboarding5,
    body: S.current.onboarding_descrption5,
  ),
];
