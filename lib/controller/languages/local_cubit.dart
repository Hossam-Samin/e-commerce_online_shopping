import 'package:bloc/bloc.dart';
import 'package:e_commerce/controller/languages/cach_helper_languages.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'local_state.dart';

class LocalCubit extends Cubit<ChangeLocaleState> {
  LocalCubit() : super(ChangeLocaleState(locale: const Locale('en')));

  static LocalCubit get(context) => BlocProvider.of(context);

  Future<void> getSavedLanguages() async {
    final cachedLanguagesCode =
        await CachHelperLanguages().getCachLangugeCode();
    emit(ChangeLocaleState(locale: Locale(cachedLanguagesCode)));
  }

  Future<void> changeLanguages(String languageCode) async {
    await CachHelperLanguages().setCachLanguageCode(languageCode);
    emit(ChangeLocaleState(locale: Locale(languageCode)));
  }
}
