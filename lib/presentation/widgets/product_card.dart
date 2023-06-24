import 'package:flutter/material.dart';
import 'package:wings_shop/core/theme/my_colors.dart';
import 'package:wings_shop/core/theme/my_text_theme.dart';
import 'package:wings_shop/core/utils/extension_helper.dart';
import 'package:wings_shop/core/utils/size_config.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({
    Key? key,
    required this.imgUrl,
    required this.name,
    required this.press,
    required this.id,
    required this.price,
    required this.discount,
    required this.currency,
    required this.unit,
  }) : super(key: key);

  final int id;
  final String name;
  final String currency;
  final int price;
  final String unit;
  final int discount;
  final String imgUrl;
  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    final double priceAfterDiscount = price - (price * discount / 100);

    return InkWell(
      onTap: press,
      child: SizedBox(
        width: SizeConfig.screenWidth! * 1,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                height: 90,
                width: 130,
                margin: const EdgeInsets.only(right: 16),
                decoration: BoxDecoration(
                  boxShadow: <BoxShadow>[
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset: const Offset(0, 3), // changes position of shadow
                    ),
                  ],
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Stack(
                    fit: StackFit.expand,
                    children: <Widget>[
                      Hero(
                        tag: 'product_image_$id',
                        child: Image.network(
                          imgUrl,
                          fit: BoxFit.cover,
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: <Color>[
                              MyColors.secondary2.withOpacity(0.4),
                              MyColors.secondary2.withOpacity(0.15),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Flexible(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Text(
                      name,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: myTextTheme(
                              fontWeight: FontWeight.w900,
                              color: MyColors.textBlack)
                          .titleMedium,
                    ),
                    const SizedBox(height: 4),
                    if (discount != 0)
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            '$currency ${price.format()}',
                            style: const TextStyle(
                                decoration: TextDecoration.lineThrough,
                                fontSize: 12),
                          ),
                          const SizedBox(
                            width: 8,
                          ),
                          Text(
                            '$discount%',
                            style: myTextTheme(
                                    color: MyColors.secondary,
                                    fontWeight: FontWeight.w700)
                                .titleSmall,
                          ),
                        ],
                      ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          '$currency ${priceAfterDiscount.format()}',
                          style: myTextTheme(
                              color: MyColors.secondary,
                              fontWeight: FontWeight.w700)
                              .titleSmall,
                        ),
                        Text(
                          '/ $unit',
                          style: myTextTheme(
                              color: MyColors.secondary,
                              fontWeight: FontWeight.w400)
                              .labelSmall,
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
