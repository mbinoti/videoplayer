import 'package:videoplayer_app/video_repository.dart';

class VideoController {
  final VideoRepository repository;

  VideoController({required this.repository});

  List<String> getVideos() {
    return repository.fetchAllVideos();
  }
}
