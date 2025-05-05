import 'package:burnquest/services/auth_service.dart';
import 'package:burnquest/viewmodels/login_viewmodel.dart';
import 'package:burnquest/views/base_view.dart';
import 'package:burnquest/views/login_view.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => LoginViewModel(AuthService()),
        )
      ],
      child: MaterialApp(
        title: 'Login Page',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.blueAccent),
        ),
        debugShowCheckedModeBanner: false,
        home: const LoginView(),
      )
    );
  }
}

