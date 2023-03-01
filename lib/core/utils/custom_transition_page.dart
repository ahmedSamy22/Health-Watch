import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

CustomTransitionPage buildPageWithSlideTransition<T>({
  required BuildContext context,
  required GoRouterState state,
  required Widget child,
}) {
  return CustomTransitionPage<T>(
      key: state.pageKey,
      child: child,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        var tween = Tween<Offset>(
          begin: const Offset(1, 0),
          end: Offset.zero,
        );

        return SlideTransition(
          position: animation.drive(tween),
          child: child,
        );
      });
}

CustomTransitionPage buildPageWithScaleTransition<T>({
  required BuildContext context,
  required GoRouterState state,
  required Widget child,
}) {
  return CustomTransitionPage<T>(
      key: state.pageKey,
      child: child,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        var tween = Tween(
          begin: 0.0,
          end: 1.0,
        );

        //   var curve = CurvedAnimation(parent: animation, curve: Curves.bounceIn);

        return ScaleTransition(
          scale: animation.drive(tween),
          child: child,
        );
      });
}

CustomTransitionPage buildPageWithFadeTransition<T>({
  required BuildContext context,
  required GoRouterState state,
  required Widget child,
}) {
  return CustomTransitionPage<T>(
      key: state.pageKey,
      child: child,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        //var curve = CurvedAnimation(parent: animation, curve: Curves.bounceIn);
        return FadeTransition(
          opacity: animation,
          child: child,
        );
      });
}

CustomTransitionPage buildPageWithFadeAndScaleTransition<T>({
  required BuildContext context,
  required GoRouterState state,
  required Widget child,
}) {
  return CustomTransitionPage<T>(
      key: state.pageKey,
      child: child,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        var tween = Tween(
          begin: 0.0,
          end: 1.0,
        );

        return FadeTransition(
          opacity: animation,
          child: ScaleTransition(
            scale: animation.drive(tween),
            child: child,
          ),
        );
      });
}
