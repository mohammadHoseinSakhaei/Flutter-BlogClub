import 'package:blog_club/data.dart';
import 'package:blog_club/gen/assets.gen.dart';
import 'package:blog_club/home.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);
    final posts = AppDatabase.posts;
    return Scaffold(
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AppBar(
              elevation: 0,
              backgroundColor: themeData.colorScheme.background.withOpacity(0),
              title: const Text('Profile'),
              actions: [
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.more_horiz_rounded),
                ),
                const SizedBox(width: 32)
              ],
            ),
            Stack(
              children: [
                Container(
                  margin: const EdgeInsets.fromLTRB(32, 0, 32, 32),
                  decoration: BoxDecoration(
                    color: themeData.colorScheme.surface,
                    borderRadius: BorderRadius.circular(16),
                    boxShadow: [
                      BoxShadow(
                        blurRadius: 10,
                        color:
                            themeData.colorScheme.onBackground.withOpacity(0.2),
                      ),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(24, 24, 24, 24),
                        child: Row(
                          children: [
                            ClipRRect(
                              child: Assets.img.stories.story8
                                  .image(width: 84, height: 84),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            const SizedBox(
                              width: 16,
                            ),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text('@joviedan'),
                                  const SizedBox(
                                    height: 4,
                                  ),
                                  Text('Jovi Daniel',
                                      style: themeData.textTheme.bodyText1!
                                          .copyWith(
                                              fontWeight: FontWeight.w700,
                                              fontSize: 15)),
                                  const SizedBox(
                                    height: 8,
                                  ),
                                  Text('UX Designer',
                                      style: themeData.textTheme.bodyText1!
                                          .apply(
                                              color: themeData
                                                  .colorScheme.primary)),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(32, 0, 32, 0),
                        child: Text('About me',
                            style: themeData.textTheme.headline6),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(32, 4, 32, 32),
                        child: Text(
                          'Madison Blackstone is a director of user experience design, with experience managing global teams.',
                          style: themeData.textTheme.bodyText1!
                              .copyWith(fontWeight: FontWeight.w200),
                        ),
                      ),
                      const SizedBox(height: 24)
                    ],
                  ),
                ),
                Positioned(
                  bottom: 32,
                  left: 96,
                  right: 96,
                  child: Container(
                    height: 32,
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          blurRadius: 20,
                          color: themeData.colorScheme.onBackground
                              .withOpacity(0.5),
                        ),
                      ],
                    ),
                  ),
                ),
                Positioned(
                  bottom: 0,
                  left: 64,
                  right: 64,
                  child: Container(
                    height: 68,
                    decoration: BoxDecoration(
                      color: themeData.colorScheme.primary,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Row(
                      children: [
                        Expanded(
                          flex: 1,
                          child: Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                                color: const Color(0xff2151CD)),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  '52',
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                      color: themeData.colorScheme.onPrimary),
                                ),
                                const SizedBox(
                                  height: 4,
                                ),
                                Text(
                                  'Post',
                                  style: themeData.textTheme.bodyText1!
                                      .copyWith(
                                          fontWeight: FontWeight.w200,
                                          color:
                                              themeData.colorScheme.onPrimary),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                '250',
                                style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: themeData.colorScheme.onPrimary),
                              ),
                              const SizedBox(
                                height: 4,
                              ),
                              Text(
                                'Following',
                                style: themeData.textTheme.bodyText1!.copyWith(
                                    fontWeight: FontWeight.w200,
                                    color: themeData.colorScheme.onPrimary),
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                '4.5k',
                                style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: themeData.colorScheme.onPrimary),
                              ),
                              const SizedBox(
                                height: 4,
                              ),
                              Text(
                                'Followers',
                                style: themeData.textTheme.bodyText1!.copyWith(
                                    fontWeight: FontWeight.w200,
                                    color: themeData.colorScheme.onPrimary),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
            Container(
              margin: const EdgeInsets.fromLTRB(0, 42, 0, 0),
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(32),
                  topRight: Radius.circular(32),
                ),
                boxShadow: [
                  BoxShadow(
                      blurRadius: 20,
                      color:
                          themeData.colorScheme.onBackground.withOpacity(0.1))
                ],
                color: themeData.colorScheme.surface,
              ),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(32, 32, 32, 16),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Expanded(
                          child: Text(
                            'My Post',
                            style: themeData.textTheme.headline6,
                          ),
                        ),
                        Assets.img.icons.grid.image(),
                        const SizedBox(
                          width: 16,
                        ),
                        Assets.img.icons.table.image(),
                      ],
                    ),
                  ),
                  for (int a = 0; a < posts.length; a++) Post(post: posts[a]),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
