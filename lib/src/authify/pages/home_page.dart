import 'package:flutter/material.dart';
import 'package:gamezone/src/authify/widgets/home_page_widgets.dart';
import 'package:gamezone/src/authify/widgets/login_page_widgets.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with SingleTickerProviderStateMixin {

  late double screenHeight;
  late double screenWidth;

  late AnimationController _controller;
  late Animation<double> _scaleAnimation;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    screenHeight = MediaQuery.of(context).size.height;
    screenWidth = MediaQuery.of(context).size.width;
  }

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 1500),
      vsync: this,
    );

    _scaleAnimation = TweenSequence<double>([
      TweenSequenceItem(
        tween: Tween(
          begin: 0.0,
          end: 1.1,
        ).chain(CurveTween(curve: Curves.easeOut)),
        weight: 40,
      ),
      TweenSequenceItem(
        tween: Tween(
          begin: 1.1,
          end: 0.9,
        ).chain(CurveTween(curve: Curves.easeInOut)),
        weight: 30,
      ),
      TweenSequenceItem(
        tween: Tween(
          begin: 0.9,
          end: 1.0,
        ).chain(CurveTween(curve: Curves.easeOutBack)),
        weight: 30,
      ),
    ]).animate(_controller);

    _controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Align(
            alignment: Alignment.center,
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                SizedBox(height: screenHeight * 0.21),
                AvatarWidget(
                  screenHeight: screenHeight,
                  screenWidth: screenWidth,
                  animation: _scaleAnimation,
                ),
                SizedBox(height: screenHeight * 0.02),
                const Text(
                  "Jhon Doe",
                  style: TextStyle(
                    color: Color.fromRGBO(125, 191, 211, 1.0),
                    fontSize: 35.0,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            bottom: screenHeight * 0.22,
            left: (screenWidth - screenWidth * 0.70) / 2,
            child: LogoutButtonWidget(
              screenHeight: screenHeight,
              screenWidth: screenWidth,
            ),
          ),
        ],
      ),
    );
  }
}