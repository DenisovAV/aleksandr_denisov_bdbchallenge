import 'package:bdb_challenge/firebase_options.dart';
import 'package:bdb_challenge/model/hotel.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:video_player/video_player.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Beautiful Hotels',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: HotelCollectionReference().reference.get(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return MoviesList(
              hotels: snapshot.data?.docs.map((e) => e.data()).toList() ?? [],
            );
          } else {
            return const SizedBox();
          }
        },
      ),
    );
  }
}

class MoviesList extends StatefulWidget {
  final List<Hotel> hotels;

  const MoviesList({super.key, required this.hotels});

  @override
  State<MoviesList> createState() => _MoviesListState();
}

class _MoviesListState extends State<MoviesList> {
  final _pageController = PageController();
  final _controllers = <VideoPlayerController>[];

  void _listener() {
    final position = _pageController.page?.round();
    if (position != null && !_controllers[position].value.isPlaying) {
      _controllers[position].play();
      if (_pageController.position.userScrollDirection == ScrollDirection.reverse) {
        _controllers[position - 1].pause();
      } else {
        _controllers[position + 1].pause();
      }
    }
  }

  void _initVideo(VideoPlayerController controller, bool shouldPlay) async {
    await controller.initialize();
    await controller.setLooping(true);
    if (shouldPlay) controller.play();
  }

  @override
  void initState() {
    super.initState();
    _pageController.addListener(_listener);
    for (var hotel in widget.hotels) {
      final controller = VideoPlayerController.network(hotel.link);
      _initVideo(controller, widget.hotels.indexOf(hotel) == 0);
      _controllers.add(controller);
    }
  }

  @override
  Widget build(BuildContext context) {
    return PageView(
        controller: _pageController,
        scrollDirection: Axis.vertical,
        children: widget.hotels
            .map(
              (e) => VideoPage(
                title: e.name,
                controller: _controllers[widget.hotels.indexOf(e)],
              ),
            )
            .toList());
  }

  @override
  void dispose() {
    _pageController.removeListener(_listener);
    _pageController.dispose();
    for (var c in _controllers) {
      c.dispose();
    }
    super.dispose();
  }
}

class VideoPage extends StatefulWidget {
  final VideoPlayerController controller;
  final String title;

  const VideoPage({required this.controller, required this.title, super.key});

  @override
  VideoPageState createState() => VideoPageState();
}

class VideoPageState extends State<VideoPage> {
  bool isMuted = false;

  @override
  void initState() {
    super.initState();
    isMuted = widget.controller.value.volume == 0;
  }

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      VideoPlayer(widget.controller),
      Positioned(
        left: 14.0,
        bottom: 30.0,
        child: Text(
          widget.title,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.w600,
            fontFamily: 'SFPro',
          ),
        ),
      ),
      Positioned(
        right: 0.0,
        bottom: 21.0,
        child: ElevatedButton(
          onPressed: () {
            setState(() {
              if (isMuted) {
                widget.controller.setVolume(100);
              } else {
                widget.controller.setVolume(0);
              }
              isMuted = !isMuted;
            });
          },
          style: ElevatedButton.styleFrom(
            fixedSize: const Size(16, 16),
            shape: const CircleBorder(),
            shadowColor: Colors.transparent,
            backgroundColor: Colors.black26,
          ),
          child: Icon(
            isMuted ? Icons.volume_down : Icons.volume_up,
            size: 12.0,
          ),
        ),
      ),
    ]);
  }
}
