import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'package:videoplayer_app/video_controller.dart';
import 'package:videoplayer_app/video_repository.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Video Player Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MainPage(),
    );
  }
}

class MainPage extends StatelessWidget {
  final videoController = VideoController(repository: VideoRepository());

  @override
  Widget build(BuildContext context) {
    List<String> videos = videoController.getVideos();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter Video Player Demo'),
      ),
      body: ListView.builder(
        itemCount: videos.length,
        itemBuilder: (context, index) {
          return VideoPlayerItem(videoUrl: videos[index]);
        },
      ),
    );
  }
}

class VideoPlayerItem extends StatefulWidget {
  final String videoUrl;

  VideoPlayerItem({required this.videoUrl});

  @override
  _VideoPlayerItemState createState() => _VideoPlayerItemState();
}

class _VideoPlayerItemState extends State<VideoPlayerItem> {
  late final VideoPlayerController _videoPlayerController;
  late ChewieController _chewieController;

  @override
  void initState() {
    super.initState();
    _videoPlayerController =
        VideoPlayerController.networkUrl(Uri.parse(widget.videoUrl));
    _chewieController = ChewieController(
      videoPlayerController: _videoPlayerController,
      autoPlay: false,
      looping: false,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Chewie(
      controller: _chewieController,
    );
  }

  @override
  void dispose() {
    _videoPlayerController.dispose();
    _chewieController.dispose();
    super.dispose();
  }
}

class VideoList extends StatelessWidget {
  final videoController = VideoController(repository: VideoRepository());

  @override
  Widget build(BuildContext context) {
    List<String> videos = videoController.getVideos();
    return ListView.builder(
      itemCount: videos.length,
      itemBuilder: (context, index) {
        return VideoPlayerItem(videoUrl: videos[index]);
      },
    );
  }
}
