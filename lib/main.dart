import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:provider/provider.dart';
import 'package:wings_shop/core/config/constants.dart';
import 'package:wings_shop/core/di/injection.dart' as di;
import 'package:wings_shop/core/router/router.dart';
import 'package:wings_shop/core/theme/my_themes.dart';
import 'package:wings_shop/presentation/pages/cart/cart_notifier.dart';
import 'package:wings_shop/presentation/pages/home/home_notifier.dart';
import 'package:wings_shop/presentation/pages/login/login_notifier.dart';
import 'package:wings_shop/presentation/pages/profile/profile_notifier.dart';
import 'package:wings_shop/presentation/pages/search/search_notifier.dart';

import 'presentation/pages/detail/detail_notifier.dart';

Future<void> main() async {
  di.configureDependencies();

  void configLoading() {
    EasyLoading.instance
      ..displayDuration = const Duration(milliseconds: 2000)
      ..indicatorType = EasyLoadingIndicatorType.fadingCircle
      ..loadingStyle = EasyLoadingStyle.dark
      ..maskType = EasyLoadingMaskType.none
      ..dismissOnTap = false;
  }

  runApp(MyApp());
  configLoading();
}

class MyApp extends StatelessWidget {
  final AppRouter _appRouter = AppRouter();

  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => di.getIt<LoginNotifier>()),
        ChangeNotifierProvider(create: (_) => di.getIt<HomeNotifier>()),
        ChangeNotifierProvider(create: (_) => di.getIt<DetailNotifier>()),
        ChangeNotifierProvider(create: (_) => di.getIt<CartNotifier>()),
        ChangeNotifierProvider(create: (_) => di.getIt<ProfileNotifier>()),
        ChangeNotifierProvider(create: (_) => di.getIt<SearchNotifier>()),
      ],
      child: MaterialApp.router(
        useInheritedMediaQuery: true,
        title: appTitle,
        debugShowCheckedModeBanner: false,
        theme: myThemes(),
        routerConfig: _appRouter.config(),
        builder: EasyLoading.init(),
      ),
    );
  }
}
