// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Dark mode`
  String get theme {
    return Intl.message(
      'Dark mode',
      name: 'theme',
      desc: '',
      args: [],
    );
  }

  /// `Languages`
  String get lang {
    return Intl.message(
      'Languages',
      name: 'lang',
      desc: '',
      args: [],
    );
  }

  /// `Notification`
  String get notify {
    return Intl.message(
      'Notification',
      name: 'notify',
      desc: '',
      args: [],
    );
  }

  /// `Payment`
  String get pay {
    return Intl.message(
      'Payment',
      name: 'pay',
      desc: '',
      args: [],
    );
  }

  /// `Logout`
  String get logout {
    return Intl.message(
      'Logout',
      name: 'logout',
      desc: '',
      args: [],
    );
  }

  /// `Online Shop`
  String get splash {
    return Intl.message(
      'Online Shop',
      name: 'splash',
      desc: '',
      args: [],
    );
  }

  /// `Online Order`
  String get onboarding_title1 {
    return Intl.message(
      'Online Order',
      name: 'onboarding_title1',
      desc: '',
      args: [],
    );
  }

  /// `Lorem ipsum dolor sit amet,\n Aenean commodo ligula eget dolor`
  String get onboarding_descrption1 {
    return Intl.message(
      'Lorem ipsum dolor sit amet,\n Aenean commodo ligula eget dolor',
      name: 'onboarding_descrption1',
      desc: '',
      args: [],
    );
  }

  /// `Easy Payment`
  String get onboarding_title2 {
    return Intl.message(
      'Easy Payment',
      name: 'onboarding_title2',
      desc: '',
      args: [],
    );
  }

  /// `Lorem ipsum dolor sit amet,\n Aenean commodo ligula eget dolor`
  String get onboarding_descrption2 {
    return Intl.message(
      'Lorem ipsum dolor sit amet,\n Aenean commodo ligula eget dolor',
      name: 'onboarding_descrption2',
      desc: '',
      args: [],
    );
  }

  /// `Highest Brands`
  String get onboarding_title3 {
    return Intl.message(
      'Highest Brands',
      name: 'onboarding_title3',
      desc: '',
      args: [],
    );
  }

  /// `Lorem ipsum dolor sit amet,\n Aenean commodo ligula eget dolor`
  String get onboarding_descrption3 {
    return Intl.message(
      'Lorem ipsum dolor sit amet,\n Aenean commodo ligula eget dolor',
      name: 'onboarding_descrption3',
      desc: '',
      args: [],
    );
  }

  /// `Good Product`
  String get onboarding_title4 {
    return Intl.message(
      'Good Product',
      name: 'onboarding_title4',
      desc: '',
      args: [],
    );
  }

  /// `Lorem ipsum dolor sit amet,\n Aenean commodo ligula eget dolor`
  String get onboarding_descrption4 {
    return Intl.message(
      'Lorem ipsum dolor sit amet,\n Aenean commodo ligula eget dolor',
      name: 'onboarding_descrption4',
      desc: '',
      args: [],
    );
  }

  /// `Good Services`
  String get onboarding_title5 {
    return Intl.message(
      'Good Services',
      name: 'onboarding_title5',
      desc: '',
      args: [],
    );
  }

  /// `Lorem ipsum dolor sit amet,\n Aenean commodo ligula eget dolor`
  String get onboarding_descrption5 {
    return Intl.message(
      'Lorem ipsum dolor sit amet,\n Aenean commodo ligula eget dolor',
      name: 'onboarding_descrption5',
      desc: '',
      args: [],
    );
  }

  /// `Start now`
  String get onboarding_button {
    return Intl.message(
      'Start now',
      name: 'onboarding_button',
      desc: '',
      args: [],
    );
  }

  /// `Welcome back !`
  String get header_login {
    return Intl.message(
      'Welcome back !',
      name: 'header_login',
      desc: '',
      args: [],
    );
  }

  /// `Email address`
  String get email_login {
    return Intl.message(
      'Email address',
      name: 'email_login',
      desc: '',
      args: [],
    );
  }

  /// `Password`
  String get password_login {
    return Intl.message(
      'Password',
      name: 'password_login',
      desc: '',
      args: [],
    );
  }

  /// `Forget Password ?`
  String get forget_password {
    return Intl.message(
      'Forget Password ?',
      name: 'forget_password',
      desc: '',
      args: [],
    );
  }

  /// `Login`
  String get button_login {
    return Intl.message(
      'Login',
      name: 'button_login',
      desc: '',
      args: [],
    );
  }

  /// `Don’t have any account ?`
  String get des_login {
    return Intl.message(
      'Don’t have any account ?',
      name: 'des_login',
      desc: '',
      args: [],
    );
  }

  /// `Sign up`
  String get signup_in_login {
    return Intl.message(
      'Sign up',
      name: 'signup_in_login',
      desc: '',
      args: [],
    );
  }

  /// `OR`
  String get or {
    return Intl.message(
      'OR',
      name: 'or',
      desc: '',
      args: [],
    );
  }

  /// `Facebook`
  String get facebook_login {
    return Intl.message(
      'Facebook',
      name: 'facebook_login',
      desc: '',
      args: [],
    );
  }

  /// `Google`
  String get google_login {
    return Intl.message(
      'Google',
      name: 'google_login',
      desc: '',
      args: [],
    );
  }

  /// `Welcome to Sign up !`
  String get header_signup {
    return Intl.message(
      'Welcome to Sign up !',
      name: 'header_signup',
      desc: '',
      args: [],
    );
  }

  /// `Create Account`
  String get create_account {
    return Intl.message(
      'Create Account',
      name: 'create_account',
      desc: '',
      args: [],
    );
  }

  /// `User Name`
  String get username_signup {
    return Intl.message(
      'User Name',
      name: 'username_signup',
      desc: '',
      args: [],
    );
  }

  /// `Email address`
  String get email_signup {
    return Intl.message(
      'Email address',
      name: 'email_signup',
      desc: '',
      args: [],
    );
  }

  /// `Password`
  String get password_signup {
    return Intl.message(
      'Password',
      name: 'password_signup',
      desc: '',
      args: [],
    );
  }

  /// `confirm Password`
  String get confirm_password_signup {
    return Intl.message(
      'confirm Password',
      name: 'confirm_password_signup',
      desc: '',
      args: [],
    );
  }

  /// `Phone number`
  String get phone_signup {
    return Intl.message(
      'Phone number',
      name: 'phone_signup',
      desc: '',
      args: [],
    );
  }

  /// `Sign up`
  String get button_signup {
    return Intl.message(
      'Sign up',
      name: 'button_signup',
      desc: '',
      args: [],
    );
  }

  /// `Already have an account ?`
  String get des_signup {
    return Intl.message(
      'Already have an account ?',
      name: 'des_signup',
      desc: '',
      args: [],
    );
  }

  /// `Login`
  String get login_in_signup {
    return Intl.message(
      'Login',
      name: 'login_in_signup',
      desc: '',
      args: [],
    );
  }

  /// `Verification`
  String get header_verify {
    return Intl.message(
      'Verification',
      name: 'header_verify',
      desc: '',
      args: [],
    );
  }

  /// `Email address`
  String get forget_pass_by_email {
    return Intl.message(
      'Email address',
      name: 'forget_pass_by_email',
      desc: '',
      args: [],
    );
  }

  /// `Verify Email`
  String get verify_email {
    return Intl.message(
      'Verify Email',
      name: 'verify_email',
      desc: '',
      args: [],
    );
  }

  /// `Search ...`
  String get search {
    return Intl.message(
      'Search ...',
      name: 'search',
      desc: '',
      args: [],
    );
  }

  /// `New Collection`
  String get title_onboarding_categories {
    return Intl.message(
      'New Collection',
      name: 'title_onboarding_categories',
      desc: '',
      args: [],
    );
  }

  /// `Discount 50% for\n the first transaction`
  String get subtitle_onboarding_categories {
    return Intl.message(
      'Discount 50% for\n the first transaction',
      name: 'subtitle_onboarding_categories',
      desc: '',
      args: [],
    );
  }

  /// `Shop now`
  String get button_onboarding_categories {
    return Intl.message(
      'Shop now',
      name: 'button_onboarding_categories',
      desc: '',
      args: [],
    );
  }

  /// `Brand`
  String get brand {
    return Intl.message(
      'Brand',
      name: 'brand',
      desc: '',
      args: [],
    );
  }

  /// `See All`
  String get see_all {
    return Intl.message(
      'See All',
      name: 'see_all',
      desc: '',
      args: [],
    );
  }

  /// `Adidas`
  String get adidas {
    return Intl.message(
      'Adidas',
      name: 'adidas',
      desc: '',
      args: [],
    );
  }

  /// `Nike`
  String get nike {
    return Intl.message(
      'Nike',
      name: 'nike',
      desc: '',
      args: [],
    );
  }

  /// `Zara`
  String get zara {
    return Intl.message(
      'Zara',
      name: 'zara',
      desc: '',
      args: [],
    );
  }

  /// `Puma`
  String get puma {
    return Intl.message(
      'Puma',
      name: 'puma',
      desc: '',
      args: [],
    );
  }

  /// `NB`
  String get nb {
    return Intl.message(
      'NB',
      name: 'nb',
      desc: '',
      args: [],
    );
  }

  /// `New Arial`
  String get new_arial {
    return Intl.message(
      'New Arial',
      name: 'new_arial',
      desc: '',
      args: [],
    );
  }

  /// `Casual full set`
  String get title_categoris1 {
    return Intl.message(
      'Casual full set',
      name: 'title_categoris1',
      desc: '',
      args: [],
    );
  }

  /// `Best Quality`
  String get title_categoris2 {
    return Intl.message(
      'Best Quality',
      name: 'title_categoris2',
      desc: '',
      args: [],
    );
  }

  /// `Home`
  String get applayout_home {
    return Intl.message(
      'Home',
      name: 'applayout_home',
      desc: '',
      args: [],
    );
  }

  /// `Fav`
  String get applayout_fav {
    return Intl.message(
      'Fav',
      name: 'applayout_fav',
      desc: '',
      args: [],
    );
  }

  /// `My Order`
  String get applayout_order {
    return Intl.message(
      'My Order',
      name: 'applayout_order',
      desc: '',
      args: [],
    );
  }

  /// `Profile`
  String get applayout_profile {
    return Intl.message(
      'Profile',
      name: 'applayout_profile',
      desc: '',
      args: [],
    );
  }

  /// `Total Price: $`
  String get total_price {
    return Intl.message(
      'Total Price: \$',
      name: 'total_price',
      desc: '',
      args: [],
    );
  }

  /// `Payment`
  String get payment {
    return Intl.message(
      'Payment',
      name: 'payment',
      desc: '',
      args: [],
    );
  }

  /// `Camera`
  String get camera {
    return Intl.message(
      'Camera',
      name: 'camera',
      desc: '',
      args: [],
    );
  }

  /// `Gallary`
  String get gallary {
    return Intl.message(
      'Gallary',
      name: 'gallary',
      desc: '',
      args: [],
    );
  }

  /// `I am Flutter Developer`
  String get des_profile {
    return Intl.message(
      'I am Flutter Developer',
      name: 'des_profile',
      desc: '',
      args: [],
    );
  }

  /// `User Name`
  String get username_profile {
    return Intl.message(
      'User Name',
      name: 'username_profile',
      desc: '',
      args: [],
    );
  }

  /// `E-Mail`
  String get email_profile {
    return Intl.message(
      'E-Mail',
      name: 'email_profile',
      desc: '',
      args: [],
    );
  }

  /// `Description`
  String get description_profile {
    return Intl.message(
      'Description',
      name: 'description_profile',
      desc: '',
      args: [],
    );
  }

  /// `Edit`
  String get button_edit_profile {
    return Intl.message(
      'Edit',
      name: 'button_edit_profile',
      desc: '',
      args: [],
    );
  }

  /// `Add`
  String get add {
    return Intl.message(
      'Add',
      name: 'add',
      desc: '',
      args: [],
    );
  }

  /// `Delete`
  String get delete {
    return Intl.message(
      'Delete',
      name: 'delete',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'ar'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
