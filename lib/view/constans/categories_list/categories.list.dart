import 'package:e_commerce/model/categories_model/categories_model.dart';
import 'package:e_commerce/view/constans/app_assets_images/app_assets_images.dart';

import '../../../generated/l10n.dart';

List<CategoriesModel> categoriesList = [
  CategoriesModel(
    title: S.current.adidas,
    image: AppAssets.adidas,
  ),
  CategoriesModel(
    title: S.current.nike,
    image: AppAssets.nike,
  ),
  CategoriesModel(
    title: S.current.zara,
    image: AppAssets.zara,
  ),
  CategoriesModel(
    title: S.current.puma,
    image: AppAssets.puma,
  ),
  CategoriesModel(
    title: S.current.nb,
    image: AppAssets.nb,
  ),
];
