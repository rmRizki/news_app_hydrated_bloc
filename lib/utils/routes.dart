import 'package:flutter/widgets.dart';
import 'package:indo_news_bloc/ui/screens/screens.dart';

final Map<String, WidgetBuilder> appRoutes = <String, WidgetBuilder>{
  "/": (BuildContext context) => MainScreen(),
  "/detail": (BuildContext context) => DetailScreen(),
};
