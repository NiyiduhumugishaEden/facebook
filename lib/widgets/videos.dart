import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class Videos extends StatefulWidget {
  @override
  _VideosState createState() => _VideosState();
}

class _VideosState extends State<Videos> {
  List<String> videoUrls = [
    'sample_video4.mp4',
    'sample_video3.mp4',
    'sample_video2.mp4',
    'sample_video.mp4',
    // Add more video URLs here
  ];

  List<VideoPlayerController> videoControllers = [];
  VideoPlayerController? currentVideoController;

  @override
  void initState() {
    super.initState();
    for (var url in videoUrls) {
      var controller = VideoPlayerController.asset(url)
        ..initialize().then((_) {
          // Ensure the first frame is shown
          setState(() {});
        });
      videoControllers.add(controller);
    }
  }

  @override
  void dispose() {
    for (var controller in videoControllers) {
      controller.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: videoControllers.length,
        itemBuilder: (context, index) {
          return VideoPlayerWidget(
            videoController: videoControllers[index],
            videoUrl: videoUrls[index],
            isCurrentVideo: currentVideoController == videoControllers[index],
            onTap: () {
              setState(() {
                if (currentVideoController != null) {
                  currentVideoController!.pause();
                }
                currentVideoController = videoControllers[index];
              });
            },
          );
        },
      ),
    );
  }
}

class VideoPlayerWidget extends StatefulWidget {
  final VideoPlayerController videoController;
  final String videoUrl;
  final bool isCurrentVideo;
  final VoidCallback onTap;

  VideoPlayerWidget({
    required this.videoController,
    required this.videoUrl,
    required this.isCurrentVideo,
    required this.onTap,
  });

  @override
  _VideoPlayerWidgetState createState() => _VideoPlayerWidgetState();
}

class _VideoPlayerWidgetState extends State<VideoPlayerWidget> {
  late bool _isPlaying;
  bool _isMuted = false;
  int _likes = 0;
  int _shares = 0;

  @override
  void initState() {
    super.initState();
    _isPlaying = widget.isCurrentVideo;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      child: Column(
        children: [
          AspectRatio(
            aspectRatio: 16 / 9,
            child: FittedBox(
              fit: BoxFit.contain,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Container(
                    width: 200,
                    height: 200,
                    child: VideoPlayer(widget.videoController),
                  ),
                  if (!_isPlaying)
                    IconButton(
                      icon: Icon(Icons.play_arrow),
                      onPressed: () {
                        setState(() {
                          widget.videoController.play();
                          _isPlaying = true;
                        });
                      },
                    ),
                ],
              ),
            ),
          ),
          Row(
            children: [
              IconButton(
                icon: Icon(_isMuted ? Icons.volume_off : Icons.volume_up),
                onPressed: () {
                  setState(() {
                    _isMuted = !_isMuted;
                    widget.videoController.setVolume(_isMuted ? 0.0 : 1.0);
                  });
                },
              ),
              IconButton(
                icon: Icon(Icons.thumb_up),
                onPressed: () {
                  setState(() {
                    _likes++;
                  });
                },
              ),
              Text('$_likes Likes'),
              IconButton(
                icon: Icon(Icons.share),
                onPressed: () {
                  setState(() {
                    _shares++;
                  });
                },
              ),
              Text('$_shares Shares'),
              Text('Video Length: ${widget.videoController.value.duration.inSeconds} seconds'),
            ],
          ),
          
        ],
      ),
    );
  }

  @override
  void dispose() {
    widget.videoController.dispose();
    super.dispose();
  }
}

