import 'package:flutter/material.dart';

class CustomRoute<T> extends MaterialPageRoute<T> {
  ///why super? => cuz these things should be forwarded to the parent class which is "MaterialPageRoute"
  ///ba " : "  initialize mikonim list ro
  CustomRoute({WidgetBuilder builder, RouteSettings settings})
      : super(builder: builder, settings: settings);

  @override
  Widget buildTransitions(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation, Widget child) {
    ///buildTransitions => controls how the page transition can be animated

    if (settings.name == '/') {
      ///settings.name == '/' => means the first page of app
      return child;
      ///cuz we don't want animate  the first page
    }
    return FadeTransition(
      opacity: animation,
      child: child,
    );
  }
}

class CustomPageTransitionBuilder extends PageTransitionsBuilder{

  ///<T> => stands for "type"
  @override
  Widget buildTransitions<T>(PageRoute<T> route ,BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation, Widget child) {
    ///buildTransitions => controls how the page transition can be animated

    if (route.settings.name == '/') {
      ///settings.name == '/' => means the first page of app
      return child;
      ///cuz we don't want animate  the first page
    }
    return FadeTransition(
      opacity: animation,
      child: child,
    );
  }
}
