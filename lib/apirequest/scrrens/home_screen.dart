import 'package:flutter/material.dart';
import 'package:studentapp/apirequest/models/channel_models.dart';
import 'package:studentapp/apirequest/models/video_models.dart';
import 'package:studentapp/apirequest/scrrens/videoscreen.dart';
import 'package:studentapp/apirequest/services/apiservices.dart';

class Videoplayerscreen extends StatefulWidget {
  const Videoplayerscreen({super.key});

  @override
  State<Videoplayerscreen> createState() => _VideoplayerscreenState();
}

class _VideoplayerscreenState extends State<Videoplayerscreen> {
  Channel? _channel;
  bool _isloading = false;

  @override
  void initState() {
    // TODO: implement initState
    _initChannel();
  }

  _initChannel() async {
    Channel channel =
        await apiService.instance.fetchChannel('UCnocXD1MeH4DVPKCVtZHL7Q');
    setState(() {
      _channel = channel;
    });
  }

// profile pic
  _buildProfileInfo() {
    return Container(
      margin: const EdgeInsets.all(20.0),
      padding: const EdgeInsets.all(20.0),
      height: 100.0,
      decoration: const BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            offset: Offset(0, 1),
            blurRadius: 6.0,
          ),
        ],
      ),
      child: Row(
        children: <Widget>[
          CircleAvatar(
            backgroundColor: Colors.white,
            radius: 35.0,
            backgroundImage: NetworkImage(_channel!.profilePictureUrl),
          ),
          const SizedBox(width: 12.0),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  _channel!.title,
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 20.0,
                    fontWeight: FontWeight.w600,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
                Text(
                  '${_channel?.subscriberCount} subscribers',
                  style: TextStyle(
                    color: Colors.grey[600],
                    fontSize: 16.0,
                    fontWeight: FontWeight.w600,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  //video player
  _buildVideo(Video video) {
    return GestureDetector(
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(
          builder: (_) => VideoScreen(id: video.id),
        ),
      ),
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 5.0),
        padding: const EdgeInsets.all(10.0),
        height: 140.0,
        decoration: const BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              offset: Offset(0, 1),
              blurRadius: 6.0,
            ),
          ],
        ),
        child: Row(
          children: <Widget>[
            Image(
              width: 150.0,
              image: NetworkImage(video.thumbnailsUrl),
            ),
            const SizedBox(width: 10.0),
            Expanded(
              child: Text(
                video.title,
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 18.0,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  _loadMoreVideos() async {
    _isloading = true;
    List<Video> moreVideos = await apiService.instance
        .fetchVideosFromPlaylist(playlistId: _channel!.uploadPlaylistId);
    List<Video> allVideos = _channel!.videos..addAll(moreVideos);
    setState(() {
      _channel?.videos = allVideos;
    });
    _isloading = false;
  }

  @override
  Widget build(BuildContext context) {
    return _channel != null
        ? NotificationListener<ScrollNotification>(
            onNotification: (ScrollNotification scrollDetails) {
              if (!_isloading &&
                  _channel!.videos.length != int.parse(_channel!.videoCount) &&
                  scrollDetails.metrics.pixels ==
                      scrollDetails.metrics.maxScrollExtent) {
                _loadMoreVideos();
              }
              return false;
            },
            child: ListView.builder(itemBuilder: (BuildContext context, index) {
              if (index == 0) {
                return _buildProfileInfo();
              }
              Video video = _channel!.videos[index - 1];
              return _buildVideo(video);
            }),
          )
        : const Center(
            child: Text('loading'),
          );
  }
}
