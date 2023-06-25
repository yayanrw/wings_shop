import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';
import 'package:provider/provider.dart';
import 'package:wings_shop/core/config/constants.dart';
import 'package:wings_shop/core/theme/my_colors.dart';
import 'package:wings_shop/core/theme/my_text_theme.dart';
import 'package:wings_shop/core/utils/extension_helper.dart';
import 'package:wings_shop/core/utils/request_state.dart';
import 'package:wings_shop/domain/entities/carts/cart.dart';
import 'package:wings_shop/presentation/pages/cart/cart_notifier.dart';
import 'package:wings_shop/presentation/widgets/cart_card.dart';

@RoutePage()
class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  void initState() {
    super.initState();
    Future.microtask(
      () async =>
          await Provider.of<CartNotifier>(context, listen: false).fetchCarts(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(LineIcons.arrowLeft),
          onPressed: () {
            context.router.pop();
          },
        ),
        title: Text(
          "Keranjang",
          style: myTextTheme(color: MyColors.white).titleMedium,
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(defaultPadding),
            child: Consumer<CartNotifier>(
              builder: (context, data, _) {
                if (data.requestState == RequestState.loading) {
                  return const Center(child: CircularProgressIndicator());
                } else if (data.requestState == RequestState.loaded) {
                  if (data.carts.isNotEmpty) {
                    return Column(
                      children: [
                        ListView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: data.carts.length,
                          itemBuilder: (BuildContext context, int index) {
                            final Cart cart = data.carts[index];
                            return CartCard(
                              key: Key(cart.id.toString()),
                              cart: cart,
                            );
                          },
                        ),
                        Padding(
                          padding: const EdgeInsets.all(defaultPadding),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text("Grant Total",
                                  style: myTextTheme(color: MyColors.textBlack)
                                      .titleSmall),
                              Text(
                                data.grandTotal.format(),
                                style: myTextTheme(
                                        color: MyColors.textBlack,
                                        fontWeight: FontWeight.w700)
                                    .titleSmall,
                              ),
                            ],
                          ),
                        )
                      ],
                    );
                  } else {
                    return const Center(
                      child: Text("Tidak ada produk didalam keranjang"),
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
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(defaultPadding),
        child: SizedBox(
          width: double.infinity,
          child: ElevatedButton(
            onPressed: () async {
              await Provider.of<CartNotifier>(context, listen: false)
                  .submitTransaction();
            },
            style: ElevatedButton.styleFrom(
              foregroundColor: Colors.white,
              backgroundColor: MyColors.primary, // Disabled color #FDBD10
              textStyle: const TextStyle(color: Colors.white),
            ),
            child: const Text("Konfirmasi"),
          ),
        ),
      ),
    );
  }
}
