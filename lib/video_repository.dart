class VideoRepository {
  final List<String> videoUrls = [
    'https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4',
  ];

  List<String> fetchAllVideos() {
    return videoUrls;
  }
}
