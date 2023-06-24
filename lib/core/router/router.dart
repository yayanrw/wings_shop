import 'package:auto_route/auto_route.dart';
import 'package:wings_shop/presentation/pages/cart/cart_page.dart';
import 'package:wings_shop/presentation/pages/detail/detail_page.dart';
import 'package:wings_shop/presentation/pages/home/home_page.dart';
import 'package:wings_shop/presentation/pages/login/login_page.dart';
import 'package:wings_shop/presentation/pages/profile/profile_page.dart';

part 'router.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'Page,Route')
class AppRouter extends _$AppRouter {
  @override
  List<AutoRoute> get routes => [
    AutoRoute(
      page: LoginRoute.page,
      initial: true,
    ),
    AutoRoute(
      page: HomeRoute.page,
    ),
    AutoRoute(
      page: CartRoute.page,
    ),
    AutoRoute(
      path: 'detail/:id',
      page: DetailRoute.page,
    ),
  ];
}