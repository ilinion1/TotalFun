import 'package:flame_audio/bgm.dart';
import 'package:shared_preferences/shared_preferences.dart';

class TOTAudioServiceIWO {
  final SharedPreferences sharedPreferences;
  final Bgm flameAudio;

  TOTAudioServiceIWO({
    required this.sharedPreferences,
    required this.flameAudio,
  });
  void initAudio() async {
    bool backgroundSoundActive =
        sharedPreferences.getBool("backgroundSound") ?? false;
    await flameAudio.play('Kalimba.mp3');

    if (!backgroundSoundActive) {
      await flameAudio.pause();
    }
  }
}
