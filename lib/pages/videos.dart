import 'package:flutter/material.dart';

class Videos extends StatelessWidget {
  const Videos({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView(
      children: [
        ListTile(
          title: const Text("Austral Ec"),
          onTap: () {
            Navigator.pushNamed(context, '/player_flutter_vlc_player',
                arguments: {
                  'video_url':
                      'https://stmv3.voxtvhd.com.br/australtv/australtv/playlist.m3u8'
                });
          },
        ),
        ListTile(
          title: const Text("Latacunga Ec"),
          onTap: () {
            Navigator.pushNamed(context, '/player_vlc_player', arguments: {
              'video_url':
                  'https://ssh101.bozztv.com/ssh101/streamlatacungatv/playlist.m3u8'
            });
          },
        ),
      ],
    ));
  }
}
