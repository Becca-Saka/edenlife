import 'package:eden/app/app_router.dart';
import 'package:eden/data/providers/auth_provider.dart';
import 'package:eden/data/providers/order_provider.dart';
import 'package:eden/data/services/ably_service.dart';
import 'package:eden/data/services/auth_services.dart';
import 'package:eden/firebase_options.dart';
import 'package:eden/shared/app_text_style.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => AuthProvider(authService: AuthService()),
        ),
        ChangeNotifierProvider(
          create: (context) => OrderProvider(ablyService: AblyService()),
        ),
      ],
      child: MaterialApp.router(
        routerConfig: AppRouter.router,
        theme: ThemeData(fontFamily: AppTextStyle.fontFamily),
      ),
    );
  }
}
