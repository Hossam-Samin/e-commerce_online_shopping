import 'package:e_commerce/controller/categories_onboard/categories_onboard_cubit.dart';
import 'package:e_commerce/controller/favirote_feature/fav_cubit.dart';
import 'package:e_commerce/controller/onboarding/onboarding_cubit.dart';
import 'package:e_commerce/controller/profile_editing/profile_editing_cubit.dart';
import 'package:e_commerce/firebase_options.dart';
import 'package:e_commerce/view/constans/keys/keys.dart';
import 'package:e_commerce/controller/payment/stripe_api_keys.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'controller/languages/local_cubit.dart';
import 'controller/languages/local_state.dart';
import 'controller/push_notification/firebase_api.dart';
import 'controller/theme/theme_cubit.dart';
import 'generated/l10n.dart';
import 'view/screens/push_notification/notification_bottom_sheet.dart';
import 'view/screens/splash_screen/splash_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await FirebaseApi().initNotifications();
  Stripe.publishableKey = ApiKeys.publishableKey;

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => OnBoardingCubit(),
        ),
        BlocProvider(
          create: (context) => CategoriesOnboardCubit(),
        ),
        BlocProvider(
          create: (context) => ProfileEditing(),
        ),
        BlocProvider(
          lazy: true,
          create: (context) => ThemeCubit(),
        ),
        BlocProvider(
          create: (context) => LocalCubit()..getSavedLanguages(),
        ),
        BlocProvider(
          create: (context) => FaviroteCubit(),
        ),
      ],
      child: BlocBuilder<ThemeCubit, ThemeData>(
          builder: (context, themeState) =>
              BlocBuilder<LocalCubit, ChangeLocaleState>(
                builder: (context, state) {
                  return MaterialApp(
                    locale: state.locale,
                    localizationsDelegates: const [
                      S.delegate,
                      GlobalMaterialLocalizations.delegate,
                      GlobalWidgetsLocalizations.delegate,
                      GlobalCupertinoLocalizations.delegate,
                    ],
                    supportedLocales: S.delegate.supportedLocales,
                    debugShowCheckedModeBanner: false,
                    theme: themeState,
                    home: const SplashScreen(),
                    navigatorKey: navigateKey,
                    routes: {
                      "/NotificationBottomSheet": (context) =>
                          const NotificationBottomSheet(),
                    },
                  );
                },
              )),
    );
  }
}
