import 'package:e_commerce/view/constans/app_assets_images/app_assets_images.dart';
import '../../../generated/l10n.dart';
import '../../../model/categories_onboard_model/categories_onboard_model.dart';

List<CategoriesOnboardModel> categoriesOnboardList = [
  CategoriesOnboardModel(
    title: S.current.title_onboarding_categories,
    subtitle: S.current.subtitle_onboarding_categories,
    images: AppAssets.clothesOnboard,
  ),
  CategoriesOnboardModel(
    title: S.current.title_onboarding_categories,
    subtitle: S.current.subtitle_onboarding_categories,
    images: AppAssets.clothesOnboard2,
  ),
  CategoriesOnboardModel(
    title: S.current.title_onboarding_categories,
    subtitle: S.current.subtitle_onboarding_categories,
    images: AppAssets.clothesOnboard3,
  ),
  CategoriesOnboardModel(
    title: S.current.title_onboarding_categories,
    subtitle: S.current.subtitle_onboarding_categories,
    images: AppAssets.clothesOnboard4,
  ),
];
