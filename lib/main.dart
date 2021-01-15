import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:indo_news_bloc/app.dart';
import 'package:indo_news_bloc/blocs/blocs.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  HydratedBloc.storage = await HydratedStorage.build();
  Bloc.observer = SimpleBlocObserver();
  runApp(App());
}
