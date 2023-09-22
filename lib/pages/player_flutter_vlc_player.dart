import 'package:flutter/material.dart';
import 'package:flutter_vlc_player/flutter_vlc_player.dart';

class PlayerFlutterVlcPlayer extends StatefulWidget {
  const PlayerFlutterVlcPlayer({super.key});

  @override
  State<PlayerFlutterVlcPlayer> createState() => _PlayerFlutterVlcPlayerState();
}

class _PlayerFlutterVlcPlayerState extends State<PlayerFlutterVlcPlayer> {
  late VlcPlayerController _videoPlayerController;

  @override
  void initState() {
    super.initState();
  }

  void _playVideo(String videoUrl) {
    _videoPlayerController = VlcPlayerController.network(
      hwAcc: HwAcc.full,
      videoUrl,
      autoPlay: true,
      options: VlcPlayerOptions(),
    );
  }

  @override
  void dispose() async {
    // await _videoPlayerController.stopRendererScanning();
    _videoPlayerController.pause();
    _videoPlayerController.dispose();
    // await _videoPlayerController.dispose();
    // await _videoViewController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final arguments =
        ModalRoute.of(context)!.settings.arguments as Map<String, String>;

    _playVideo(arguments['video_url']!);

    return Scaffold(
      body: VlcPlayer(
        controller: _videoPlayerController,
        aspectRatio: 16 / 9,
        placeholder: const Center(child: CircularProgressIndicator()),
      ),
    );
  }
}
