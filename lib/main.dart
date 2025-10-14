import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_news_app/config/app_theme.dart';

import 'core/di/service_locator.dart';
import 'core/widgets/app_shell.dart';
import 'features/news/presentation/bloc/news_bloc.dart';

Future<void> main() async {
  await setupServiceLocator();
  runApp(const AzemNewsApp());
}

class AzemNewsApp extends StatelessWidget {
  const AzemNewsApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      home: MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => serviceLocator<NewsBloc>()),
        ],
        child: AppShell(),
      ),
    );
  }
}
