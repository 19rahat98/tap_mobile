import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:tapme/config/theme.dart';
import 'package:tapme/core/sevices/di_locator.dart' as di_locator;
import 'package:tapme/features/counter/counter.dart';
import 'package:tapme/features/language_logic/data/models/language.dart';
import 'package:tapme/features/language_logic/presentation/bloc/local_language_bloc.dart';
import 'package:tapme/l10n/l10n.dart';

late PackageInfo packageInfo;

Future<void> mainDelegate() async {
  WidgetsFlutterBinding.ensureInitialized();

  /// информация о дивайсе
  packageInfo = await PackageInfo.fromPlatform();

  /// установка ориентации
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  /// инициализация DI
  di_locator.initLocator();
}

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<LocalLanguageBloc>(
          create: (context) => LocalLanguageBloc()..add(
              ToggleLanguageEvent(Languages.languages[1])),
        ),
      ],
      child: BlocBuilder<LocalLanguageBloc, LocalLanguageState>(
        builder: (context, localLanguageState) {
          if(localLanguageState is LanguageLoaded) {
            return MaterialApp(
              theme: AppTheme.defaultTheme,
              localizationsDelegates: const [
                AppLocalizations.delegate,
                GlobalMaterialLocalizations.delegate,
              ],
              locale: localLanguageState.locale,
              supportedLocales: AppLocalizations.supportedLocales,
              home: const CounterPage(),
            );
          }
          return const SizedBox.shrink();
        },
      ),
    );
  }
}
