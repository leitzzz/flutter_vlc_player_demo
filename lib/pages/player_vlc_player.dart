import 'package:flutter/material.dart';
import 'package:vlc_flutter/vlcplayer.dart';

class PlayerVlcPlayer extends StatefulWidget {
  const PlayerVlcPlayer({super.key});

  @override
  State<PlayerVlcPlayer> createState() => _PlayerState();
}

class _PlayerState extends State<PlayerVlcPlayer> {
  late VLCController _controller;
  late String playingUrl;

  @override
  void initState() {
    _controller = VLCController(args: ["-vvv"]);
    /*
  final VLCController _controller = VLCController(args: [
    "-vvv",
    '--network-caching=300',
    '--live-caching=300',
    '--clock-jitter=10',
    '--clock-synchro=10',
  ]);
   */

    _controller.onPlayerState.listen((state) {
      // response example: VLCState.Buffering, VLCState.Playing, VLCState.Opening, VLCState.Ended, VLCState.Stopped, VLCState.Error
      // print("debug: ---[$state]-- ");

      // restart video if it ends suddenly
      if (state == VLCState.Ended ||
          // state == VLCState.Stopped ||
          state == VLCState.Error) {
        _controller.setDataSource(uri: playingUrl);
        _controller.play();
      }
    });

    super.initState();
  }

  void _playVideo(String videoUrl) {
    playingUrl = videoUrl;
    _controller.setDataSource(uri: videoUrl);
    _controller.play(); // alternative:  _controller.play(uri: videoUrl);
  }

  @override
  void dispose() async {
    // _controller.pause();
    _controller.dispose();
    // await _videoPlayerController.stopRendererScanning();
    // _videoPlayerController.pause();
    // _videoPlayerController.dispose();
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
      body: AspectRatio(
        aspectRatio: 16 / 9,
        child: VLCVideoWidget(
          controller: _controller,
        ),
      ),
    );
  }
}
