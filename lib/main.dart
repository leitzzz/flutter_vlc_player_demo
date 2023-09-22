import 'package:flutter/material.dart';
import 'package:wakelock/wakelock.dart';
import 'package:flutter_vlc_player_demo/pages/player_flutter_vlc_player.dart';
import 'package:flutter_vlc_player_demo/pages/player_vlc_player.dart';
import 'package:flutter_vlc_player_demo/pages/videos.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Wakelock.enable();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'VLC Player Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      initialRoute: "/",
      routes: {
        '/': (BuildContext context) => const Videos(),
        '/player_flutter_vlc_player': (BuildContext context) =>
            const PlayerFlutterVlcPlayer(),
        '/player_vlc_player': (BuildContext context) => const PlayerVlcPlayer()
      },
    );
  }
}
