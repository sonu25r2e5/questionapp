class Video {
  var id;
  var title;
  var thumbnailsUrl;
  final String? channelTitle;
  Video({
    required this.id,
    required this.title,
    required this.thumbnailsUrl,
    required this.channelTitle,
  });

  factory Video.fromMap(Map<String, dynamic> snippet) {
    return Video(
      id: snippet['resourceId']['videoId'],
      title: snippet['title'],
      thumbnailsUrl: snippet['thumbnails']['high']['url'],
      channelTitle: snippet['channelTitle'],
    );
  }
}
