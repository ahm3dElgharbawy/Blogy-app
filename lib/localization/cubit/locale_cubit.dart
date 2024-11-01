
import 'dart:developer';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:blog_app/core/helpers/locale_cache_helper.dart';

part 'locale_state.dart';

class LocaleCubit extends Cubit<LocaleState> {
  LocaleCubit() : super(LocaleInitial());

  void getSavedLocale() async {
    String langCode = await LocaleCacheHelper.getCachedLangCode();
    emit(ChangeLocaleState(locale: Locale(langCode)));
  }

  void changeLocale(String langCode) async {
    final result = await LocaleCacheHelper.cacheLangCode(langCode);
    log(LocaleCacheHelper.langCode.toString());
    emit(ChangeLocaleState(locale: Locale(langCode)));
  }
}
