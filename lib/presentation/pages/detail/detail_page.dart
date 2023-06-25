import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';
import 'package:wings_shop/core/config/constants.dart';
import 'package:wings_shop/core/theme/my_colors.dart';
import 'package:wings_shop/core/theme/my_text_theme.dart';
import 'package:wings_shop/core/utils/extension_helper.dart';
import 'package:wings_shop/core/utils/size_config.dart';
import 'package:wings_shop/domain/entities/products/product.dart';
import 'package:wings_shop/presentation/widgets/header_product.dart';

@RoutePage()
class DetailPage extends StatelessWidget {
  const DetailPage({super.key, required this.product});

  final Product product;

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    final double priceAfterDiscount =
        product.price - (product.price * product.discount / 100);

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(children: [
            HeaderProduct(product: product),
            const SizedBox(height: 8),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Flexible(
                      child: Padding(
                        padding: const EdgeInsets.only(left: 16),
                        child: Text.rich(
                          TextSpan(
                            children: <TextSpan>[
                              TextSpan(
                                text: '${product.name}\n',
                                style: myTextTheme(
                                  color: MyColors.secondary,
                                  fontWeight: FontWeight.w900,
                                ).titleLarge,
                              ),
                              if (product.discount != 0)
                              TextSpan(
                                text:
                                '${product.currency} ${product.price.format()}\n',
                                style: const TextStyle(fontSize: 10, decoration: TextDecoration.lineThrough,),
                              ),
                              //add break new line
                              TextSpan(
                                text:
                                    '${product.currency} ${priceAfterDiscount.format()}',
                                style: myTextTheme(
                                  color: MyColors.secondary,
                                  fontWeight: FontWeight.w900,
                                ).labelMedium,
                              ),
                              TextSpan(
                                text: '/ ${product.unit}',
                                style: TextStyle(
                                    color: MyColors.textGrey, fontSize: 9),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {},
                      child: Container(
                        padding: const EdgeInsets.all(16),
                        width: 64,
                        decoration: const BoxDecoration(
                          color: Color(0xFFFFE6E6),
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(20),
                            bottomLeft: Radius.circular(20),
                          ),
                        ),
                        child: const Icon(
                          LineIcons.addToShoppingCart,
                          color: Color(0xFFFF4848),
                        ),
                      ),
                    )
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(defaultPadding),
                  child: Text(product.dimension),
                )
              ],
            ),
          ]),
        ),
      ),
    );
  }
}
