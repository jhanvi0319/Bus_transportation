import 'package:buenos_transportation/providers/stateSettingProvider/state_setting_provider.dart';
import 'package:buenos_transportation/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import 'responsiveBloc/size_config.dart';
import 'screens/splashScreen/splash_screen.dart';

void main() {
  // runApp(DevicePreview(builder: (context) => const MyApp()));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
    return LayoutBuilder(builder: (context, constraints) {
      return OrientationBuilder(builder: (context, orientation) {
        SizeConfig().init(constraints, orientation);
        return ChangeNotifierProvider(
          create: (context) => StateSettingProvider(),
          child: MaterialApp(
            theme: ThemeData(
                backgroundColor: Colors.grey.shade300,
                primaryColor: theme.redColor,
                accentColor: theme.redColor,
                colorScheme: ColorScheme.light().copyWith(
                    onPrimary: Colors.white,
                    onBackground: Colors.grey.shade600,
                    primary: theme.redColor,
                    background: Colors.grey.shade600)),
            debugShowCheckedModeBanner: false,
            home: const SplashScreen(),
          ),
        );
      });
    });
  }
}
