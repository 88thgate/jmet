import 'package:trackandtrace/widgets/bottom_bar.dart';
import 'package:trackandtrace/widgets/carousel.dart';
import 'package:trackandtrace/widgets/testimonials_heading.dart';
import 'package:trackandtrace/widgets/jme_drawer.dart';
import 'package:trackandtrace/widgets/services_heading.dart';
import 'package:trackandtrace/widgets/services_tiles.dart';
import 'package:trackandtrace/widgets/floating_quick_access_bar.dart';
import 'package:trackandtrace/widgets/responsive.dart';
import 'package:trackandtrace/widgets/top_bar_contents.dart';
import 'package:flutter/material.dart';

class TrackandTrace extends StatefulWidget {
  const TrackandTrace({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _TrackandTraceState createState() => _TrackandTraceState();
}

class _TrackandTraceState extends State<TrackandTrace> {
  final ScrollController _scrollController = ScrollController();
  double _scrollPosition = 0;
  double _opacity = 0;

  _scrollListener() {
    setState(() {
      _scrollPosition = _scrollController.position.pixels;
    });
  }

  @override
  void initState() {
    _scrollController.addListener(_scrollListener);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    _opacity = _scrollPosition < screenSize.height * 0.40
        ? _scrollPosition / (screenSize.height * 0.40)
        : 1;

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: ResponsiveWidget.isSmallScreen(context)
          ? AppBar(
              backgroundColor: Colors.blueGrey.shade900.withOpacity(_opacity),
              elevation: 0,
              title: Text(
                'JME Transport',
                style: TextStyle(
                  color: Colors.blueGrey.shade100,
                  fontSize: 20,
                  fontFamily: 'Montserrat',
                  fontWeight: FontWeight.w400,
                  letterSpacing: 3,
                ),
              ),
            )
          : PreferredSize(
              preferredSize: Size(screenSize.width, 1000),
              child: TopBarContents(_opacity),
            ),
      drawer: const ExploreDrawer(),
      body: SingleChildScrollView(
        controller: _scrollController,
        physics: const ClampingScrollPhysics(),
        child: Column(
          children: [
            Stack(
              children: [
                SizedBox(
                  height: screenSize.height * 0.45,
                  width: screenSize.width,
                  child: Image.asset(
                    'assets/images/cover.jpg',
                    fit: BoxFit.cover,
                  ),
                ),
                Column(
                  children: [
                    FloatingQuickAccessBar(screenSize: screenSize),
                    Column(
                      children: [
                        FeaturedHeading(
                          screenSize: screenSize,
                        ),
                        FeaturedTiles(screenSize: screenSize)
                      ],
                    ),
                  ],
                )
              ],
            ),
            TestimonialHeading(screenSize: screenSize),
            const TestimonialCarousel(),
            SizedBox(height: screenSize.height / 10),
            const BottomBar(),
          ],
        ),
      ),
    );
  }
}
