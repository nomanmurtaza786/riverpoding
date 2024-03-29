import 'dart:ui' as local;

import 'package:appwrite/appwrite.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:superwizor/core/theme/theme.dart';
import 'package:superwizor/generated/l10n.dart';
import 'package:superwizor/local_persistence/local_storage.dart';
import 'package:superwizor/providers/router_provider.dart';

Client client = Client();
// For self signed certificates, only use for development
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await LocalStorage.instance.init();
  client
      .setEndpoint('http://localhost/v1')
      .setProject('superwizerApp')
      .setSelfSigned();

  runApp(const ProviderScope(child: MyApp()));
}

// GlobalWidgetsLocalizations supports left-right language supports
// instead of [S.delegate.supportedLocales] [L10n.all] can be used
class MyApp extends ConsumerWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final router = ref.read(routerProvider);
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return MaterialApp.router(
      supportedLocales: S.delegate.supportedLocales,
      localizationsDelegates: const [
        S.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      routerConfig: router,
      debugShowCheckedModeBanner: false,
      title: 'RiverPoding',
      theme: SuperwizorTheme.lightTheme(context),
    );
  }
}
