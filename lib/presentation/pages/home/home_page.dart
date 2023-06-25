import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';
import 'package:provider/provider.dart';
import 'package:wings_shop/core/router/router.dart';
import 'package:wings_shop/core/theme/my_colors.dart';
import 'package:wings_shop/core/theme/my_text_theme.dart';
import 'package:wings_shop/core/utils/request_state.dart';
import 'package:wings_shop/core/utils/size_config.dart';
import 'package:wings_shop/domain/entities/products/product.dart';
import 'package:wings_shop/presentation/pages/home/home_notifier.dart';
import 'package:wings_shop/presentation/widgets/circular_button.dart';
import 'package:wings_shop/presentation/widgets/product_card.dart';
import 'package:wings_shop/presentation/widgets/section_title.dart';

@RoutePage()
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    Future.microtask(
      () async => await Provider.of<HomeNotifier>(context, listen: false)
          .fetchProducts(),
    );
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 24),
              _buildHomeHeader(context),
              const SizedBox(height: 24),
              _buildDiscountBanner(context),
              const SizedBox(height: 24),
              _buildProducts(context),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHomeHeader(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          _buildSearchField(context),
          CircularButton(
            icon: LineIcons.shoppingCart,
            isCountable: true,
            press: () {
              context.router.push(const CartRoute());
            },
          ),
          CircularButton(
            icon: LineIcons.user,
            isCountable: false,
            press: () {
              context.router.push(const ProfileRoute());
            },
          )
        ],
      ),
    );
  }

  Widget _buildSearchField(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.router.push(const CartRoute());
      },
      child: Container(
        width: SizeConfig.screenWidth! * 0.6,
        decoration: BoxDecoration(
          color: MyColors.secondaryLight2.withOpacity(0.1),
          borderRadius: BorderRadius.circular(16),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
          child: Row(
            children: <Widget>[
              const Icon(LineIcons.search),
              const SizedBox(width: 8),
              Expanded(
                child: Text(
                  "Cari produk yang anda cari",
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(color: MyColors.secondaryLight2),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildDiscountBanner(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: GestureDetector(
        onTap: () {
          // context.router.push(const UnderConstructionRoute());
        },
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(32),
            color: MyColors.purple,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Launching Wings Shop Apps",
                style: myTextTheme(
                  color: MyColors.white,
                  fontWeight: FontWeight.w500,
                ).titleSmall,
              ),
              Text(
                "Cashback 20%",
                style: myTextTheme(
                  color: MyColors.light,
                  fontWeight: FontWeight.w700,
                ).headlineLarge,
              ),
              Text(
                "*Syarat dan Ketentuan berlaku.",
                style: myTextTheme(
                  color: MyColors.primary,
                  fontWeight: FontWeight.w500,
                ).labelSmall,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildProducts(BuildContext context) {
    return Column(
      children: <Widget>[
        SectionTitle(
          text: "Produk kebanggan kami",
          isMoreable: false,
          press: () {
            // context.router.push(const UnderConstructionRoute());
          },
        ),
        const SizedBox(height: 16),
        Consumer<HomeNotifier>(
          builder: (
            BuildContext context,
            HomeNotifier data,
            Widget? child,
          ) {
            if (data.requestState == RequestState.loading) {
              return const Center(child: CircularProgressIndicator());
            } else if (data.requestState == RequestState.loaded) {
              if (data.products.isNotEmpty) {
                return ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: data.products.length,
                  itemBuilder: (BuildContext context, int index) {
                    final Product product = data.products[index];
                    return ProductCard(
                      key: Key(product.id.toString()),
                      product: product,
                      press: () {
                        context.router.push(DetailRoute(product: product));
                      },
                    );
                  },
                );
              } else {
                return const Center(
                  child: Text("Tidak ada produk"),
                );
              }
            } else {
              return Center(
                key: const Key('error_message'),
                child: Text(data.message),
              );
            }
          },
        ),
      ],
    );
  }

  void toLoginPage() async {
    if (!mounted) return;
    context.router.replace(const LoginRoute());
  }
}
