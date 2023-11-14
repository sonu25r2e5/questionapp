class Video {
  final String id;
  final String title;
  final String thumbnailsUrl;
  final String channelTitle;
  Video(
    this.id,
    this.title,
    this.thumbnailsUrl,
    this.channelTitle,
  );

  factory Video.fromMap(Map<String, dynamic> snippet) {
    return Video(
      snippet['resourceId']['videoId'],
      snippet['title'],
      snippet['thumbnails']['high']['url'],
      snippet['channelTitle'],
    );
  }
}
