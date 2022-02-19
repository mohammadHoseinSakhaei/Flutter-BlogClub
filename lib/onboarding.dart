import 'package:blog_club/auth.dart';
import 'package:blog_club/data.dart';
import 'package:blog_club/home.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'gen/assets.gen.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({Key? key}) : super(key: key);

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  final PageController pageController = PageController();
  final onBoardingItems = AppDatabase.onBoardingItems;
  int page = 0;
  
  @override
  void initState() {
    pageController.addListener(() {
      if (pageController.page!.round() != page) {
        setState(() {
          page = pageController.page!.round();
        });
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);

    return Scaffold(
      backgroundColor: theme.colorScheme.background,
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(
                    top: 32, bottom: 8, left: 32, right: 32),
                child: Assets.img.background.imagetiles.image(),
              ),
            ),
            Container(
              height: 260,
              decoration: BoxDecoration(
                color: theme.colorScheme.surface,
                boxShadow: [
                  BoxShadow(
                      blurRadius: 20, color: Colors.black.withOpacity(0.1))
                ],
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(32),
                    topRight: Radius.circular(32)),
              ),
              child: Column(
                children: [
                  Expanded(
                      child: PageView.builder(
                          controller: pageController,
                          itemCount: onBoardingItems.length,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: const EdgeInsets.all(23),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(onBoardingItems[index].title,
                                      style: theme.textTheme.headline5),
                                  const SizedBox(height: 24),
                                  Text(onBoardingItems[index].description,
                                      style: theme.textTheme.subtitle1!
                                          .apply(fontSizeFactor: 0.8)),
                                ],
                              ),
                            );
                          })),
                  Container(
                    height: 60,
                    padding: EdgeInsets.only(left: 32, right: 32, bottom: 8),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SmoothPageIndicator(
                          controller: pageController,
                          count: onBoardingItems.length,
                          effect: ExpandingDotsEffect(
                              dotWidth: 8,
                              dotHeight: 8,
                              activeDotColor: theme.colorScheme.primary,
                              dotColor:
                                  theme.colorScheme.primary.withOpacity(0.1)),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            if(page == onBoardingItems.length-1){
                                Navigator.of(context).pushReplacement(CupertinoPageRoute(builder: (context){
                                    return AuthScreen();
                                }));
                            } else {
                              pageController.animateToPage(page+1, duration: const Duration(milliseconds: 500), curve: Curves.decelerate);
                            }
                          },
                          style: ButtonStyle(
                              minimumSize:
                                  MaterialStateProperty.all(const Size(84, 60)),
                              shape: MaterialStateProperty.all(
                                  RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.circular(12)))),
                          child: Icon(page == onBoardingItems.length - 1
                              ? CupertinoIcons.check_mark
                              : CupertinoIcons.arrow_right),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
