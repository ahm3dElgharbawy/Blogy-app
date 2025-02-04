import 'package:blog_app/core/common/widgets/services/custom_bloc_observer.dart';
import 'package:blog_app/core/helpers/navigation/navigation_helper.dart';
import 'package:blog_app/core/helpers/cache_helper.dart';
import 'package:blog_app/core/helpers/responsive_helpers/size_helper_extensions.dart';
import 'package:blog_app/core/helpers/responsive_helpers/size_provider.dart';
import 'package:blog_app/core/helpers/user_local_helper.dart';
import 'package:blog_app/core/theme/app_themes.dart';
import 'package:blog_app/features/layout/screens/app_layout.dart';
import 'package:blog_app/init_providers.dart';
import 'package:blog_app/localization/app_localizations.dart';
import 'package:blog_app/localization/cubit/locale_cubit.dart';
import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = CustomBlocObserver();
  await CacheHelper.init();
  UserLocal.init();

  runApp(
    DevicePreview(
      enabled: false,
      builder: (context) => const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedProvider(
      designSize: const Size(360, 690),
      height: context.screenHeight,
      width: context.screenWidth,
      child: MultiBlocProvider(
        providers: AppBlocProviders.init,
        child: BlocBuilder<LocaleCubit, LocaleState>(
          builder: (context, state) {
            if (state is ChangeLocaleState) {
              return MaterialApp(
                title: "Blogy",
                debugShowCheckedModeBanner: false,
                locale: state.locale, // Default local
                supportedLocales: const [Locale('en'), Locale('ar')],
                localizationsDelegates: const [
                  AppLocalizations.delegate,
                  GlobalMaterialLocalizations.delegate,
                  GlobalWidgetsLocalizations.delegate,
                  GlobalCupertinoLocalizations.delegate
                ],
                theme: AppThemes.light,
                navigatorKey: NavigationHelper.navigatorKey,
                builder: DevicePreview.appBuilder,
                home: const AppLayoutScreen(),
              );
            } else {
              return const SizedBox();
            }
          },
        ),
      ),
    );
  }
}
