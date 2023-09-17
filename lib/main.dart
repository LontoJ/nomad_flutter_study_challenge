import 'package:challenge_day16/constants/sizes.dart';
import 'package:challenge_day16/features/setting/repos/setting_repo.dart';
import 'package:challenge_day16/features/setting/view_models/setting_view_model.dart';
import 'package:challenge_day16/firebase_options.dart';
import 'package:challenge_day16/router.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await Hive.initFlutter();
  final Box box = await Hive.openBox('twitter_box');
  final settingRepository = SettingRepository(box);
  runApp(
    ProviderScope(
      overrides: [
        settingProvider.overrideWith(() => SettingViewModel(settingRepository))
      ],
      child: const TwitterApp(),
    ),
  );
}

class TwitterApp extends ConsumerWidget {
  const TwitterApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp.router(
      routerConfig: ref.watch(routerProvider),
      debugShowCheckedModeBanner: false,
      title: 'Twitter Clone',
      themeMode: ref.watch(settingProvider).isDarkMode
          ? ThemeMode.dark
          : ThemeMode.light,
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
        primaryColor: const Color(0xFF4F98E9),
        splashColor: Colors.transparent,
        useMaterial3: true,
        appBarTheme: const AppBarTheme(
          foregroundColor: Colors.black,
          backgroundColor: Colors.white,
          surfaceTintColor: Colors.white,
          elevation: 0,
          titleTextStyle: TextStyle(
            color: Colors.black,
            fontSize: Sizes.size16 + Sizes.size2,
            fontWeight: FontWeight.w600,
          ),
        ),
        textTheme: Typography.blackMountainView,
        textSelectionTheme: const TextSelectionThemeData(
          selectionColor: Colors.transparent, // 선택 배경색을 투명하게 설정
        ),
        inputDecorationTheme: InputDecorationTheme(
          labelStyle: const TextStyle(
            fontSize: Sizes.size24,
          ),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(
              color: Colors.grey.shade400,
            ),
          ),
        ),
        tabBarTheme: const TabBarTheme(
          labelColor: Colors.black,
          indicatorColor: Colors.black,
        ),
      ),
      darkTheme: ThemeData(
        scaffoldBackgroundColor: Colors.black,
        primaryColor: const Color(0xFF4F98E9),
        splashColor: Colors.transparent,
        useMaterial3: true,
        appBarTheme: const AppBarTheme(
          foregroundColor: Colors.black,
          backgroundColor: Colors.white,
          surfaceTintColor: Colors.white,
          elevation: 0,
          titleTextStyle: TextStyle(
            color: Colors.white,
            fontSize: Sizes.size16 + Sizes.size2,
            fontWeight: FontWeight.w600,
          ),
        ),
        textTheme: Typography.whiteMountainView,
        textSelectionTheme: const TextSelectionThemeData(
          selectionColor: Colors.transparent, // 선택 배경색을 투명하게 설정
        ),
        inputDecorationTheme: InputDecorationTheme(
          labelStyle: const TextStyle(
            fontSize: Sizes.size24,
          ),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(
              color: Colors.grey.shade400,
            ),
          ),
        ),
        tabBarTheme: const TabBarTheme(
          labelColor: Colors.white,
          indicatorColor: Colors.white,
        ),
      ),
    );
  }
}
