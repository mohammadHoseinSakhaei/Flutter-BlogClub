import 'package:blog_club/gen/assets.gen.dart';
import 'package:blog_club/main.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({Key? key}) : super(key: key);

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  static const int loginTab = 0;
  static const int signUpTab = 1;
  int selectedTabIndex = loginTab;
  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final tabTextStyle = TextStyle(
        color: theme.colorScheme.onPrimary,
        fontSize: 18,
        fontWeight: FontWeight.bold);
    return Scaffold(
        body: SafeArea(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(
                bottom: 32, top: 100, left: 16, right: 16),
            child: Assets.img.icons.lOGOPng.image(width: 120),
          ),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(32),
                      topRight: Radius.circular(32)),
                  color: theme.colorScheme.primary),
              child: Column(
                children: [
                  SizedBox(
                    height: 60,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        TextButton(
                            onPressed: () {
                              setState(() {
                                selectedTabIndex = loginTab;
                               
                              });
                            },
                            child: Text('login'.toUpperCase(),
                                style: tabTextStyle.apply(
                                    color: selectedTabIndex == loginTab
                                        ? Colors.white
                                        : Colors.white54))),
                        TextButton(
                            onPressed: () {
                              setState(() {
                                selectedTabIndex = signUpTab;
                                
                              });
                            },
                            child: Text('sign Up'.toUpperCase(),
                                style: tabTextStyle.apply(
                                    color: selectedTabIndex == signUpTab
                                        ? Colors.white
                                        : Colors.white54))),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        color: theme.colorScheme.surface,
                        borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(32),
                            topRight: Radius.circular(32)),
                      ),
                      child: SingleChildScrollView(
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(32, 48, 32, 32),
                          child: selectedTabIndex == loginTab ? _LoginScreen(theme: theme):_SignUpScreen(theme: theme),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    ));
  }
}

class _LoginScreen extends StatelessWidget {
  const _LoginScreen({
    Key? key,
    required this.theme,
  }) : super(key: key);

  final ThemeData theme;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Welcome back', style: theme.textTheme.headline4),
        const SizedBox(height: 8),
        Text(
          'sign in with your account',
          style: theme.textTheme.subtitle1!.apply(fontSizeFactor: 0.8),
        ),
        const TextField(decoration: InputDecoration(label: Text('Username'))),
        const SizedBox(height: 16),
        const PasswordTextField(),
        const SizedBox(
          height: 24,
        ),
        ElevatedButton(
            onPressed: () {
              Navigator.of(context).pushReplacement(CupertinoPageRoute(builder: (context) => const MainScreen()));
            },
            style: ButtonStyle(
                minimumSize: MaterialStateProperty.all(
                    Size(MediaQuery.of(context).size.width, 60)),
                shape: MaterialStateProperty.all(RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12)))),
            child: Text('login'.toUpperCase())),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Forgot your password?'),
            const SizedBox(width: 8),
            TextButton(onPressed: () {}, child: const Text('Reset here'))
          ],
        ),
        const SizedBox(
          height: 16,
        ),
        Center(
          child: Text(
            'or sign in with'.toUpperCase(),
            style: const TextStyle(letterSpacing: 2),
          ),
        ),
        const SizedBox(height: 16),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Assets.img.icons.google.image(width: 36, height: 36),
            const SizedBox(width: 24),
            Assets.img.icons.facebook.image(width: 36, height: 36),
            const SizedBox(width: 24),
            Assets.img.icons.twitter.image(width: 36, height: 36)
          ],
        )
      ],
    );
  }
}

class _SignUpScreen extends StatelessWidget {
  const _SignUpScreen({
    Key? key,
    required this.theme,
  }) : super(key: key);

  final ThemeData theme;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Welcome to blog club', style: theme.textTheme.headline4),
        const SizedBox(height: 8),
        Text(
          'please enter your information',
          style: theme.textTheme.subtitle1!.apply(fontSizeFactor: 0.8),
        ),
        const TextField(decoration: InputDecoration(label: Text('Fullname'))),
        const TextField(decoration: InputDecoration(label: Text('Username'))),
        const SizedBox(height: 16),
        const PasswordTextField(),
        const SizedBox(
          height: 24,
        ),
        ElevatedButton(
            onPressed: () {
              Navigator.of(context).pushReplacement(CupertinoPageRoute(builder: (context) => const MainScreen()));
            },
            style: ButtonStyle(
                minimumSize: MaterialStateProperty.all(
                    Size(MediaQuery.of(context).size.width, 60)),
                shape: MaterialStateProperty.all(RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12)))),
            child: Text('sign up'.toUpperCase())),
        const SizedBox(width: 8),
        const SizedBox(
          height: 16,
        ),
        Center(
          child: Text(
            'or sign Up with'.toUpperCase(),
            style: const TextStyle(letterSpacing: 2),
          ),
        ),
        const SizedBox(height: 16),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Assets.img.icons.google.image(width: 36, height: 36),
            const SizedBox(width: 24),
            Assets.img.icons.facebook.image(width: 36, height: 36),
            const SizedBox(width: 24),
            Assets.img.icons.twitter.image(width: 36, height: 36)
          ],
        )
      ],
    );
  }
}

class PasswordTextField extends StatefulWidget {
  const PasswordTextField({
    Key? key,
  }) : super(key: key);

  @override
  State<PasswordTextField> createState() => _PasswordTextFieldState();
}

class _PasswordTextFieldState extends State<PasswordTextField> {
  bool obscareText = true;
  @override
  Widget build(BuildContext context) {
    return TextField(
      obscureText: obscareText,
      enableSuggestions: false,
      autocorrect: false,
      decoration: InputDecoration(
        label: const Text('Password'),
        suffixIcon: TextButton(
          style: const ButtonStyle(
              tapTargetSize: MaterialTapTargetSize.shrinkWrap),
          onPressed: () {
            setState(() {
              obscareText = !obscareText;
            });
          },
          child: Text(obscareText ? 'show' : 'hide'),
        ),
      ),
    );
  }
}
