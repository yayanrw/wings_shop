import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wings_shop/core/theme/my_colors.dart';
import 'package:wings_shop/core/theme/my_text_theme.dart';
import 'package:wings_shop/core/utils/extension_helper.dart';
import 'package:wings_shop/core/utils/size_config.dart';
import 'package:wings_shop/domain/entities/carts/cart.dart';
import 'package:wings_shop/presentation/pages/cart/cart_notifier.dart';

class CartCard extends StatelessWidget {
  const CartCard({
    Key? key,
    required this.cart,
  }) : super(key: key);

  final Cart cart;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: SizeConfig.screenWidth! * 1,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                _buildImage(),
                Flexible(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Text(
                        cart.product.name,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: myTextTheme(
                                fontWeight: FontWeight.w900,
                                color: MyColors.textBlack)
                            .titleMedium,
                      ),
                      _buildCounter(context),
                      _buildDetailInfo(
                        item: "Harga / ${cart.unit}",
                        currency: cart.currency,
                        value: cart.price.format(),
                      ),
                      _buildDetailInfo(
                        item: "Subtotal",
                        currency: cart.currency,
                        value: (cart.price * cart.quantity).format(),
                      ),
                    ],
                  ),
                )
              ],
            ),
            const SizedBox(height: 8),
            const Divider(),
            const SizedBox(height: 8),
          ],
        ),
      ),
    );
  }

  Widget _buildImage() {
    return Container(
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
              tag: 'cart_image_${cart.id}',
              child: CachedNetworkImage(
                imageUrl: cart.product.imgUrl,
                fit: BoxFit.cover,
                placeholder: (context, url) =>
                    const Center(child: CircularProgressIndicator()),
                // Loading indicator
                errorWidget: (context, url, error) =>
                    const Icon(Icons.error), // Error widget
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
    );
  }

  Widget _buildCounter(BuildContext context) {
    return Row(
      children: [
        IconButton(
          icon: const Icon(Icons.remove),
          onPressed: () {
            Future.microtask(
              () => Provider.of<CartNotifier>(context, listen: false)
                  .updateQuantity(cart, cart.quantity - 1),
            );
          },
        ),
        Container(
          padding: const EdgeInsets.all(4),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: MyColors.secondaryLight,
          ),
          child: CircleAvatar(
            radius: 12,
            backgroundColor: MyColors.secondaryLight,
            child: Text(
              cart.quantity.toString(),
              style: myTextTheme(
                      color: MyColors.textBlack, fontWeight: FontWeight.w700)
                  .labelMedium,
            ),
          ),
        ),
        IconButton(
          icon: const Icon(Icons.add),
          onPressed: () {
            Future.microtask(
              () => Provider.of<CartNotifier>(context, listen: false)
                  .updateQuantity(cart, cart.quantity + 1),
            );
          },
        ),
      ],
    );
  }

  Widget _buildDetailInfo(
      {required String item, required String currency, required String value}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          item,
          style: myTextTheme(color: MyColors.textBlack).labelSmall,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              currency,
              style: myTextTheme(
                      color: MyColors.textBlack, fontWeight: FontWeight.w700)
                  .labelMedium,
            ),
            const SizedBox(
              width: 8,
            ),
            Text(
              value,
              style: myTextTheme(
                      color: MyColors.textBlack, fontWeight: FontWeight.w700)
                  .labelMedium,
            ),
          ],
        )
      ],
    );
  }
}
