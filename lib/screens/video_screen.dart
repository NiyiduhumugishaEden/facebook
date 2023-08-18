import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:my_new_app/widgets/show_screen.dart';
import 'package:my_new_app/widgets/videos.dart';


class VideoScreen extends StatefulWidget {
  @override
  _VideoScreenState createState() => _VideoScreenState();
}

class _VideoScreenState extends State<VideoScreen> {
  int selectedVideoIndex = 0;

    final List<VideoInfo> videos = [
    VideoInfo('Home', Icons.video_library),
    VideoInfo('Live', Icons.zoom_in),
    VideoInfo('Reels', Icons.video_chat),
    VideoInfo('Show', Icons.show_chart),
    VideoInfo('Explore', Icons.explore),
    VideoInfo('Saved Videos', Icons.saved_search),
  ];

  List<Widget> contentWidgets = [
    Videos(), // Create HomeScreen widget
    LiveScreen(), // Create LiveScreen widget
    Scaffold(),
    Scaffold(),
    Scaffold(),
    Scaffold()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          Gap(4),
          Expanded(
            flex: 1,
            child: Container(
              color: Colors.grey[200],
              child: ListView.builder(
                itemCount: videos.length,
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      Gap(20),
                      ListTile(
                        leading: Icon(
                          videos[index].icon,
                          color: selectedVideoIndex == index
                              ? Colors.blue
                              : Colors.black45,
                          size: 32,
                        ),
                        title: Text(
                          videos[index].label,
                          style:
                              TextStyle(fontSize: 20, color: Colors.black45),
                        ),
                        onTap: () {
                          setState(() {
                            selectedVideoIndex = index;
                          });
                          Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => contentWidgets[index],
                          ));
                        },
                      ),
                    ],
                  );
                },
              ),
            ),
          ),
          // Main content outside sidebar
          Expanded(
            flex: 3,
            child: Center(
              child: contentWidgets[selectedVideoIndex],
            ),
          ),
        ],
      ),
    );
  }
}

class VideoInfo {
  final String label;
  final IconData icon;

  VideoInfo(this.label, this.icon);
}
