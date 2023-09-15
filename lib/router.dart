import 'package:challenge_day16/features/authentication/views/confirmation_code_screen.dart';
import 'package:challenge_day16/features/authentication/views/create_account_final_screen.dart';
import 'package:challenge_day16/features/authentication/views/create_account_screen.dart';
import 'package:challenge_day16/features/authentication/views/customize_experience_screen.dart';
import 'package:challenge_day16/features/authentication/views/initial_screen.dart';
import 'package:challenge_day16/features/authentication/views/interests_detail_screen.dart';
import 'package:challenge_day16/features/authentication/views/interests_screen.dart';
import 'package:challenge_day16/features/authentication/views/password_screen.dart';
import 'package:challenge_day16/features/camera/views/camera_screen.dart';
import 'package:challenge_day16/features/common/views/main_navigation_screen.dart';
import 'package:challenge_day16/features/write/views/write_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

final routerProvider = Provider((ref) {
  return GoRouter(
    initialLocation: "/",
    routes: [
      GoRoute(
        name: InitialScreen.routeName,
        path: InitialScreen.routeURL,
        builder: (context, state) => const InitialScreen(),
      ),
      GoRoute(
        name: CreateAccountScreen.routeName,
        path: CreateAccountScreen.routeURL,
        builder: (context, state) {
          return const CreateAccountScreen();
        },
      ),
      GoRoute(
        name: CustomizeExperienceScreen.routeName,
        path: CustomizeExperienceScreen.routeURL,
        builder: (context, state) {
          Map<String, String>? accountInfo;
          if (state.extra != null) {
            accountInfo = state.extra as Map<String, String>;
          }
          return CustomizeExperienceScreen(
            object: accountInfo,
          );
        },
      ),
      GoRoute(
        name: CreateAccountFinalScreen.routeName,
        path: CreateAccountFinalScreen.routeURL,
        builder: (context, state) {
          Map<String, String>? accountInfo;
          if (state.extra != null) {
            accountInfo = state.extra as Map<String, String>;
          }
          return CreateAccountFinalScreen(
            object: accountInfo,
          );
        },
      ),
      GoRoute(
        name: ConfirmationCodeScreen.routeName,
        path: ConfirmationCodeScreen.routeURL,
        builder: (context, state) {
          Map<String, String>? email;
          if (state.extra != null) {
            email = state.extra as Map<String, String>;
          }
          return ConfirmationCodeScreen(
            object: email,
          );
        },
      ),
      GoRoute(
        name: PasswordScreen.routeName,
        path: PasswordScreen.routeURL,
        builder: (context, state) => const PasswordScreen(),
      ),
      GoRoute(
        name: InterestsScreen.routeName,
        path: InterestsScreen.routeURL,
        builder: (context, state) => const InterestsScreen(),
      ),
      GoRoute(
        name: InterestsDetailScreen.routeName,
        path: InterestsDetailScreen.routeURL,
        builder: (context, state) {
          Map<String, List<String>>? category;
          if (state.extra != null) {
            category = state.extra as Map<String, List<String>>;
          }
          return InterestsDetailScreen(
            object: category,
          );
        },
      ),
      GoRoute(
        name: MainNavigationScreen.routeName,
        path: "/",
        builder: (context, state) {
          return const MainNavigationScreen(tab: "dashboard");
        },
      ),
      GoRoute(
        path: "/:tab(search|activity|profile|settings)",
        builder: (context, state) {
          final tab = state.pathParameters["tab"] ?? "";
          return MainNavigationScreen(tab: tab);
        },

      ),
      
      GoRoute(
        path: "/settings/:subTab(privacy)",
        builder: (context, state) {
          final subTab = state.pathParameters["subTab"] ?? "";
          return MainNavigationScreen(tab: subTab);
        },
      ),
      GoRoute(
        name: WriteScreen.routeName,
        path: WriteScreen.routeURL,
        pageBuilder: (context, state) {
          return const MaterialPage(
            child: WriteScreen(),
            fullscreenDialog: true,
          );
        },
      ),
      GoRoute(
        path: CameraScreen.routeURL,
        name: CameraScreen.routeName,
        pageBuilder: (context, state) =>
            CustomTransitionPage(
              transitionDuration: const Duration(milliseconds: 200),
              child: const CameraScreen(),
              transitionsBuilder: (context, animation, secondaryAnimation,
                  child) {
                final position = Tween(
                  begin: const Offset(0, 1),
                  end: Offset.zero,
                ).animate(animation);
                return SlideTransition(
                  position: position,
                  child: child,
                );
              },
            ),
      )
    ],
  );
});
