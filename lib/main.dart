import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:n1/tot_common_lnk/bloc/base_bloc.dart';
import 'package:n1/tot_common_lnk/tot_services_nqe/tot_audio_service_nqe.dart';
import 'package:n1/tot_common_lnk/tot_styles_tte/tot_app_theme_lnja.dart';
import 'package:flame/flame.dart';
import 'package:flame_audio/bgm.dart';
import 'package:flame_audio/flame_audio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:n1/tot_pages_nqw/tot_initial_for/tot_loading_page_iwr.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Flame.device.setPortraitUpOnly();

  final SharedPreferences sharedPreferences =
      await SharedPreferences.getInstance();

  Bgm flameAudio = FlameAudio.bgm;
  flameAudio.initialize();

  TOTAudioServiceIWO(
    sharedPreferences: sharedPreferences,
    flameAudio: flameAudio,
  ).initAudio();

  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider<BaseBloc>(
          create: (contextx) => BaseBloc(
            sharedPreferences: sharedPreferences,
          ),
        ),
      ],
      child: MultiProvider(
        providers: [
          Provider<SharedPreferences>(
            create: ((context) => sharedPreferences),
          ),
          Provider<Bgm>.value(value: flameAudio),
        ],
        child: const MyApp(),
      ),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      useInheritedMediaQuery: true,
      splitScreenMode: true,
      minTextAdapt: true,
      child: MaterialApp(
        theme: appTheme,
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        home: const TOTLoadingPagePOZ(),
      ),
    );
  }
}
