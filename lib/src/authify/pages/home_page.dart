import 'package:flutter/material.dart';
import 'package:gamezone/src/authify/pages/login_page.dart';

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

class LogoutButtonWidget extends StatelessWidget {
  final double screenHeight;
  final double screenWidth;

  const LogoutButtonWidget({
    super.key,
    required this.screenHeight,
    required this.screenWidth,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        side: BorderSide(
          width: 2.0,
          color: Color.fromRGBO(125, 191, 211, 1.0)
        ),
        backgroundColor: Colors.white,
        minimumSize: Size(screenWidth * 0.70, screenHeight * 0.05),
      ),
      onPressed: () {
        Navigator.of(context).pushReplacement(
          PageRouteBuilder(
            transitionDuration: Duration(milliseconds: 500),
            transitionsBuilder: (
                context,
                animation,
                secondaryAnimation,
                child,
                ) {
              return FadeTransition(
                opacity: animation,
                child: child,
              );
            },
            pageBuilder: (context, animation, secondaryAnimation) {
              return LoginPage();
            },
          ),
        );
      },
      child: Text(
        "LOGOUT",
        style: TextStyle(
          fontSize: 16.0,
          color: Color.fromRGBO(125, 191, 211, 1.0),
          letterSpacing: 1.0,
        ),
      ),
    );
  }
}

