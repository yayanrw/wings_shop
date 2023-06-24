import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';
import 'package:provider/provider.dart';
import 'package:wings_shop/core/config/constants.dart';
import 'package:wings_shop/core/router/router.dart';
import 'package:wings_shop/core/theme/my_colors.dart';
import 'package:wings_shop/core/theme/my_text_theme.dart';
import 'package:wings_shop/core/utils/request_state.dart';
import 'package:wings_shop/presentation/pages/login/login_notifier.dart';

@RoutePage()
class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() async {
      final loginNotifier = Provider.of<LoginNotifier>(context, listen: false);
      final loggedIn = await loginNotifier.isLoggedIn();
      if (loggedIn) {
        if (!mounted) return;
        context.router.replace(const HomeRoute());
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(defaultPadding),
            child: Consumer<LoginNotifier>(
              builder: (context, data, _) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 72),
                    _buildHeader(),
                    const SizedBox(height: 88),
                    _buildEmailFormField(data.emailController),
                    const SizedBox(height: 16),
                    _buildPasswordFormField(data.passwordController),
                    const SizedBox(height: 40),
                    _buildLoginButton(context, data),
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Login",
          style: myTextTheme(color: MyColors.textBlack).headlineLarge,
        ),
        Text(
          "Selamat datang di aplikasi Wings Shop",
          style: myTextTheme(color: MyColors.textBlack).titleSmall,
        ),
      ],
    );
  }

  Widget _buildEmailFormField(TextEditingController controller) {
    return TextFormField(
      controller: controller,
      keyboardType: TextInputType.emailAddress,
      style: TextStyle(color: MyColors.textBlack),
      decoration: const InputDecoration(
        labelText: "Email",
        hintText: "Masukkan email anda",
        suffixIcon: Padding(
          padding: EdgeInsets.only(right: 25),
          child: Icon(LineIcons.envelope),
        ),
      ),
      cursorColor: MyColors.primaryDark,
    );
  }

  Widget _buildPasswordFormField(TextEditingController controller) {
    return TextFormField(
      controller: controller,
      obscureText: true,
      style: TextStyle(color: MyColors.textBlack),
      decoration: const InputDecoration(
        labelText: "Password",
        hintText: "Masukkan password anda",
        suffixIcon: Padding(
          padding: EdgeInsets.only(right: 25),
          child: Icon(LineIcons.lock),
        ),
      ),
      cursorColor: MyColors.primaryDark,
    );
  }

  Widget _buildLoginButton(BuildContext context, LoginNotifier data) {
    final buttonEnabled = data.requestState != RequestState.loading;
    final buttonText = buttonEnabled ? 'Login' : 'Loading...';

    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: buttonEnabled
            ? () async {
                await data.fetchLogin();
                // if (res) {
                //   if (!mounted) return;
                //   context.router.push(const HomeRoute());
                // }
              }
            : null,
        style: ElevatedButton.styleFrom(
          foregroundColor: Colors.white,
          backgroundColor: buttonEnabled
              ? MyColors.primary
              : const Color(0xFFFDBD10), // Disabled color #FDBD10
          textStyle: const TextStyle(color: Colors.white),
        ),
        child: Text(buttonText),
      ),
    );
  }
}
