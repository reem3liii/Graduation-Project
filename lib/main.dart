import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:saas/modules/login_screen.dart';
import 'package:saas/modules/splash_screen.dart';
import 'package:saas/shared/bloc/cubit.dart';
import 'package:saas/shared/bloc/states.dart';
import 'package:saas/shared/cache_helper.dart';
import 'package:saas/shared/design/themes.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter/services.dart';
import 'package:saas/shared/dio_helper.dart';

import 'modules/for_admin/admin_home_screen.dart';

bool isArabic = false;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  //Bloc.observer = MyBlocObserver();
  DioHelper.init();
  await CacheHelper.init();

  /*Widget widget;
  bool? splash = CacheHelper.getData(key: 'splash');
  String? token = CacheHelper.getData(key: 'token');

  if (splash != null) {
    if (token != null) {
      widget = HomeAdminScreen();
    } else {
      widget = LoginScreen();
    }
  } else {
    widget = Splash();
  }*/

  runApp(MyApp(
    //startWidget: widget,
  ));
}

class MyApp extends StatelessWidget {
  static final ValueNotifier<ThemeMode> themeNotifier =
      ValueNotifier(ThemeMode.light);
  //final bool lightMode;
  //final Widget startWidget;
  const MyApp({
    Key? key,
    //required this.startWidget, 
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<ThemeMode>(
        valueListenable: themeNotifier,
        builder: (_, ThemeMode currentMode, __) {
          return MaterialApp(
            // Remove the debug banner
            debugShowCheckedModeBanner: false,
            theme: lightTheme,
            darkTheme: darkTheme,
            themeMode: currentMode,
            home: const Splash(),//startWidget,
            localizationsDelegates: const [
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
            supportedLocales: [
              isArabic ? const Locale('ar', 'AE') : const Locale('en', ''),
            ],
          );
        });
    //SystemChrome.setEnabledSystemUIOverlays([]);
    /*return BlocProvider(
      create: (BuildContext context) => AppCubit(),
      child: BlocConsumer<AppCubit,AppStates>(
        listener: (BuildContext context,AppStates state){},
        builder: (BuildContext context,AppStates state){
          return MaterialApp(
            themeMode: AppCubit.get(context).isLightTheme? ThemeMode.light:ThemeMode.dark,
            theme: lightTheme,
            darkTheme: darkTheme,
            debugShowCheckedModeBanner: false,
            home: const Splash(),
            localizationsDelegates: const [
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
            supportedLocales: [
              isArabic ? const Locale('ar', 'AE') : const Locale('en', ''),
            ],
          );
        },
      ),
    );*/ /*MaterialApp(
      home: const Splash(),
      debugShowCheckedModeBanner: false,
      theme: darkTheme,
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: [
        isArabic ? const Locale('ar', 'AE') : const Locale('en', ''),
      ],
    );*/
  }
}
