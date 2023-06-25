import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:wings_shop/core/theme/my_colors.dart';
import 'package:wings_shop/core/utils/size_config.dart';
import 'package:wings_shop/domain/entities/products/product.dart';

class HeaderProduct extends StatelessWidget {
  const HeaderProduct({
    Key? key,
    required this.product,
  }) : super(key: key);

  final Product product;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: SizeConfig.screenWidth! * 1,
      height: 250,
      child: ClipRRect(
        child: Stack(
          fit: StackFit.expand,
          children: <Widget>[
            Hero(
              tag: 'product_image_${product.id}',
              child: Image.network(
                product.imgUrl,
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
            Positioned(
              top: 16,
              left: 16,
              child: InkWell(
                onTap: () {
                  context.router.pop();
                },
                child: Container(
                  alignment: Alignment.center,
                  height: 40,
                  width: 40,
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(50),
                  ),
                  child: const Padding(
                    padding: EdgeInsets.only(left: 4),
                    child: Icon(Icons.arrow_back_ios),
                  ),
                ),
              ),
            ),
            Positioned(
              top: 20,
              right: 16,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 5),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(14),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    const SizedBox(width: 5),
                    Text(
                      'Discount: ${product.discount}%',
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
