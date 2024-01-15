import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moviedb/config/routes/routes.dart';
import 'package:moviedb/config/theme/app_themes.dart';
import 'package:moviedb/features/watchlist/presentation/blocs/watchlist_bloc/watchlist_bloc.dart';
import 'package:moviedb/injection_container.dart';

import 'injection_container.dart' as di;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
  runApp(
    BlocProvider(
      create: (context) => sl<WatchlistBloc>(),
      child: const MovieDbApp(),
    ),
  );
}

class MovieDbApp extends StatelessWidget {
  const MovieDbApp({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: AppTheme.darkColorScheme.primary,
    ));

    return MaterialApp(
      title: 'MovieDB',
      theme: AppTheme.darkTheme,
      onGenerateRoute: AppRoutes.onGenerateRoutes,
      debugShowCheckedModeBanner: false,
    );
  }
}
