import 'package:flutter/material.dart';
import 'package:youtube_player_iframe/youtube_player_iframe.dart';

import 'main.dart';

class VideosPage extends StatefulWidget {
  const VideosPage({Key? key}) : super(key: key);

  @override
  State<VideosPage> createState() => _VideosPageState();
}

class _VideosPageState extends State<VideosPage> {
  // Define your YouTube video IDs here
  final List<String> videoIds = [
    'gCdwPtiNrvM',
    '3u6D2oPfcZU',
    '4baFtmMsWz0',
  ];

  late final List<YoutubePlayerController> controllers;
  int? selectedIndex;

  @override
  void initState() {
    super.initState();
    controllers = videoIds
        .map(
          (id) => YoutubePlayerController.fromVideoId(
        videoId: id,
        autoPlay: false,
        params: const YoutubePlayerParams(
          showControls: true,
          showFullscreenButton: true,
        ),
      ),
    )
        .toList();
    selectedIndex = null;
  }

  @override
  void dispose() {
    for (final c in controllers) {
      c.close();
    }
    super.dispose();
  }

  String thumbnailFor(String videoId) =>
      'https://img.youtube.com/vi/$videoId/maxresdefault.jpg';

  @override
  Widget build(BuildContext context) {
    final ButtonStyle navLinkStyle = TextButton.styleFrom(
      foregroundColor: Colors.black,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
      textStyle: const TextStyle(fontSize: 15),
      shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(14))),
    ).copyWith(
      overlayColor: WidgetStateProperty.all(const Color(0xFFE3D5E8)),
      foregroundColor: WidgetStateProperty.resolveWith<Color?>(
            (Set<WidgetState> states) {
          if (states.contains(WidgetState.hovered)) {
            return Theme.of(context).primaryColor;
          }
          return Colors.black;
        },
      ),
    );
    var wid = MediaQuery.of(context).size.width;
    var hei = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: appbgcol,
        foregroundColor: Colors.black,
        elevation: 1.0,
        toolbarHeight: 70,
        title: Row(children: [
          SizedBox(height: 70, width: 70, child: IconButton(onPressed: () => Navigator.pushNamed(context, '/'), icon: Image.asset("images/icon.jpg"))),
          const SizedBox(width: 5),
          const Text('Lectures', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24)),
        ]),
        actions: (hei<wid*0.9)?<Widget>[
          TextButton(
            onPressed: () => Navigator.pushNamed(context, '/'),
            style: navLinkStyle,
            child: const Text('Home'),
          ),
          TextButton(
            onPressed: () => Navigator.pushNamed(context, '/reviews'),
            style: navLinkStyle,
            child: const Text('Reviews'),
          ),
          TextButton(
            onPressed: () => Navigator.pushNamed(context, '/about'),
            style: navLinkStyle,
            child: const Text('About Me'),
          ),
          const SizedBox(width: 10),
          OutlinedButton(
            onPressed: () => Navigator.pushNamed(context, '/contact'),
            child: const Text('Contact'),
            style: OutlinedButton.styleFrom(
              foregroundColor: Colors.black,
              side: const BorderSide(color: Colors.black),
            ).copyWith(
              backgroundColor: WidgetStateProperty.resolveWith((states) {
                if (states.contains(WidgetState.hovered)) return Colors.grey.shade100;
                return null;
              }),
            ),
          ),
          const SizedBox(width: 10),
          ElevatedButton(
            onPressed: () => Navigator.pushNamed(context, '/login'),
            child: const Text('Sign Up'),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.black,
              foregroundColor: Colors.white,
            ).copyWith(
              backgroundColor: WidgetStateProperty.resolveWith((states) {
                if (states.contains(WidgetState.hovered)) return Colors.grey.shade800;
                return Colors.black;
              }),
            ),
          ),
          const SizedBox(width: 20),
        ]:<Widget>[SizedBox.shrink()],
      ),
      backgroundColor: bgcol,
      body:
      ListView.builder(
        itemCount: videoIds.length,
        padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 16),
        itemBuilder: (context, index) {
          final isSelected = index == selectedIndex;
          return Padding(
            padding: const EdgeInsets.only(bottom: 24),
            child: GestureDetector(
              onTap: () {
                setState(() {
                  if (selectedIndex != null && selectedIndex != index) {
                    controllers[selectedIndex!].pauseVideo();
                  }
                  // Tap to select or deselect the player
                  if (selectedIndex == index) {
                    controllers[index].pauseVideo();
                    selectedIndex = null;
                  } else {
                    selectedIndex = index;
                    controllers[index].playVideo();
                  }
                });
              },
              child: isSelected
                  ? SizedBox(
                height: 220,
                child: YoutubePlayer(controller: controllers[index]),
              )
                  : Stack(
                alignment: Alignment.center,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Image.network(
                      thumbnailFor(videoIds[index]),
                      width: 220*16/9,
                      height: 220,
                      fit: BoxFit.cover,
                      loadingBuilder: (context, child, progress) {
                        if (progress == null) return child;
                        return Container(
                          width: 220*16/9,
                          height: 220,
                          color: Colors.grey.shade200,
                          child: const Center(
                              child: CircularProgressIndicator()),
                        );
                      },
                      errorBuilder: (context, error, stackTrace) {
                        return Container(
                          width: 220*16/9,
                          height: 220,
                          color: Colors.grey.shade300,
                          child: const Center(
                              child: Icon(Icons.broken_image)),
                        );
                      },
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.black54,
                      borderRadius: BorderRadius.circular(32),
                    ),
                    padding: const EdgeInsets.all(8),
                    child: const Icon(Icons.play_arrow,
                        size: 48, color: Colors.white),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
