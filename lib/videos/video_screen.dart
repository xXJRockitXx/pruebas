import 'package:better_player/better_player.dart';
import 'package:flutter/material.dart';

class VideoScreen extends StatefulWidget {
  const VideoScreen({Key? key}) : super(key: key);

  @override
  State<VideoScreen> createState() => _VideoScreenState();
}

class _VideoScreenState extends State<VideoScreen> {
  /*BetterPlayerController betterPlayerController =
      BetterPlayerController(betterPlayerConfiguration);*/

  //final url = "gs://demos-d97a5.appspot.com/Modulo_1/playa.mp4";
  final url =
      "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerBlazes.mp4";
  GlobalKey _betterPlayerKey = GlobalKey();
  BetterPlayerController? _betterPlayerController;

  @override
  void initState() {
    // TODO: implement initState
    BetterPlayerConfiguration betterPlayerConfiguration =
        BetterPlayerConfiguration(
            autoPlay: false, aspectRatio: 16 / 9, fit: BoxFit.contain);

    BetterPlayerDataSourceType type = BetterPlayerDataSourceType.network;

    BetterPlayerDataSource dataSource = BetterPlayerDataSource(type, url);

    _betterPlayerController = BetterPlayerController(betterPlayerConfiguration);

    _betterPlayerController!.setupDataSource(dataSource);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Example player"),
      ),
      body: AspectRatio(
        aspectRatio: 16 / 9,
        child: BetterPlayer(
            key: _betterPlayerKey, controller: _betterPlayerController!),
      ),
    );
  }
}
