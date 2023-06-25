import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';
import 'package:provider/provider.dart';
import 'package:wings_shop/core/router/router.dart';
import 'package:wings_shop/core/theme/my_colors.dart';
import 'package:wings_shop/core/utils/request_state.dart';
import 'package:wings_shop/core/utils/size_config.dart';
import 'package:wings_shop/domain/entities/products/product.dart';
import 'package:wings_shop/presentation/pages/search/search_notifier.dart';
import 'package:wings_shop/presentation/widgets/circular_button.dart';
import 'package:wings_shop/presentation/widgets/product_card.dart';

@RoutePage()
class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, () {
      Provider.of<SearchNotifier>(context, listen: false).setNull();
    });
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              const SizedBox(height: 24),
              _searchHeader(context),
              const SizedBox(height: 24),
              _buildProductList(context)
            ],
          ),
        ),
      ),
    );
  }

  Widget _searchHeader(BuildContext context) {
    Timer? _debounceTimer;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          CircularButton(
            icon: Icons.arrow_back_ios,
            isCountable: false,
            press: () {
              context.router.pop();
            },
          ),
          Container(
            width: SizeConfig.screenWidth! * 0.75,
            decoration: BoxDecoration(
              color: MyColors.secondaryLight2.withOpacity(0.1),
              borderRadius: BorderRadius.circular(16),
            ),
            child: TextField(
              autofocus: true,
              textInputAction: TextInputAction.search,
              style: TextStyle(color: MyColors.textBlack),
              decoration: InputDecoration(
                enabledBorder: InputBorder.none,
                focusedBorder: InputBorder.none,
                hintText: "Cari produk yang anda cari",
                prefixIcon: Icon(
                  LineIcons.search,
                  color: MyColors.dark,
                ),
                contentPadding:
                    const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
              ),
              onChanged: (value) {
                // Cancel any previous debounce timer
                _debounceTimer?.cancel();

                // Schedule a new debounce timer
                _debounceTimer = Timer(const Duration(milliseconds: 1000), () {
                  Provider.of<SearchNotifier>(context, listen: false)
                      .searchProducts(value);
                });
              },
              onSubmitted: (String value) {
                Provider.of<SearchNotifier>(context, listen: false)
                    .searchProducts(value);
              },
            ),
          )
        ],
      ),
    );
  }

  Widget _buildProductList(BuildContext context) {
    return Consumer<SearchNotifier>(
      builder: (context, data, _) {
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
                  product: product,
                  press: () {
                    context.router.push(
                      DetailRoute(product: product),
                    );
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
    );
  }
}
