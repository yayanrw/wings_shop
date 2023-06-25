import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';
import 'package:provider/provider.dart';
import 'package:wings_shop/core/theme/my_colors.dart';
import 'package:wings_shop/core/theme/my_text_theme.dart';
import 'package:wings_shop/presentation/pages/profile/profile_notifier.dart';

@RoutePage()
class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  void initState() {
    super.initState();
    Future.microtask(
      () async => await Provider.of<ProfileNotifier>(context, listen: false)
          .fetchUserCredentials(),
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
        title: Text("Profile", style: myTextTheme(color: MyColors.white).titleMedium,),
      ),
      body: SafeArea(
        child: SizedBox(
          width: double.infinity,
          child: Consumer<ProfileNotifier>(
            builder: (context, data, _) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const SizedBox(height: 72),
                  Image.asset("assets/images/wings.png", width: 200),
                  const SizedBox(height: 16),
                  Text(
                    data.userCredentials.email,
                    style: myTextTheme(color: MyColors.textBlack).titleMedium,
                  ),
                  Text(
                    data.userCredentials.name,
                    style: myTextTheme(color: MyColors.textBlack).titleMedium,
                  )
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
